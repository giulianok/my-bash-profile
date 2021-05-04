# Open files
alias openProfile='code ~/.profile'

alias rmModules="rm -rf node_modules/ package-lock.json"

# Git
alias sts='git status'
alias greset='git checkout -- .'
alias goMain='git checkout main'
alias goMaster='git checkout master'
alias goDevelop='git checkout develop'
alias mainAndPull='goMain && pull'
alias masterAndPull='goMaster && pull'
alias developAndPull='goDevelop && pull'

function branch() {
  echo "$(git symbolic-ref --short HEAD)"
}

function pullM() {
  echo "\n${style[bold]}${style[cyan]}Pulling from master${style[blink]}..."
  echo "${style[reset]}"
  git pull origin master
}

function pullD() {
  echo "\n${style[bold]}${style[cyan]}Pulling from develop${style[blink]}..."
  echo "${style[reset]}"
  git pull origin develop
}

function pull() {
  echo "\n${style[bold]}${style[cyan]}Pulling from $(branch)${style[blink]}..."
  echo "${style[reset]}"
  git pull origin $(branch)
}

function push() {
  echo "\n${style[bold]}${style[cyan]}Pushing to $(branch)${style[blink]}..."
  echo "${style[reset]}"
  git push origin $(branch)
}

function fetchAndSwitch() {
  if [ "$1" != '' ]; then
    echo "\n${style[bold]}${style[cyan]}Fetching $1${style[blink]}...\n${style[reset]}"
    git fetch origin $1

    echo "\n${style[bold]}${style[cyan]}Switching $(branch) to $1${style[blink]}...\n${style[reset]}"
    git checkout $1
  else
    echo "\n'fetchAndSwitch' requires an the branch name!"
  fi
}

function makeFeature() {
  if [[ "$1" != '' && "$2" != '' ]] ; then
    echo "\n${style[bold]}${style[blue]}Making Branch '$1-$(toCamelCase $2)'${style[blink]}...\n${style[reset]}"
    git checkout -b feature/$1-$(toCamelCase $2)
  else
    echo "\nexpected 2 args! e.g. makeFeature GACSP-1204 use-reset-css"
  fi
}

function addAndCommit() {
  if [ "$1" != '' ] ; then
    git add .
    git commit -m $1 $2
  else
    echo "\nthe message is missing, e.g. addAndCommit 'testing che'"
  fi
}

function toCamelCase() {
  echo $1 | tr " " _ | tr "-" _ | perl -pe 's/(^|_)./uc($&)/ge;s/_//g'
}

function listCommands() {
  echo "\n\
  ${style[bold]}sts:${style[reset]} git status\n\
  ${style[bold]}greset:${style[reset]} git checkout -- .\n\
  ${style[bold]}goMaster:${style[reset]} git checkout master\n\
  ${style[bold]}goDevelop:${style[reset]} git checkout develop\n\
  ${style[bold]}masterAndPull:${style[reset]} switches to master and pulls\n\
  ${style[bold]}branch:${style[reset]} returns branch's name\n\
  ${style[bold]}pullM:${style[reset]} pulls from master and merge\n\
  ${style[bold]}pullD:${style[reset]} pulls from develop and merge\n\
  ${style[bold]}pull:${style[reset]} pulls from the current branch\n\
  ${style[bold]}push:${style[reset]} pushes to the current branch\n\
  ${style[bold]}fetchAndSwitch:${style[reset]} downloads the branch and switchs to it\n\
  ${style[bold]}makeFeature:${style[reset]} git checkout -b feature/{TICKET}-{TITLE}\n\
  ${style[bold]}addAndCommit:${style[reset]} adds all the files and commits\n\
  ${style[bold]}build:${style[reset]} npm run build\n\
  ${style[bold]}start:${style[reset]} npm run start:dev\n\
  ${style[bold]}story:${style[reset]} npm run storybook:start\n\
  "
}

echo "\n\u001b[32m\u001b[1mWelcome Giuliano! You're awesome! 😎${style[reset]}";

declare -A style
style[reset]="\e[0m"
style[bold]="\e[1m"
style[underline]="\e[4m"
style[blink]="\e[5m"
style[inverted]="\e[7m"
style[red]="\e[31m"
style[green]="\e[32m"
style[yellow]="\e[33m"
style[blue]="\e[34m"
style[magenta]="\e[35m"
style[cyan]="\e[96m"
style[bgRed]="\e[41m"
style[bgGreen]="\e[42m"
style[bgYellow]="\e[43m"
style[bgBlue]="\e[44m"
style[bgMagenta]="\e[45m"

# OHMUNITY

alias iosLive='ionic capacitor run ios -l --external'
alias runOnIOS="ionic capacitor run ios -l --external"
alias runOnAndroid="ionic capacitor run android -l --external"
alias hasuraConsole="hasura console --console-port 9090 --browser=false"
alias influexerHasuraConsole="hasura console --console-port 9090 --browser=false"
alias ngrokHasura="~/ngrok http -subdomain=ohmunity-giuliano 8080"
alias ngrokBE="~/ngrok http -subdomain=ohmunity 9000"
