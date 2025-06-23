{ config, pkgs, ... }: {
  networking.hostName = "shadowpad";
  networking.networkmanager.enable = true;
 
  environment.systemPackages = with pkgs; [
    cifs-utils
  ];
}

