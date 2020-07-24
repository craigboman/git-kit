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
  git add $1 && git commit -m $2
}

function search(){
  grep -rin $1 * | awk -F: '{print $2" - Line number : "$1}'
}

function reset(){
  git reset --hard HEAD

}

function -(){
  git checkout -
}

function amend(){
  git commit --amend -m $1
}

if [ -f ~/.bash_profile ]; then
  . ~/.bash_profile
fi
