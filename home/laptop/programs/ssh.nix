# ssh.nix
{config, ...}: {
  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";

    matchBlocks = {
      "github.com" = {
        hostname = "github.com";
        user = "git";
        identityFile = "${config.home.homeDirectory}/.ssh/id_ed25519";
      };

      "vps" = {
        user = "REDACTED";
        hostname = "REDACTED";
        port = 22;
        addressFamily = "inet";
      };
    };
  };

  services.ssh-agent.enable = true;
}
