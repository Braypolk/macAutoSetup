alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

USER="$(whoami)"

alias mw="cd /Users/$USER/Documents/code/mw"
alias per="cd /Users/$USER/Documents/code/personal"

alias la="ls -a"
alias tf="terraform"
alias ls='ls -G'
alias k='kubectl'
alias nerd='nerdctl'
alias kcsc='kubectl config set-context --current --namespace'
alias ops='source ./envs/ops.sh'

alias reload='source ~/.zshrc'

alias ghb='git config --global core.sshCommand "ssh -i ~/.ssh/id_rsa_bp -F /dev/null"'
alias ghm='git config --global core.sshCommand "ssh -i ~/.ssh/id_ed25519_mw -F /dev/null"'

alias gc='git clone'
alias ga='git add .'
alias gc='git commit -m'
alias gp='git push'

function gg() {
    git add .
    git commit -a -m "$1"
    git push
}

alias chrome='open -a "Google Chrome"'
alias candy='ts-node ~/metaplex-foundation/metaplex/js/packages/cli/src/candy-machine-cli.ts'
alias cdc='cd ~/Documents/code/'
alias cdp='cd ~/Documents/code/personal/'

alias merge-r='git checkout stage; git pull; git pull origin main; git push; git checkout test; git pull; git pull origin stage; git push; git checkout dev; git pull; git pull origin test; git push; git checkout ops; git pull; git pull origin dev; git push ; git checkout ops'
alias merge-a='merge-d; merge-t; merge-s; merge-m'

alias merge-d='git checkout dev; git pull; git pull origin ops; git push; git checkout ops'
alias merge-t='git checkout test; git pull; git pull origin dev; git push; git checkout ops'
alias merge-s='git checkout stage; git pull; git pull origin test; git push; git checkout ops'
alias merge-m='git checkout main; git pull; git pull origin stage; git push; git checkout ops'
