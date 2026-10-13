#!/usr/bin/env bash
# 交換後の確認用（読み取りのみ、sudo不要）。
# 使い方: bash hardware/replace/verify-after.sh
# 出力:   hardware/replace/after-<日付>.txt に保存し、画面にも表示する。
set -u
cd "$(dirname "$0")" || exit 1
out="after-$(date +%Y%m%d-%H%M).txt"

{
echo "# 交換後確認  $(date '+%Y-%m-%d %H:%M %Z')"
echo
echo "## 1. CPU（期待: Intel(R) Xeon(R) W-2235, 6コア/12スレッド, stepping 7）"
grep -m1 'model name' /proc/cpuinfo
lscpu | grep -E '^(CPU\(s\)|Core|Thread|Stepping|CPU max MHz|ステッピング|CPU 最大|ソケットあたりのコア数|コアあたりのスレッド数)'
grep -m1 microcode /proc/cpuinfo
echo
echo "## 2. DMI（期待: BIOS P61 v02.97 以上）"
for f in product_name board_name bios_version bios_date; do echo "$f=$(cat /sys/class/dmi/id/$f)"; done
echo
echo "## 3. メモリ（期待: 4枚または8枚、各8192 MiB。種別・SECDED表示はドライバ固定値）"
free -g | head -2
for d in /sys/devices/system/edac/mc/mc*/dimm*; do
  [ -e "$d" ] && echo "$(cat $d/dimm_label)  $(cat $d/size) MiB"
done
echo "(実動作速度は sudo dmidecode -t 17 の 'Configured Memory Speed' で確認。期待: 2933 MT/s、2666品なら2666)"
echo
echo "## 4. PCIe スロット（期待: Slot 1 配下に Quadro P2000 のまま、Slot 6・7 配下に NVMe 各1台）"
for s in /sys/bus/pci/slots/[0-9]*; do
  n=$(basename "$s"); a=$(cat "$s/address")
  sec=$(ls "/sys/bus/pci/devices/${a}.0/pci_bus/" 2>/dev/null | head -1)   # 配下バス番号 (例 0000:21)
  desc=""
  if [ -n "$sec" ]; then
    desc=$(ls /sys/bus/pci/devices/ | grep "^${sec}:" | head -1 | xargs -r -I{} lspci -s {} 2>/dev/null)
  fi
  w=$(cat /sys/bus/pci/devices/${a}.0/current_link_width 2>/dev/null)
  sp=$(cat /sys/bus/pci/devices/${a}.0/current_link_speed 2>/dev/null)
  echo "slot $n  root $a.0  link ${w:-?}x ${sp:-?}  -> ${desc:-（配下機器なし）}"
done
echo
echo "## 5. GPU（期待: Quadro P2000, 5120 MiB、変更なし）"
nvidia-smi --query-gpu=index,name,memory.total,driver_version,power.limit,pcie.link.gen.current,pcie.link.width.current --format=csv 2>&1
echo
echo "## 6. NVMe（期待: SAMSUNG 512GB と WD Blue SN5100 2TB の2台、各 8.0 GT/s x4）"
for n in /sys/class/nvme/nvme*; do
  dev=$(readlink -f "$n/device")
  echo "$(basename $n): $(cat $n/model | sed 's/ *$//')  fw=$(cat $n/firmware_rev | sed 's/ *$//')  pci=$(basename $dev)  link=$(cat $dev/current_link_speed 2>/dev/null) x$(cat $dev/current_link_width 2>/dev/null)"
done
lsblk -d -o NAME,SIZE,MODEL,TRAN | grep -E 'nvme|sd|sr'
echo
echo "## 7. 温度・電源の目安"
nvidia-smi --query-gpu=temperature.gpu,power.draw --format=csv 2>&1
for h in /sys/class/hwmon/hwmon*; do
  name=$(cat $h/name 2>/dev/null)
  case "$name" in coretemp) echo "coretemp: $(cat $h/temp1_label 2>/dev/null) $(( $(cat $h/temp1_input) / 1000 ))°C";; esac
done
echo
echo "## 8. カーネルログの異常（EDAC/PCIe/NVMe/nvidia エラー）"
journalctl -k -b 0 --no-pager 2>/dev/null | grep -iE 'edac.*(ce|ue)|pcie.*error|nvme.*(error|timeout)|nvrm.*(xid|fail)' | tail -20 || echo "(journalctl 読み取り不可。dmesg を確認)"
} | tee "$out"

echo
echo "保存: hardware/replace/$out"
