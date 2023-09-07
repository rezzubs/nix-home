{
  enable = true;
  
  settings = { 
    monitor = "DP-3,2560x1440@144,0x0,1";
    
    "$mod" = "SUPER";
    
    general = {
      gaps_in = 8;
      gaps_out = 16;
      border_size = 3;
      "col.active_border" = "rgba(fb204c90)";

      layout = "dwindle";
    };

    exec-once = "swww init & swww img ~/Pictures/wallpapers/a.jpg";

    dwindle = {
      pseudotile = "yes";
      preserve_split = "yes";
    };

    decoration = {
      rounding = 3;
      blur = {
        size = 4;
        passes = 4;
      };
    };


    animations = {
      enabled = "yes";
      
      bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
      
      animation = [
        "windows, 1, 7, myBezier"
        "windowsOut, 1, 7, default, popin 80%"
        "border, 1, 10, default"
        "borderangle, 1, 8, default"
        "fade, 1, 7, default"
        "workspaces, 1, 6, default"
      ];
    };

    input = {
      kb_layout = "ee";
      kb_variant = "us";
      numlock_by_default = "true";
      force_no_accel = "true";
    };

    windowrule = [
      "tile, ^(kitty)$"
    ];

    bind = [
      "$mod, M, exit"
      
      "$mod, R, exec, wofi --show drun"
      
      "$mod, T, exec, kitty"
      "$mod, C, killactive,"
      "$mod, P, pseudo"
      "$mod, V, togglefloating,"
      
      "$mod, L, movefocus, r"
      "$mod, H, movefocus, l"
      "$mod, J, movefocus, d"
      "$mod, K, movefocus, u"
      "$mod, S, togglesplit,"
      "$mod_CTRL, L, movewindow, r"
      "$mod_CTRL, H, movewindow, l"
      "$mod_CTRL, J, movewindow, d"
      "$mod_CTRL, K, movewindow, u"
      "$mod_SHIFT, K, resizeactive, 0 -20"
      "$mod_SHIFT, J, resizeactive, 0 20"
      "$mod_SHIFT, L, resizeactive, 20 0"
      "$mod_SHIFT, H, resizeactive, -20 0"

      "$mod, 1, workspace, 1"
      "$mod, 2, workspace, 2"
      "$mod, 3, workspace, 3"
      "$mod, 4, workspace, 4"
      "$mod, 5, workspace, 5"
      "$mod, 6, workspace, 6"
      "$mod, 7, workspace, 7"
      "$mod, 8, workspace, 8"

      "$mod SHIFT, 1, movetoworkspace, 1"
      "$mod SHIFT, 2, movetoworkspace, 2"
      "$mod SHIFT, 3, movetoworkspace, 3"
      "$mod SHIFT, 4, movetoworkspace, 4"
      "$mod SHIFT, 5, movetoworkspace, 5"
      "$mod SHIFT, 6, movetoworkspace, 6"
      "$mod SHIFT, 7, movetoworkspace, 7"
      "$mod SHIFT, 8, movetoworkspace, 8"
    ];
    
    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
    ];
  };
}
