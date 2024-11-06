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
    - Verify zsh installation
    ```bash
    zsh --version
    ```
    - Symlink .zshrc and .p10k.zsh in home-directory-files into ~:
    ```bash
    ln -s ~/.config/zsh/home-directory-files/.zshrc ~/.zshrc
    ln -s ~/.config/zsh/home-directory-files/.p10k.zsh ~/.p10k.zsh
    ```
    - Update default shell
    ```bash
    chsh -s $(which zsh)
    ```
    - Restart terminal session then test for zsh
    ```bash
    echo $SHELL
    ```
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
    - Open with the nvim command
    - The Lazy package manager should handle installation
    - Issues:
        - Slow internet causes errors downloading LSP servers, so install them manually in the Mason menu after they all fail
        - First time opening dashboard.nvim has no recent projects or files to display, will throw error
