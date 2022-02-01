cd ~/github/github
FLIST=$(git status -s | awk '{print $2}')

if [ -z "$FLIST" ]
then
    ssh github-codespaces "cd /workspaces/github; git add .; git reset --hard;"
else
    echo "$FLIST" | rsync -arz --files-from=- --no-dirs --whole-file --verbose . github-codespaces:/workspaces/github
fi
