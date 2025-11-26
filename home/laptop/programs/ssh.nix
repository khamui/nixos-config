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
        user = "mui";
        hostname = "152.53.127.75";
        port = 2233;
        addressFamily = "inet";
      };
    };
  };

  services.ssh-agent.enable = true;
}
