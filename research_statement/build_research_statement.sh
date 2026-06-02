#!/bin/bash

# Build script for LaTeX Research Statement
# This script compiles the LaTeX research statement and copies it to the Hugo public folder

set -e

echo "========================================="
echo "Building Research Statement from LaTeX..."
echo "========================================="

# Navigate to research_statement directory
cd "$(dirname "$0")"

# Check if pdflatex is installed
if ! command -v pdflatex &> /dev/null; then
    echo "Error: pdflatex is not installed."
    echo "Please install LaTeX distribution:"
    echo "  - macOS: brew install --cask mactex-no-gui"
    echo "  - Ubuntu: sudo apt-get install texlive-latex-extra"
    exit 1
fi

# Compile LaTeX (twice for references)
echo "Compiling LaTeX..."
pdflatex -interaction=nonstopmode inho_research_statement.tex > /dev/null 2>&1
pdflatex -interaction=nonstopmode inho_research_statement.tex > /dev/null 2>&1

# Check if PDF was generated
if [ ! -f "inho_research_statement.pdf" ]; then
    echo "Error: PDF generation failed!"
    exit 1
fi

echo "PDF generated successfully!"

# Copy to Hugo's public/assets folder
OUTPUT_DIR="../public/assets"
mkdir -p "$OUTPUT_DIR"
cp inho_research_statement.pdf "$OUTPUT_DIR/"

echo "Research Statement copied to $OUTPUT_DIR/"
echo "========================================="
echo "Research Statement build complete!"
echo "========================================="

# Clean up auxiliary files
rm -f *.aux *.log *.out *.toc *.lof *.lot *.fls *.fdb_latexmk *.synctex.gz

echo "Cleaned up auxiliary files."
