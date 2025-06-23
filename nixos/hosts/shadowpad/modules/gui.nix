{ config, pkgs, ... }: {
  services.xserver = {
    enable = true;
    windowManager.i3.enable = true;
    displayManager.lightdm.enable = true;
    xkb.layout = "us";
  };
  services.libinput.enable = true;
  services.displayManager.defaultSession = "none+i3";

  environment.systemPackages = with pkgs; [
    i3 polybar picom rofi autotiling
  ];

}

