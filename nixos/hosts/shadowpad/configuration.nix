{ config, lib, pkgs, ... }:

{
  
  imports = [
    ./hardware-configuration.nix
    ./modules/core.nix
    ./modules/gui.nix
    ./modules/audio.nix
    ./modules/networking.nix
    ./modules/devtools.nix
    ./modules/socials.nix
    ./modules/gaming.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  time.timeZone = "Asia/Kolkata";

  users.users.shadow = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
  };

  environment.variables.EDITOR = "nvim";

  fonts.enableDefaultPackages = true;
  fonts.packages = with pkgs; [
    font-awesome
    nerd-fonts.jetbrains-mono
  ];

  environment.systemPackages = with pkgs; [
    git neovim vim kitty ranger xclip brightnessctl xwallpaper
    haskellPackages.greenclip zip unzip tree htop neofetch
    cifs-utils xdg-user-dirs clang clang-tools home-manager
];

  programs.firefox.enable = true;

  system.stateVersion = "25.05";

}

