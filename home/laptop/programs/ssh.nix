# ssh.nix
{config, ...}: {
  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";

    matchBlocks = {
      "github.com" = {
        addKeysToAgent = "yes";
        hostname = "github.com";
        user = "git";
        identityFile = "${config.home.homeDirectory}/.ssh/id_ed25519";
      };
    };
  };

  services.ssh-agent.enable = true;
}
