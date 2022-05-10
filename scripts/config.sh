setup_github_ssh() {
  info "Using $SSH_PASSPHRASE"
  ssh-keygen -t ed25519 -C $SSH_PASSPHRASE

  info "Adding ssh key to keychain"
  ssh-add -K ~/.ssh/id_ed25519

  info "Remember add ssh key to github account 'pbcopy < ~/.ssh/id_ed25519.pub'"
}

stow_dotfiles() {
  local files=(
    ".profile*"
    ".zprofile"
    ".gitconfig"
    ".aliases"
    ".zshrc"
    ".vimrc"
    ".viminit"
  )
  local folders=(
    ".config/nvim"
    ".ssh"
    ".vim"
  )
  info "Removing existing config files"
  for f in "${files[@]}"; do
    rm -f "$HOME/$f" || true
  done

  # Create the folders to avoid symlinking folders
  for d in "${folders[@]}"; do
    rm -rf "${HOME:?}/$d" || true
    mkdir -p "$HOME/$d"
  done

  local dotfiles="bin nvim vim zsh tmux"
  info "Stowing: $dotfiles"
  stow -d stow --target $HOME $dotfiles
}

stow_dotfiles
