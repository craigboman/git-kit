function update(){
  git checkout develop && git pull && git checkout - && git rebase -i
}

function create(){
  git checkout -b $1 && git push --set-upstream origin $1  
}

function delete(){
  git branch -D $1
}

function commit(){
  git add -f * && git commit -m $1
}

function search(){
  grep -rin $1 * | awk -F: '{print $2" - Line number : "$1}'
}
