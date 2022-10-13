(cat ~/.cache/wal/sequences &)

USER="$(whoami)"

export PATH=/opt/homebrew/opt/python/libexec/bin:/Users/$USER/solana/bin:$PATH
export LIBRARY_PATH=$LIBRARY_PATH:$(brew --prefix)/lib:$(brew --prefix)/opt/libpq/lib
export LIBRARY_PATH=$LIBRARY_PATH:$(brew --prefix)/lib:$(brew --prefix)/opt/mysql-client/lib/

# The next line updates PATH for the Google Cloud SDK.
if [ -f "/Users/$USER/google-cloud-sdk/path.zsh.inc" ]; then . "/Users/$USER/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "/Users/$USER/google-cloud-sdk/completion.zsh.inc" ]; then . "/Users/$USER/google-cloud-sdk/completion.zsh.inc"; fi

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform

bindkey -e
bindkey '\e\e[C' forward-word
bindkey '\e\e[D' backward-word 
bindkey '^t' autosuggest-accept

eval "$(starship init zsh)"

# Initialize the completion system
autoload -Uz compinit

# Cache completion if nothing changed - faster startup time
typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
if [ $(date +'%j') != $updated_at ]; then
  compinit -i
else
  compinit -C -i
fi

# Enhanced form of menu completion called `menu selection'
zmodload -i zsh/complist

source /Users/$USER/.zsh/completion.zsh
source /Users/$USER/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source /Users/$USER/.zsh/fast-syntax-highlighting/F-Sy-H.plugin.zsh
source /Users/$USER/.zsh/aliases.zsh
# source /Users/$USER/.zsh/secret.zsh
# source <(kubectl completion zsh)

ghb

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  
# This loads nvm bash_completion
