{ config, pkgs, ... }:

let
  catppuccin-gtk = pkgs.catppuccin-gtk.override {
    accents = [ "lavender" ];
    size = "standard";
    tweaks = [ "rimless" ];
    variant = "mocha";
  };
in
{
  nixpkgs.config.allowUnfree = true;
  
  home.stateVersion = "22.11";

  home.username = "rezzubs";
  home.homeDirectory = "/home/rezzubs";

  home.packages = with pkgs; [
    hyperfine
    gitui
    tokei

    adw-gtk3
    bibata-cursors
    
    flameshot
    rnote
    steam
    discord
    qpwgraph
    logseq
    gimp

    libreoffice
    qdigidoc


    dmenu
    feh
    dunst
    xclip
    pavucontrol
    redshift

    haskell-language-server
    haskellPackages.fourmolu
    ghcid
    lua-language-server
    nodejs_20
    vscode-langservers-extracted
  ] ++ [
    catppuccin-gtk
  ];
  
  services.syncthing.enable = true;
  
  home.sessionPath = [
    "$HOME/.local/bin"
  ];

  programs.git = {
    enable = true;
    userName = "rezzubs";
    userEmail = "marten.roots@gmail.com";
  };

  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    enableAutosuggestions = true;
    autocd = true;
    history = {
      size = 50000;
      save = 50000;
    };
    initExtra = ''
      source ${pkgs.zsh-vi-mode}/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
    '';
    shellAliases = {
      hm = "home-manager";
      hms = "home-manager switch";
    };
  };

  programs.kitty = {
    enable = true;
    font = {
      name = "FiraCode Nerd Font";
      size = 15;
    };
    settings = {
      tab_bar_style = "powerline";
      tab_powerline_style = "round";
      window_padding_width = 15;
      linux_display_server = "x11";
    };
    extraConfig = ''
      map ctrl+shift+t launch --cwd=current --type=tab 
    '';
    theme = "Catppuccin-Mocha";
  };

  programs.starship.enable = true;

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
    

    ".config/gtk-4.0/assets".source = "${catppuccin-gtk}/share/themes/Catppuccin-Mocha-Standard-Lavender-dark/assets";
    ".config/gtk-4.0/gtk.css".source = "${catppuccin-gtk}/share/themes/Catppuccin-Mocha-Standard-Lavender-dark/gtk-4.0/gtk.css";
    ".config/gtk-4.0/gtk-dark.css".source = "${catppuccin-gtk}/share/themes/Catppuccin-Mocha-Standard-Lavender-dark/gtk-4.0/gtk-dark.css";
  };

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/rezzubs/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
