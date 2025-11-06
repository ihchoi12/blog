# Makefile for compiling LaTeX CV to PDF

# LaTeX compiler
LATEX = pdflatex

# Source files
TEX_FILE = inho_cv.tex
PDF_FILE = inho_cv.pdf

# Output directory (Hugo's public/assets folder)
OUTPUT_DIR = ../public/assets

# Default target
all: $(PDF_FILE) copy

# Compile LaTeX to PDF
$(PDF_FILE): $(TEX_FILE)
	@echo "Compiling LaTeX CV..."
	$(LATEX) -interaction=nonstopmode $(TEX_FILE)
	$(LATEX) -interaction=nonstopmode $(TEX_FILE)
	@echo "PDF generated successfully!"

# Copy PDF to Hugo's public/assets folder
copy: $(PDF_FILE)
	@echo "Copying PDF to $(OUTPUT_DIR)..."
	@mkdir -p $(OUTPUT_DIR)
	cp $(PDF_FILE) $(OUTPUT_DIR)/
	@echo "CV updated in Hugo site!"

# Clean auxiliary files
clean:
	@echo "Cleaning auxiliary files..."
	rm -f *.aux *.log *.out *.toc *.lof *.lot *.fls *.fdb_latexmk *.synctex.gz

# Clean everything including PDF
cleanall: clean
	@echo "Removing PDF file..."
	rm -f $(PDF_FILE)

# Watch for changes and auto-compile (requires entr)
watch:
	@echo "Watching for changes... (Press Ctrl+C to stop)"
	@ls $(TEX_FILE) | entr make all

.PHONY: all copy clean cleanall watch
