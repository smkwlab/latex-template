# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a minimal LaTeX template repository designed for Japanese academic documents, specifically for the Shimokawa Lab (下川研). It uses the Japanese LaTeX typesetting system with `ujarticle` document class.

This is a general-purpose template intended to be used with the [Shimokawa Lab LaTeX environment](https://github.com/smkwlab/latex-environment). For specialized documents, dedicated templates are available:
- [Thesis template](https://github.com/smkwlab/sotsuron-template) for graduation theses
- [Weekly report template](https://github.com/smkwlab/wr-template) for weekly reports

## Build Commands

The repository uses GitHub Actions for automated builds, but for local development:

```bash
# Using uplatex (Japanese LaTeX)
uplatex main.tex
dvipdfmx main.dvi

# Or if latexmk is configured for Japanese LaTeX
latexmk -pdfdvi main.tex

# Clean build artifacts
rm -f *.aux *.log *.dvi *.toc *.lof *.lot

# View PDF (example)
open main.pdf  # macOS
xdg-open main.pdf  # Linux
```

Note: The build requires a Japanese LaTeX distribution (like TeX Live with Japanese support).

## Key Architecture

- **main.tex**: The primary LaTeX source file using `ujarticle` document class
- **GitHub Actions**: Automated build and release workflow using `ghcr.io/smkwlab/texlive-ja-textlint:2025b` Docker container via `smkwlab/latex-release-action@v2.2.0`
- **Output**: Generates `main.pdf` (which is gitignored)

## Release Workflow

The repository automatically builds and releases PDFs when:
- Tags are pushed (creates GitHub releases with attached PDF)
- Pull requests are opened (builds PDF and uploads as workflow artifact for review)

## Important Configuration

The template uses:
- `ujarticle` document class (Japanese article variant with UTF-8 support)
- `dvipdfmx` driver for graphics (standard for Japanese LaTeX)
- A4 paper with 25mm margins on all sides
- Essential packages: geometry, graphicx, url, comment, otf, multirow

## Working with the Template

When modifying `main.tex`:
- The document class `ujarticle` is optimized for Japanese text with UTF-8 encoding
- Graphics should be compatible with `dvipdfmx` driver (PDF, PNG, JPEG formats)
- The `otf` package provides Japanese font features including Roman numerals
- Pull requests automatically generate PDF artifacts for review