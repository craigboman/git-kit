function update(){
  git checkout develop && git pull && git checkout - && git merge develop  
}

function create(){
  git checkout -b $1 && git push --set-upstream origin $1  
}

function delete(){
  git branch -D $1
}

function addCommit(){
  git add $1 && git commit -am $2
}

function search(){
  grep -rin $1 * | awk -F: '{print $2" - Line number : "$1}'
}

function reset(){
  git reset --hard

}

function -(){
  git checkout -
}

function amend(){
  git commit --amend -m $1
}

function rebase(){
  git rebase -i origin/develop
}

function localDB(){
  psql -h localhost -p 5432 -U $1
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
