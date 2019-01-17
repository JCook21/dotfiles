# Dotfiles

A collection of dotfiles.

## Installation

This project uses [homesick] (https://github.com/technicalpickles/homesick) to manage the dotfiles it contains. Once you've installed homesick add this repository using 'homesick clone'. To finish installation run:
```zsh  
homesick link dotfiles
homesick rc dotfiles
```

This will symlink all files into the home directory and execute the .homesickrc file, which ensures that all zsh and vim plugins are installed.
