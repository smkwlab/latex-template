# LaTeX Template

九州産業大学理工学部下川研用の汎用LaTeXテンプレートです。研究ノート、レポート、実験記録など様々な用途に活用できる軽量で使いやすいテンプレートです。

## 🚀 主な機能

- **シンプルな構造**: jsarticleベースで軽量・高速
- **汎用性**: 研究ノート、レポート、実験記録に最適
- **自動PDF生成**: プルリクエスト時にPDFプレビューを自動作成
- **日本語完全対応**: uplatex + 日本語フォントで最適化
- **即座の利用**: 複雑な設定不要で即座に文書作成開始

## 📁 ファイル構成

```
├── main.tex           # メイン文書（jsarticle形式）
└── .github/workflows/ # 自動ビルド設定
```

## 🔧 使用方法

### 自動セットアップ（推奨）
[thesis-management-tools](https://github.com/smkwlab/thesis-management-tools)の自動セットアップスクリプトを使用：

```bash
DOC_TYPE=latex /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/smkwlab/thesis-management-tools/main/create-repo/setup.sh)"
```

**自動セットアップの特徴**:
- 学籍番号・文書名の対話的入力
- カスタマイズされたmain.texとREADME.md生成
- GitHub認証とリポジトリ作成の自動化
- 依存関係なしのDocker環境で実行

### 手動セットアップ
1. このテンプレートから新しいリポジトリを作成
2. 下記手順で文書作成を開始

### 文書作成と編集

#### 基本的な文書構造
`main.tex` を編集して文書を作成：

```latex
\section{章タイトル}
本文の内容...

\subsection{節タイトル}
詳細な説明...

\subsubsection{項タイトル}  % 必要に応じて
さらに詳細な内容...
```

#### よく使用する要素

**数式**:
```latex
% インライン数式
テキスト中の数式: $E = mc^2$

% 独立した数式
\begin{equation}
(x - a)^2 + (y - b)^2 = r^2
\label{eq:circle}
\end{equation}

% 式番号なし
\begin{equation*}
\sum_{i=1}^{n} x_i = 0
\end{equation*}
```

**箇条書きと番号付きリスト**:
```latex
% 箇条書き
\begin{itemize}
\item 項目1
\item 項目2
  \begin{itemize}
  \item サブ項目
  \end{itemize}
\end{itemize}

% 番号付きリスト
\begin{enumerate}
\item 手順1
\item 手順2
\end{enumerate}
```

**図表の挿入**:
```latex
% 図の挿入
\begin{figure}[htbp]
\centering
\includegraphics[width=0.8\textwidth]{図ファイル名.pdf}
\caption{図のキャプション}
\label{fig:example}
\end{figure}

% 表の作成
\begin{table}[htbp]
\centering
\caption{表のキャプション}
\label{tab:example}
\begin{tabular}{|l|c|r|}
\hline
左寄せ & 中央 & 右寄せ \\
\hline
データ1 & データ2 & データ3 \\
\hline
\end{tabular}
\end{table}
```

### PDF生成とワークフロー

#### 自動PDF生成
GitHub Actionsにより以下のタイミングで自動的にPDFが生成されます：

**プルリクエスト時（プレビュー）**:
1. ブランチを作成して変更をコミット
2. プルリクエストを作成
3. 自動的にPDFが生成され、ActionsのArtifactsからダウンロード可能
4. レビュー・修正のサイクルが効率化

**mainブランチへのプッシュ時**:
- 自動的にPDFをビルドして検証
- エラーがある場合はActionsログで確認可能

**タグ作成時（正式リリース）**:
```bash
git tag v1.0.0
git push origin v1.0.0
```
- 自動的にGitHubリリースが作成
- 完成版PDFがリリースに添付
- バージョン管理された文書の保管

#### ローカルでのビルド
開発環境での確認用：

```bash
# uplatex使用（推奨）
uplatex main.tex
dvipdfmx main.dvi

# latexmk使用（設定済みの場合）
latexmk main.tex

# クリーンアップ
rm -f *.aux *.log *.dvi *.toc
```

## 📋 適用シーンと選択指針

### このテンプレートが最適な用途
- **研究ノート**: 日々の研究記録やアイデア整理
- **実験記録**: 実験手順、結果、考察の詳細記録
- **技術レポート**: 調査・分析結果のまとめ
- **学習ノート**: 勉強内容の体系的な整理
- **個人文書**: 備忘録、プロトタイプ文書

### 他の専用テンプレートとの使い分け

| 用途 | テンプレート | 特徴 |
|------|-------------|------|
| **卒業論文・修士論文** | [sotsuron-template](https://github.com/smkwlab/sotsuron-template) | 論文特化・PR-based review |
| **週間報告** | [wr-template](https://github.com/smkwlab/wr-template) | 週次フォーマット・連続管理 |
| **情報科学演習** | [ise-report-template](https://github.com/smkwlab/ise-report-template) | HTML品質管理・学習重視 |
| **汎用文書** | **latex-template** | 軽量・柔軟・即座利用 |

### セットアップ方法の選択

**自動セットアップ推奨ケース**:
- 学生が個人プロジェクトを開始
- カスタマイズされた初期設定が必要
- GitHub操作に不慣れ

**手動セットアップ推奨ケース**:
- 既存のワークフローがある
- 大幅なカスタマイズを予定
- テンプレートの詳細を理解して使用

## ⚙️ 環境詳細

### LaTeX エンジン
- **TeXLive 2025**: 最新の日本語LaTeX環境
- **uplatex**: Unicode対応の日本語文書処理エンジン
- **jsarticle**: 軽量で汎用的な日本語文書クラス

### 品質管理
- **textlint**: 日本語文章の自動校正
- **自動構文チェック**: LaTeX構文エラーの検出

### 自動化機能
- **依存関係更新**: TeXLive環境の自動更新チェック
- **PDF生成**: プッシュ時の自動ビルド
- **アーティファクト管理**: プレビュー版と正式版の自動管理

## 🔧 カスタマイズ

### 追加ファイルのビルド
`.github/workflows/latex-build.yml` の `files` パラメータを編集：

```yaml
files: main, custom1, custom2
```

デフォルトでは `main.tex` のみビルドされます。

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