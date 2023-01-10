cd ~/github/github
FLIST=$(git status -s | awk '{print $2}')

current_branch=`git branch | grep \* | awk '{print $2}'`
local_sha=`git rev-parse HEAD`
remote_sha=`ssh github-codespaces "cd /workspaces/github; git add .; git reset --hard -q; git rev-parse HEAD"`

if [[ "$local_sha" != "$remote_sha" ]]
then
    echo "syncing branches"
    git push origin $current_branch
    ssh github-codespaces "cd /workspaces/github; bash -l -c 'git pull origin $current_branch'"
Fi

if [ -z "$FLIST" ]
then
    echo "nothing to sync"
else
    echo "$FLIST" | rsync -arz --files-from=- --no-dirs --whole-file --verbose . github-codespaces:/workspaces/github
fi
