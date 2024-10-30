{ config, pkgs, settings, ...}:

{
  home.packages = [
    (pkgs.opera.override {
      proprietaryCodecs = true;
    })
  ];
}
