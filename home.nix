{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  
  home.stateVersion = "23.11";

  home.username = "rezzubs";
  home.homeDirectory = "/home/rezzubs";

  home.packages = with pkgs; [
    adw-gtk3
    tela-circle-icon-theme
    bibata-cursors
  ];

  home.sessionPath = [
    "$HOME/.local/bin"
    "$HOME/.cargo/bin"
    "$HOME/.ghcup/bin"
  ];

  programs.git = {
    enable = true;
    userName = "rezzubs";
    userEmail = "marten.roots@gmail.com";
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    enableAutosuggestions = true;
    autocd = true;
    history = {
      size = 50000;
      save = 50000;
    };
    sessionVariables = {
      EDITOR = "helix";
      VISUAL = "helix";
    };
    initExtra = ''
      source ${pkgs.zsh-vi-mode}/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
    '';
    shellAliases = {
      hm = "home-manager";
      hms = "home-manager switch";
      hx = "helix";
      ls = "ls --color=auto";
    };
  };

  programs.starship.enable = true;

  # Generic linux fixes
  targets.genericLinux.enable = true;
  xdg.mime.enable = true;

  programs.home-manager.enable = true;
}
