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

### other cmds
hugo new posts/test1.md
hugo server
./deploy.sh
