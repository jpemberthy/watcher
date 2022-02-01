cd ~/github/github
FLIST=$(git status -s | awk '{print $2}')
current_branch=`git branch | grep \* | awk '{print $2}'`
ssh github-codespaces "cd /workspaces/github; git add .; git reset --hard; git pull origin $current_branch"

if [ -z "$FLIST" ]
then
    echo "nothing to sync"
else
    echo "$FLIST" | rsync -arz --files-from=- --no-dirs --whole-file --verbose . github-codespaces:/workspaces/github
fi
