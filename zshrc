#  ~/.zshrc

above () {
   xrandr --auto && xrandr --output DP-2 --above eDP-1    
}

function create(){
  git checkout -b $1 && git push --no-verify --set-upstream origin $1
}

function update(){
  git checkout $1 && git pull && git checkout - && git merge $1
}

function check(){
  git checkout -b $1
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

function jsSearch(){
  ack $1 --js --ignore-dir=build
}

function pySearch(){
  ack $1 --py --ignore-dir=logs
}

function tsSearch(){
  ack $1 --ts --ignore-dir=logs
}

function histsearch(){
  history 0 | grep $1
}

function pipfileClean(){
  sed -i '' 's/==//' Pipfile
}

function gitreset(){
  git reset --hard HEAD
}

function gitUndo(){
  git reset --soft HEAD~1
}

function gitCleanUntracked(){
  git clean -f -d
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

function dockPrune(){
  docker system prune -a -f --volumes 
}

function downPruneUp(){
  make down && dockPrune && make up
}

function branchv(){
  git branch -vv
}

function newSvelte() {
  pnpm create svelte@latest $1
}

function getCert(){
  openssl s_client -showcerts -connect $1:443
}

function poetryImport(){
  cat requirements.txt | xargs poetry add
}

function getCertDate(){
  openssl s_client -showcerts -connect $1:443  | openssl x509 -noout -dates
}

function wifiDns(){
  networksetup -getdnsservers Wi-Fi
}

function enumCertCiphers(){
  nmap --script ssl-enum-ciphers -p 443 $1
}

function audioSplit(){
   sox $inputFile $outputFile trim $startSeconds $durationSeconds
}

function wav2mp4(){
   ffmpeg -loop 1 -i $image.jpg -i $inputaudio.wav -vf "scale=trunc(iw/2)*2:trunc(ih/2)*2" -c:v libx264 -tune stillimage -c:a aac -b:a 320k -shortest $outputvideo.mp4
}

# requires ghostscript install
function pdfMerge(){
  gs -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=_all-merged.pdf *.pdf
}

# filter all of the pods running and return only the name of the nodes into which those pods are deployed.
function getsPodsByNode(){
   kubectl get pods -o jsonpath='{range .items[*]}{.metadata.name}{"\t"}{.spec.nodeName}{"\n"}{end}'
}
if [ -f ~/.bash_profile ]; then
  . ~/.bash_profile
fi


# export PYENV_ROOT="$HOME/.pyenv"
# command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"
