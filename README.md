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

### How to upload a file (e.g., cv.pdf) and link using <a> tag
1. put the file into ./public/assets/
2. the url is: https://ihchoi12.github.io/assets/[file-name] 

### other cmds
hugo new posts/test1.md
hugo server
./deploy.sh
git submodule add -b master https://github.com/ihchoi12/ihchoi12.github.io.git public
