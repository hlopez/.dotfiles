# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="frisk"
 ZSH_THEME="robbyrussell"
# ZSH_THEME="alanpeabody"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
#
alias sshneuro='ssh hugo.lopez@200.24.30.19 -p 62331'
alias mvsisne='open -a /Applications/MacVim.app ~/Development/sisne/'
alias psqlsisne='psql --cluster 9.3/main sisne'
alias psqlintranet='psql --cluster 11/main gna_net'
alias lsrubo='git ls-files -m | xargs ls -1 2>/dev/null | grep '\.rb$' | xargs rubocop'
alias lsrubod='git diff --diff-filter=d --name-only develop| xargs bundle exec rubocop --force-exclusion -'
alias lsreek='git ls-files -m | xargs ls -1 2>/dev/null | grep '\.rb$' | xargs reek'
alias lsfast='git ls-files -m | xargs ls -1 2>/dev/null | grep '\.rb$' | xargs fasterer'

#PATH="/Applications/Postgres93.app/Contents/MacOS/bin:$PATH"
#PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"
PATH="/usr/local/bin:$PATH"
PATH="$HOME/.local/bin:$PATH"
PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"

#XCode 5 hides these away:
#export C_INCLUDE_PATH="$(xcrun --show-sdk-path)/usr/include"
#export CPLUS_INCLUDE_PATH="$(xcrun --show-sdk-path)/usr/include"
#export LIBRARY_PATH="$(xcrun --show-sdk-path)/usr/lib:$(xcrun --show-sdk-path)/usr/lib/system:$LIBRARY_PATH"

export LC_ALL=en_US.UTF-8
export SISNE_HOME="/Users/hugo.lopez/Development/sisne"
export INTRANET_HOME="/Users/hugo.lopez/Development/intranet_gna/develop/"
export EDITOR=nvim

#rbenv issues
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="/usr/local/opt/openssl/bin:$PATH"
export HOMEBREW_NO_AUTO_UPDATE=true

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
