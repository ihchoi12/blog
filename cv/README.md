# CV Build System

This directory contains the LaTeX source for Inho Choi's CV and build automation.

## Files

- `inho_cv.tex` - LaTeX source file for the CV
- `Makefile` - Build automation using Make
- `build_cv.sh` - Shell script for building CV
- `inho_cv.pdf` - Generated PDF (auto-generated, not tracked in git)

## Requirements

You need a LaTeX distribution installed:

**macOS:**
```bash
brew install --cask mactex-no-gui
```

**Ubuntu/Debian:**
```bash
sudo apt-get install texlive-latex-extra texlive-fonts-extra
```

## Usage

### Quick Build

Simply run:
```bash
make
```

This will:
1. Compile `inho_cv.tex` to PDF
2. Copy the PDF to `../public/assets/inho_cv.pdf`

### Alternative: Using Shell Script

```bash
./build_cv.sh
```

### Cleaning Up

```bash
make clean     # Remove auxiliary files (.aux, .log, etc.)
make cleanall  # Remove all generated files including PDF
```

### Auto-watch for Changes (Optional)

If you have `entr` installed:
```bash
brew install entr  # macOS
make watch         # Auto-rebuild on file changes
```

## Editing the CV

1. Open `inho_cv.tex` in your favorite text editor
2. Make your changes
3. Run `make` to rebuild
4. The updated PDF will be automatically copied to the Hugo site

## Integration with Hugo Deploy

The CV build is automatically integrated into `../deploy.sh`. When you run `./deploy.sh`, it will:
1. Build the CV from LaTeX
2. Copy it to `public/assets/`
3. Build the Hugo site
4. Deploy everything to GitHub

## Template Information

The CV uses the `moderncv` LaTeX package with the `banking` style.

To change the style, edit the following lines in `inho_cv.tex`:
```latex
\moderncvstyle{banking}  % Options: casual, classic, banking, oldstyle, fancy
\moderncvcolor{blue}     % Options: blue, orange, green, red, purple, grey, black
```

## Troubleshooting

**Error: pdflatex not found**
- Install a LaTeX distribution (see Requirements above)

**Error: Package 'moderncv' not found**
- Install the full TeXLive distribution or specifically install moderncv:
  ```bash
  sudo tlmgr install moderncv
  ```

**PDF not updating in Hugo site**
- Make sure you're running `make` from within the `cv/` directory
- Check that `../public/assets/` directory exists
- Manually copy if needed: `cp inho_cv.pdf ../public/assets/`
