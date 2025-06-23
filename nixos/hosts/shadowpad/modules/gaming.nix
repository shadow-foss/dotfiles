{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    steam
    # RetroArch + essential extras
    retroarch-full
    parsec-bin
  ];
}

