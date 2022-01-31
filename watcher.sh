cd ~/github/github
FLIST=$(git status -s | awk '{print $2}')
echo "$FLIST" | rsync -arz --files-from=- --no-dirs --whole-file --verbose . github-codespaces:/workspaces/github
