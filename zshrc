#  ~/.zshrc

function create(){
  git checkout -b $1 && git push --set-upstream origin $1
}

function update(){
  git checkout develop && git pull && git checkout - && git merge develop
}

function check(){
  git checkout $1
}

function pullAll(){
  git pull && cd api && git pull && cd ../ui && git pull && cd ..
}

function delete(){
  git branch -D $1
}

function addCommit(){
  git add $1 && git commit -am $2
}

function gitsearch(){
  git grep -rin $1 * | awk -F: '{print $1" - Line number : "$2}'
}

function histsearch(){
  history 0 | grep $1
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

function rebaseDev(){
  git rebase -i origin/develop
}
function rebaseMain(){
  git rebase -i origin/master
}

function force(){
  git push --force
}

function prune(){
  git remote prune origin
}
function pruneDock(){
  docker volume prune -f
}

function branchv(){
  git branch -vv
}

function getCert(){
  openssl s_client -showcerts -connect $1:443
}

function getCertDate(){
  openssl s_client -showcerts -connect $1:443  | openssl x509 -noout -dates
}

if [ -f ~/.bash_profile ]; then
  . ~/.bash_profile
fi
