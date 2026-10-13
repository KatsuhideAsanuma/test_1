# replace — 部品交換の情報と手順

HP Z4 G4（基板81C5 / C422 / BIOS P61 v02.97）に対する交換計画。2026-10-14 に対象を次の2点に絞った。GPU（RTX 3090）は別の大型筐体機へ回し、本機ではQuadro P2000を表示用として残す。DIMMは触らない。

| 部品 | 交換後 | 判定 |
|---|---|---|
| CPU | Intel Xeon W-2235 (SRGVA)、W-2123と入れ替え | 可。現行クーラーのまま。DIMMが2666表記なら起動後に速度・容量を確認 |
| SSD | WD Blue SN5100 2TB を2基目のM.2に追加（既存512GBは維持） | 可。固定ネジの有無のみ確認 |

部品はどちらも手元にある。追加購入はサーマルグリス（と、無ければM.2固定ネジ）だけ。

## ファイル

| ファイル | 内容 | 使う場面 |
|---|---|---|
| [procedure.md](procedure.md) | 手順書本体。事前準備、開封時の判定、CPU交換、M.2追加、事後処理、トラブル切り分け、参照ページ | 作業全体 |
| [precheck.md](precheck.md) | 開封時に記入するチェックシート | サイドパネルを開けた最初 |
| [parts.json](parts.json) | 部品の仕様・適合根拠・未確認事項の構造化データ。対象外にしたGPUの情報も参考として保持 | 記録 |
| [source-excerpts.md](source-excerpts.md) | QuickSpecs・保守マニュアル・Intel・Sandisk等の原文抜粋 | 根拠の確認 |
| [verify-after.sh](verify-after.sh) | 交換前後の状態を読み取り専用で記録するスクリプト | 作業前（基準値）と各段階後 |

## 進め方

1. `bash hardware/replace/verify-after.sh` で現状を記録する（出力を `before-<日付>.txt` に改名）。
2. [precheck.md](precheck.md) を印刷し、筐体を開けて記入する。
3. CPU → SSD の順に交換し、各段階で起動確認と `verify-after.sh` を実行する。
4. 完了後、`../observations.json` と `../upgrade-reference.*` を更新する。

## 開封で確認する残り項目

- DIMMラベルの速度表記（2666 か 2933 か）。買い足しはしないが、CPU交換後の切り分けに使う
- ヒートシンクファンの線数（5線なら140W以下クラス。W-2235は130W）
- 2基目 M.2 の固定ネジ・スタンドオフ

原本資料は `../sources/`、実機観測値は `../observations.json`、全体の参照情報は `../upgrade-reference.json` / `.txt`。
