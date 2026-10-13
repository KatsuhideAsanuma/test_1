# 一次資料の抜粋

> 2026-10-14 改訂: 交換対象をCPUとM.2 SSDに絞った。電源・GPU寸法・MSI RTX 3090に関する抜粋は検討時の記録として残している。

手順書・判定の根拠となる原文の抜粋。原本は `../sources/` に保存済み（SHA256は `../sources/index.json`）。
QuickSpecs は印刷ページ＝PDFページ。保守マニュアルは PDFページ＝印刷ページ＋8。

## HP Z4 G4 QuickSpecs v62（2025-01-07）

**p2 内部構成（Xeon W構成）**
> 5. 2 PCIe G3 x16, 2 PCIe G3 x4, 1 PCIe G3 x8
> 6. 2 PCIe G3 x4 M.2 for SSDs
> 7. 8 DIMM slots; DDR4-2666 ECC Registered RAM
> 8. PSU options: 465W 90% efficient with 0 graphics power adapters / 750W 90% efficient with 2 graphics power adapters / 1000W 90% efficient with up to 4 graphics power Adapters

**p6 拡張スロット**
> Slot 1: PCI Express Gen3 x16 (from CPU)
> Slot 2: PCI Express Gen3 x4 (from PCH) with open-ended connector
> Slot 3: PCI Express Gen3 x16 (from CPU)
> Slot 4: PCI Express Gen3 x4 (from PCH) with open-ended connector
> Slot 5: PCI Express Gen3 x8 (from CPU) with open-ended connector
> M.2 Slot 1: M.2 PCIe Gen 3 x4 (from CPU) up to 80mm storage devices
> M.2 Slot 2: M.2 PCIe Gen 3 x4 (from CPU) up to 80mm storage devices

**p7 電源（Xeon W構成）**
> ENTRY 465 watts ... with no 6-pin graphics power cables.
> MID_RANGE 750 watts ... with 2x 6-pin graphics power cables.
> HIGH-END 1000 watts ... Includes 4x 6+2-pin graphics power cables: also includes a Front Fan and Card Guide kit to enable support for dual high end graphics solutions.

**p8 CPU構成表** — `Intel® Xeon® W-2235 3.8 2933 6C CPU  Factory Configured: Y  Option Kit: N`

**p5 CPU仕様表** — W-2235: 6コア、3.8GHz、8.25MB、2933MT/s、ECC対応、最大512GB（HP構成）、Turbo 4.3/4.6GHz、TDP 130W

**p14 グラフィックスの注記**
> NOTE 1: Single graphics configuration requires the HP Z4 G4 Fan and Front Card Guide Kit, which is available both CTO (1MY89AV) and AMO (1XM33AA).
> NOTE 2: Single graphics configuration requires the 750W chassis or 1000W chassis.
> NOTE 5: Dual graphics configuration requires the 1000W chassis.

**p14 メモリ表（SL=Skylake W-2100 / CL=Cascade Lake W-2200）**

| 品番 | 容量/速度 | SL | CL |
|---|---|---|---|
| 1XD84AA/AT | 8GB DDR4-2666 ECC Reg | Y | N |
| 1XD85AA/AT | 16GB DDR4-2666 ECC Reg | Y | N |
| 1XD86AA/AT | 32GB DDR4-2666 ECC Reg | Y | N |
| 5YZ56AA/AT | 8GB DDR4-2933 ECC Reg | Y | Y |
| 5YZ54AA/AT | 16GB DDR4-2933 ECC Reg | N | Y |
| 5YZ55AA/AT | 32GB DDR4-2933 ECC Reg | N | Y |
| 5YZ57AA/AT | 64GB DDR4-2933 ECC Reg | N | Y |

> 3: Intel® Core™ i9-10900X/XE and Intel® Xeon® W-2200 family processors only support 2933 speed memory.
> NOTE: ... HP memory part numbers designated as "2666" may ship with "2933" or "3200" speed memory components.

**p21 基板**
> Processor Socket: Single LGA2066 R4 / Chipset: Intel C422 / Memory Type Supported: DDR4, RDIMM (Registered), ECC / Memory Speed Supported: 2933MT/s, 2666MT/s, 2400MT/s, and 2133MT/s
> Memory Load Order: DIMM1 → DIMM8 → DIMM3 → DIMM6 → DIMM2 → DIMM7 → DIMM4 → DIMM5（図）

**p22 PCIe・M.2**
> NOTE: Slots 1 through 5 support full-height, full-length cards (with extender)
> M.2 Slot 1 / Slot 2: PCI Express Gen3 x4 supplied by CPU, Socket Type 3, Key M, H4.2, sizes 2260-D5-M, 2280-D5-M, 22110-D5-M

**p41 対応CPU一覧** — Xeon W-2295 / 2275 / 2265 / 2255 / 2245 / **2235** / 2225 / 2223 / 2145 / 2133 / 2125 / 2123 / 2104 / 2102
> NOTE: This list is just to indicate support, not availability.

**p32 冷却**
> CPU Heatsink Fan — CPU configs <= 140W: 92 mm x 92 mm x 25 mm, 5-wire, PWM / CPU configs > 140W: 92 mm x 92 mm x 25 mm, 6-wire, PWM (includes 6-to-5pin cable adapter)

**p33 カード固定**
> PCIe Card Retention: Yes, rear (all), middle (all), front (full-length cards with extender, using HP Z4 G4 Fan and Front Card Guide Kit)

**HP認定GPUの最大寸法（p78 RTX A6000 ほか各カード仕様）** — RTX A6000 / Quadro RTX 8000 等: `Full-Height Dual Slot (4.4" Height x 10.5" Length)` ≈ 112mm × 267mm

## HP Z4 G4 Maintenance and Service Guide 第6版（2024-08, L08650-006）

**p19 (PDF 27) 分解準備**
> 1. Turn off the computer. ... 2. Disconnect the power from the computer by unplugging the power cord from the computer. 3. Disconnect all external devices from the computer
> NOTE: During disassembly, label each cable as you remove it, and note its position and routing. Keep all screws with the removed components.

**p22 (PDF 30) アクセスパネル**
> 1. Position the computer with the left side toward you. 2. Swing the access panel release latch up (1). 3. Use the access panel release latch to swing the top edge of the access panel (2) away from the computer. 4. Remove the access panel (3) by lifting it straight up.

**p29 (PDF 37) 前面カードガイド・ファン** — ケーブル2本を外し、保持クリップ2か所を外して手前に倒し、基板側ケーブルを外す。

**p31 (PDF 39) ヒートシンク**
> 1. Disconnect the heat sink fan cable from the system board (1).
> 2. In the sequence indicated on the label on the heat sink, loosen the four slotted Torx30 captive screws (2) that secure the heat sink to the computer.
> IMPORTANT: Remove heat sink retaining screws in diagonally opposite pairs (as in an X) to even the downward forces on the processor. The pins on the socket are fragile, and damage to them might require replacing the system board.
> NOTE: The processor is attached to the bottom of the heat sink. When the heat sink is removed, it is recommended that the heat sink be left resting upside down, with the processor resting on top of the heat sink.

**p32-33 (PDF 40-41) プロセッサ**
> 1. Turn the heat sink upside down with the heat sink fan toward you. 2. Release the four clips (1) that secure the processor holder to the heat sink. 3. Remove the processor holder (2) from the heat sink by lifting it straight up. 4. Carefully release the processor holder clips (3). 5. Remove the processor (4) from the processor holder by lifting it straight up.
> IMPORTANT: Do not handle the pins in the processor socket.
> NOTE: The thermal material must be thoroughly cleaned from the surfaces of the processor (1) and the heat sink (2) and reinstalled each time the processor is removed. Replacement thermal material is included with the processor and heat sink spare part kits.
> CAUTION: ... make sure the corner of the processor with the triangle icon (1) is aligned with the corner of the processor holder with the triangle icon (2), and the notches (3) in the processor are aligned with the ribs (4) on the processor holder clips. When installing the processor and processor holder onto the heat sink, make sure the corner of the processor holder with the triangle icon (2) is aligned with the corner of the heat sink with the triangle icon (5).

**p35 (PDF 43) 電源**
> Before removing the power supply: 1. Prepare the computer for disassembly 2. Remove the access panel 3. Remove the memory fan 4. Remove the rear fan 5. Remove the system board
> 1. Remove the four Torx15 M5.0 × 12.0 screws (1) that secure the power supply to the computer. 2. Lift the front edge of the power supply (2), and then slide it forward ... 3. Slide the power supply (3) toward the middle of the computer chassis ...
> To test the power supply: ... If the power supply fans turn on and the built-in self-test (BIST) light illuminates, the power supply is good

**p67 (PDF 75) Computer Setup > Advanced > Slot Settings**
> PCI Express (x16/x4/x1) slots — Lets you enable or disable PCIe slots. Default is enabled.
> M.2 SSDs — Lets you enable or disable M.2 solid-state drive slots. Default is enabled.

**p77 (PDF 85) / p82 (PDF 90) POSTエラー**
> 008–Microcode Patch Error: Processor is not supported by the BIOS. → 1. Upgrade BIOS to proper version. 2. Change the processor.
> 912–Incorrect CPU cooler installed for this configuration: The processor cooler/heat sink does not match processor power requirement. → Replace the cooler/heat sink to match the processor power requirement.

**保守マニュアルに載っていない手順** — 拡張カード（PCIe）とM.2 SSDの着脱、メモリの着脱は第6版に記載がない。本手順書ではHPの一般的な構造（スロット固定レバー、M.2固定ネジ）に基づいて記述している。

## Intel Xeon W-2235 仕様（Intel ARK）

6コア/12スレッド、3.80GHz（最大4.60GHz）、8.25MBキャッシュ、TDP 130W、最大メモリ1TB、DDR4-2933、4チャネル、ECC対応、PCIe 3.0 × 48レーン、FCLGA2066、Q4'19、Cascade Lake。
注文情報: Spec Code **SRGVA**、Stepping L1、Ordering Code CD8069504439102。

## Sandisk WD Blue SN5100 NVMe SSD データシート

2TB: WDS200T5B0E-00CPE0。Form Factor M.2 2280、PCIe Gen 4.0 x4 NVMe、Height 2.38mm、Weight 5.7g、Average Power 4.1W、Endurance 900 TBW、保証5年またはTBW到達まで。

## Zero Density 社の Z4 G4 構成ガイド（750W電源）

> The 750W power supply provides two 6-pin GPU power cables.
> For GPUs which require 8 Pins power cables, HP has a certified adapter cable from 6 Pin to 8 Pin.
> Do not use SATA or Hard disk power cable to 8 pin converters as this may damage your GPU or power supply.

## Linux skx_edac ドライバ（drivers/edac/skx_common.c, skx_base.c）

`dimm->mtype = MEM_DDR4` と `dimm->edac_mode = EDAC_SECDED` は固定値。ECC無効時は `ECC is disabled on imc` を出して `-ENODEV`。EDAC表示からRDIMM/UDIMMは判別できない。

## MSI GeForce RTX 3090 GAMING X TRIO 24G（公表値、レビュー・販売店記載）

323 × 140 × 56 mm、3スロット、約1.56kg、8ピン×3（カード上面）、電力上限370W、MSI推奨電源750W、DisplayPort 1.4a ×3 / HDMI 2.1 ×1。
> Dimensions go unchanged at 323mm x 140mm x 56mm, and the triple-slot behemoth tips the scales at just over 1.5kg.（Hexus）
> the card sticks to a trio of standard 8-pin power connectors rather than Nvidia's proprietary 12-pin design（PCWorld）
MSI公式仕様ページは2026-10-14時点で取得できず（HTTP 403）。
