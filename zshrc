#  ~/.zshrc

alias ls='ls -alh'

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
function getPodsByNode(){
   kubectl get pods -o jsonpath='{range .items[*]}{.metadata.name}{"\t"}{.spec.nodeName}{"\n"}{end}'
}

function getPodsByImage(){
  kubectl get pods -o jsonpath='{range .items[*]}{.metadata.name}{"\t"}{.spec.containers[*].image}{"\n"}{end}'
}

function getContainersInPod(){
  kubectl get pod $1 -o jsonpath='{range .spec.containers[*]}{.name}{"\n"}{end}'
}

function getImagesInPod(){
  kubectl get pod $1 -o jsonpath='{range .spec.containers[*]}{.image}{"\n"}{end}'
}

function getStateOfContainersInPod(){
  kubectl get pod webapp -o jsonpath='{range .status.containerStatuses[*]}{.name}{"\t"}{.state}{"\n"}{end}'
}

function getPodYaml() {
  kubectl get pod "$1" -o yaml > "${1}_pod.yaml"
  echo "YAML for pod $1 saved to ${1}_pod.yaml"
}

function getReplicaYaml(){
  kubectl get replicaset $1 -o yaml > existing-replicaset.yaml
}

function scaleZero(){
  kubectl scale replicaset $1 --replicas=0
}

function scaleUp(){
  kubectl scale replicaset $1 --replicas=$2
}

function createService(){
  kubectl expose pod $1 --port=$2 --name $1-service
}

function editCreatePod(){
  kubectl create -f $1 --edit -o yaml
}

function editUpdatePod(){
  kubectl apply -f $1 --edit -o yaml
}

function getYaml(){
  kubectl get $1 $2 -o yaml > $2-config.yaml
}

# if the resource has already been deleted, edit yaml and create
function deleteCreateYaml() {
  kubectl delete -f $1 || true && (vi $1) && kubectl create -f $1
}



if [ -f ~/.bash_profile ]; then
  . ~/.bash_profile
fi


# export PYENV_ROOT="$HOME/.pyenv"
# command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"
