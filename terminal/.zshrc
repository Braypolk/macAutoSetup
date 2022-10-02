(cat ~/.cache/wal/sequences &)

export PATH=/opt/homebrew/opt/python/libexec/bin:/Users/braypolkinghorne/solana/bin:$PATH
export LIBRARY_PATH=$LIBRARY_PATH:$(brew --prefix)/lib:$(brew --prefix)/opt/libpq/lib
export LIBRARY_PATH=$LIBRARY_PATH:$(brew --prefix)/lib:$(brew --prefix)/opt/mysql-client/lib/

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/braypolkinghorne/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/braypolkinghorne/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/braypolkinghorne/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/braypolkinghorne/google-cloud-sdk/completion.zsh.inc'; fi

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

source /Users/braypolkinghorne/.zsh/completion.zsh
source /Users/braypolkinghorne/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source /Users/braypolkinghorne/.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source /Users/braypolkinghorne/.zsh/aliases.zsh
# source /Users/braypolkinghorne/.zsh/secret.zsh
# source <(kubectl completion zsh)

ghb
