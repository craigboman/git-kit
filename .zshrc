function updateBranch(){
  git checkout develop && git pull && git checkout - && git rebase -i
}

function createBranch(){
  git checkout -b - && git branch --set-upstream-to origin/develop -
}
