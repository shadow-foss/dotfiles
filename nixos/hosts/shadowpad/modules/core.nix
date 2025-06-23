{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    flameshot kitty ranger xclip brightnessctl xwallpaper
    zip unzip tree htop neofetch
    haskellPackages.greenclip
    xdg-user-dirs home-manager
    udiskie udisks
  ];
  services.udisks2.enable = true;

}

