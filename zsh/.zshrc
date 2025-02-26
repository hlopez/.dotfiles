export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/openssl@1.1/bin:$PATH"
export PATH="/usr/local/opt/llvm/bin:$PATH"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export LC_ALL=en_US.UTF-8
export SISNE_HOME="/Users/hugo.lopez/Development/sisne"
export INTRANET_HOME="/Users/hugo.lopez/Development/intranet_gna"
# Used to set the solargraph command for nvim
export SOLAR_HOME="/Users/hugo.lopez/Development/intranet_gna/develop/"
export EDITOR=nvim

export HOMEBREW_NO_AUTO_UPDATE=true
export LDFLAGS="-L/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


eval "$(rbenv init - zsh)"
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

#  -- eza (better ls) -- 
 alias ls="eza --icons=always" 
#  -- Zoxide (better cd) -- 
 eval "$(zoxide init zsh)"
 alias cd="z"

# Aliases Customize to your needs...
alias zshconfig="nvim ~/.zshrc"
alias sshneuro='ssh hugo.lopez@200.24.30.19 -p 62331'
alias mvsisne='open -a /Applications/MacVim.app ~/Development/sisne/'
alias psqlsisne='psql --cluster 9.3/main sisne'
alias psqlintranet='psql --cluster 11/main gna_net'
alias psqlneurobank='psql --cluster 11/main gna_net_bank'
alias lsrubo='git ls-files -m | xargs ls -1 2>/dev/null | grep '\.rb$' | xargs rubocop'
alias lsrubod='git diff --diff-filter=d --name-only develop| xargs bundle exec rubocop --force-exclusion -'
alias lsreek='git ls-files -m | xargs ls -1 2>/dev/null | grep '\.rb$' | xargs reek'
alias lsfast='git ls-files -m | xargs ls -1 2>/dev/null | grep '\.rb$' | xargs fasterer'
alias rmorig="git status -s | awk '{print $2}'|grep .orig|xargs rm"
autoload -Uz compinit && compinit
eval "$(starship init zsh)"
