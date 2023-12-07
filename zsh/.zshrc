# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="frisk"
#ZSH_THEME="spaceship"
ZSH_THEME="powerlevel10k/powerlevel10k"
# ZSH_THEME="alanpeabody"

# Define a custom function to show Git branch or folder symbol
function git_prompt() {
  local git_status="$(git status 2> /dev/null)"

  if [[ $git_status =~ "working tree clean" ]]; then
    echo "🌿" # Green tree emoji for a clean working tree
  elif [[ $git_status =~ "Changes not staged for commit" ]]; then
    echo "🚧" # Orange construction emoji for unstaged changes
  elif [[ $git_status =~ "Changes to be committed" ]]; then
    echo "🚀" # Rocket emoji for staged changes
  elif [[ $git_status =~ "Untracked files" ]]; then
    echo "❓" # Question mark emoji for untracked files
  else
    echo "🔄" # Loop emoji for other Git states
  fi
}

# Customize your prompt
#PROMPT='%(?.%{$fg[green]%}➜ :%{$fg[red]%}➜ )'
#PROMPT+=' %{$fg_bold[blue]%}%~%{$reset_color%}$(git_prompt)%{$reset_color%} '

#PROMPT='%{$fg[black]%}%n@%m %{$fg[blue]%}%~ %{$reset_color%}$(git_prompt) '
#PROMPT='%{$fg[green]%}%n@%m %{$fg_bold[blue]%}%~ %{$reset_color%}$(git_prompt) '

# Example aliases
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
plugins=(git rails ruby)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
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

export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/openssl@1.1/bin:$PATH"
export PATH="/usr/local/opt/llvm/bin:$PATH"

export LC_ALL=en_US.UTF-8
export SISNE_HOME="/Users/hugo.lopez/Development/sisne"
export INTRANET_HOME="/Users/hugo.lopez/Development/intranet_gna"
export EDITOR=nvim

export HOMEBREW_NO_AUTO_UPDATE=true
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
export LDFLAGS="-L/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(rbenv init - zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
