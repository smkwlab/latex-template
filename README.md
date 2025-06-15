# LaTeX Template

九州産業大学理工学部下川研用の汎用LaTeXテンプレートです。レポート、論文、スライド等の多様な文書作成に対応しています。

## 🚀 主な機能

- **複数文書同時生成**: main, appendix, slide, report を同時にPDF化
- **自動PDF生成**: プルリクエスト時にPDFプレビューを自動作成
- **依存関係管理**: TeXLive環境の自動更新チェック
- **日本語完全対応**: 日本語LaTeX環境とtextlintによる文章校正

## 📁 ファイル構成

```
├── main.tex          # メイン文書 (必須)
├── appendix.tex      # 付録 (オプション)
├── slide.tex         # スライド (オプション) 
├── report.tex        # レポート (オプション)
└── .github/workflows/ # 自動ビルド設定
```

## 🔧 使用方法

### 1. リポジトリ作成
このテンプレートから新しいリポジトリを作成してください。

### 2. 文書作成
必要な `.tex` ファイルを編集してください：

- `main.tex`: メイン文書（必須）
- `appendix.tex`: 付録が必要な場合
- `slide.tex`: プレゼンテーション資料
- `report.tex`: レポート形式の文書

### 3. PDF生成

#### プルリクエストでプレビュー
1. ブランチを作成して変更をコミット
2. プルリクエストを作成
3. 自動的にPDFが生成され、Artifactsからダウンロード可能

#### リリース版作成
1. タグを作成してプッシュ:
   ```bash
   git tag v1.0.0
   git push origin v1.0.0
   ```
2. 自動的にGitHubリリースが作成され、PDFが添付されます

## 📋 対応文書タイプ

### レポート作成
- `main.tex` または `report.tex` を使用
- 実験レポート、課題提出等に最適

### 学術論文
- `main.tex` をメイン論文として使用
- `appendix.tex` で補足資料を管理

### プレゼンテーション
- `slide.tex` でスライド作成
- `main.tex` で発表原稿を作成

### 複合文書
- すべてのファイルを同時使用可能
- 例：論文本体 + 発表スライド + 付録

## ⚙️ 環境詳細

### LaTeX エンジン
- **TeXLive 2025**: 最新の日本語LaTeX環境
- **platex/uplatex**: 日本語文書処理
- **pdflatex**: 英語文書・国際的な文書作成

### 品質管理
- **textlint**: 日本語文章の自動校正
- **自動構文チェック**: LaTeX構文エラーの検出

### 自動化機能
- **依存関係更新**: TeXLive環境の自動更新チェック
- **PDF生成**: プッシュ時の自動ビルド
- **アーティファクト管理**: プレビュー版と正式版の自動管理

## 🔧 カスタマイズ

### ビルドファイルの変更
`.github/workflows/latex-build.yml` の `files` パラメータを編集：

```yaml
files: main, custom1, custom2
```

### LaTeX オプション調整
同ファイル内の `latex_options` を調整：

```yaml
latex_options: -pdf -halt-on-error
```

## 🆘 トラブルシューティング

### コンパイルエラー
1. GitHub Actionsのログを確認
2. ローカル環境での構文チェック
3. 文字エンコーディング（UTF-8）の確認

### PDF生成されない
1. `.tex` ファイル名が `files` パラメータと一致しているか確認
2. ファイルの構文エラーがないか確認
3. GitHub Actionsの実行権限を確認

### 日本語文書の問題
1. 文字エンコーディングがUTF-8であることを確認
2. 必要なパッケージ（`\usepackage{...}`）の記述確認

## 📚 関連リンク

- [LaTeX環境構築ガイド](https://github.com/smkwlab/latex-environment)
- [論文執筆テンプレート](https://github.com/smkwlab/sotsuron-template)
- [下川研究室](https://shimokawa-lab.kyusan-u.ac.jp/)

## 📄 ライセンス

このテンプレートは研究・教育目的での利用を想定しています。