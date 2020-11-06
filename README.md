# dotfiles
Backup file for important dotfiles. Includes, mostly:
- Neovim settings
- Zsh settings
- tmux settings

## Installation
Simply follow this.
```bash
echo 'alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"' >> $HOME/.zshrc
source ~/.zshrc
echo ".dotfiles.git" >> .gitignore
git clone --bare https://www.github.com/lucaseras/dotfiles $HOME/.dotfiles.git
dotfiles checkout
dotfiles config --local status.showUntrackedFiles no
```

More instructions on how to install [here](https://www.atlassian.com/git/tutorials/dotfiles).
