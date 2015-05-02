{ config, ... }:
let
  c = config.services.quassel;
  certFile = "${c.dataDir}/quasselCert.pem";
in {
  services.quassel = {
    enable = true;
    interface = "0.0.0.0";
  };

  networking.firewall.allowedTCPPorts = [ c.portNumber ];

  systemd.services.quassel = {
    preStart = ''
      if [ ! -f "${certFile}" ]; then
        openssl req -x509 -nodes -days 365 -newkey rsa:4096 \
            -keyout ${certFile} -out ${certFile}
      fi
    '';
  };
}
