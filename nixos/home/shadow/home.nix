{ config, pkgs, ... }:

{
  home = {
    username = "shadow";
    homeDirectory = "/home/shadow";
    stateVersion = "25.05";

    packages = with pkgs; [
      obs-studio vlc godot blender inkscape joplin-desktop libreoffice rpi-imager
    ];
  };

  programs.bash = {
    enable = true;
    shellAliases = {
      connect-hdmi = "xrandr --output eDP-1 --mode 1920x1080 --output HDMI-1 --mode 1920x1080 --same-as eDP-1";
      rebuild = "sudo nixos-rebuild switch --flake ~/dot/nixos#shadowpad";
      rebuild-h = "home-manager switch --flake ~/dot/nixos#shadow";
      full-update = ''
        cd ~/dot/nixos && \
        nix flake update && \
        sudo nixos-rebuild switch --upgrade --flake .#shadowpad && \
        home-manager switch --flake .#shadow
'';

    };
  };

  programs.home-manager.enable = true;
}

