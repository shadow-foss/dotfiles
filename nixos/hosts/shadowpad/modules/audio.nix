{ config, pkgs, ... }: {
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
  };

  services.upower.enable = true;

  environment.systemPackages = with pkgs; [
    pavucontrol pamixer
  ];
}

