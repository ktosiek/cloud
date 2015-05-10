{ config, pkgs, ... }:
let
  hydra = (import ./hydra/release.nix {}).build.x86_64-linux;
in {
  imports = [ ./hydra/hydra-module.nix ];

  services.hydra = {
    enable = true;
    package = hydra;
    hydraURL = "http://main.ktosiek.com";
    notificationSender = "hydra@hydra.local";
  };

  networking.firewall.allowedTCPPorts = [ config.services.hydra.port ];


  services.postgresql = {
    enable = true;
    package = pkgs.postgresql94;
  };
}
