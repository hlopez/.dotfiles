apps=(
  firefox
  google-chrome
  amethyst
  slack
  youtube-music
)

masApps=(
)

install_macos_apps() {
  info "Installing macOS apps..."
  install_brew_casks "${apps[@]}"
}

install_masApps() {
  info "Installing App Store apps..."
  for app in "${masApps[@]}"; do
    mas install $app
  done
}
