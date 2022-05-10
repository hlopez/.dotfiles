install_python_packages() {
  info "Installing pip"
  curl https://bootstrap.pypa.io/get-pip.py | python

  info "Installing pip xkcdpass"
  pip install xkcdpass
}

install_neovim() {
  info "Installing NeoVim"
  install_brew_formulas neovim
}
