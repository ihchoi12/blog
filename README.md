### setup
git clone https://github.com/ihchoi12/blog.git;
cd blog;
git submodule status; 
git submodule init; 
git submodule update;
cd public;
git checkout master;
cd ../themes/eureka;
git checkout master;
cd ../../

### How to update CV
The CV is automatically generated from LaTeX source file (`cv/inho_cv.tex`).

**To update CV:**
1. Edit `cv/inho_cv.tex`
2. Run `cd cv && make` (or `./build_cv.sh`)
3. The PDF will be automatically copied to `public/assets/inho_cv.pdf`
4. Deploy with `./deploy.sh` (this auto-builds CV before deploying)

**Manual build:**
```bash
cd cv
make              # Build CV and copy to public/assets/
make clean        # Clean auxiliary files
make cleanall     # Clean everything including PDF
```

### How to upload other files (e.g., slides, papers)
1. put the file into ./public/assets/
2. the url is: https://ihchoi12.github.io/assets/[file-name] 

### other cmds
hugo new posts/test1.md
hugo server
./deploy.sh
git submodule add -b master https://github.com/ihchoi12/ihchoi12.github.io.git public
