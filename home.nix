{ config, pkgs, ... }:

{
  home.username = "gin";
  home.homeDirectory = "/home/gin";
  home.stateVersion = "25.11";

  home.packages = [
    pkgs.bitwarden-cli
    pkgs.chezmoi
    pkgs.ghq
    pkgs.git
    pkgs.jq
    pkgs.peco
    pkgs.ripgrep
    pkgs.zsh
  ];

  home.file = {
    ".config/git/config".source = dotfiles/git/config;
    ".config/git/ignore".source = dotfiles/git/ignore;
    ".config/Code/User/settings.json".source = dotfiles/vscode/settings.json;
    ".config/extensions.json".source = dotfiles/vscode/extensions.json;
    ".zshenv".source = dotfiles/zsh/.zshenv;
    ".zshrc".source = dotfiles/zsh/.zshrc;
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  programs.home-manager.enable = true;
}
