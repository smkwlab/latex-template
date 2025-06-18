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

## Security and Permission Guidelines

### 🚨 CRITICAL: GitHub Administration Rules

#### Git and GitHub Operations
- **NEVER use `--admin` flag** with `gh pr merge` or similar commands
- **NEVER bypass Branch Protection Rules** without explicit user permission
- **ALWAYS respect the configured workflow**: approval process, status checks, etc.

#### When Branch Protection Blocks Operations
1. **Report the situation** to user with specific error message
2. **Explain available options**:
   - Wait for required approvals
   - Wait for status checks to pass
   - Use `--auto` flag for automatic merge after requirements met
   - Request explicit permission for admin override (emergency only)
3. **Wait for user instruction** - never assume intent

#### Proper Error Handling Example
```bash
# When this fails:
gh pr merge 90 --squash --delete-branch
# Error: Pull request is not mergeable: the base branch policy prohibits the merge

# CORRECT response:
echo "Branch Protection Rules prevent merge. Options:"
echo "1. Wait for required approvals (currently need: 1)"
echo "2. Wait for status checks (currently pending: build-and-release-pdf)"
echo "3. Use --auto to merge automatically when requirements met"
echo "4. Request admin override (emergency only)"
echo "Please specify how to proceed."

# WRONG response:
gh pr merge 90 --squash --delete-branch --admin  # NEVER DO THIS
```

#### Emergency Admin Override
- Only use `--admin` flag when explicitly requested by user
- Document the reason for override in commit/PR description
- Report the action taken and why it was necessary

### Rationale
Branch Protection Rules exist to:
- Ensure code quality through required reviews
- Prevent accidental breaking changes
- Maintain audit trail of changes
- Enforce consistent development workflow

Bypassing these rules undermines repository security and development process integrity.