# ethan's dotfiles
## motivation

## setup
1) Create .config directory and clone repository
   ```bash
   git clone git@github.com:ethan-dean/dotfiles.git ~/.config
   ```
2) Install packages
    - zsh
        - zoxide
        - eza
        - bat
        - fzf
    - tmux
    - neovim
    - nodejs
    - npm
    - build-essential (gcc/g++/make)
3) Zsh
    - Verify installation with: zsh --version
    - Symlink .zshrc and .p10k.zsh in home-directory-files into \~: ln -s \[HOME DIRECTORY FILES/\] \[~/\]
    - Update default shell with :chsh -s $(which zsh)
    - Log out and log back in then test with: echo $SHELL
    - Download a [Nerd Font](nerdfonts.com/font-downloads), install it based on OS and add it to terminal
4) Tmux
    - Clone Tmux Plugin Manager
    ```bash
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    ```
    - Open tmux then source the config
    ```bash
    tmux
    tmux source ~/.config/tmux/tmux.conf
    ```
    - Press C-b(prefix) followed by I to make sure all plugins are installed
5) Neovim
    - Open Neovim with the nvim command
    - The Lazy package manager should handle everything
    - Issues:
        - Slow internet causes errors downloading LSP servers, so install them manually in the Mason menu after they all fail.
