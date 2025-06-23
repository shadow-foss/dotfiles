{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    clang clang-tools vim neovim git zola
  ];
}

