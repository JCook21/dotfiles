# Dotfiles

A collection of dotfiles.

## Installation

**This project assumes that you are using zsh as your shell.** It also uses [homesick] (https://github.com/technicalpickles/homesick) to manage the dotfiles it contains. Once you've installed homesick add this repository using 'homesick clone'. To finish installation run:
```zsh
# Install and switch to iterm
brew cask install iterm2
brew tap homebrew/cask-fonts
# Install a nerd font to get the custom ligatures.
brew cask install font-inconsolata-nerd-font
# Set iterm to use inconsolate-nerd-font.
# Also set it to use the solarized colour scheme
homesick link dotfiles
homesick rc dotfiles
```

This will symlink all files into the home directory and execute the .homesickrc file, which ensures that all zsh and vim plugins are installed.

All config has been written and tested on MacOS using iTerm2 and homebrew.
