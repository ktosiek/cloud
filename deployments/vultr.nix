{
  network.description = "VPS at Vultr";

  network.enableRollback = true;

  main = { config, pkgs, ... }: {
    deployment = {
      targetEnv = "none";
      targetHost = "108.61.166.51";
    };

    imports = [
      ../providers/vultr/base.nix
      ../services/quassel.nix
      ../services/hydra
    ];

    services.fail2ban.enable = true;
  };
}
