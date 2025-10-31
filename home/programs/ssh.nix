# ssh.nix
{...}: {
  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";

    matchBlocks = {
      "github.com" = {
        hostname = "github.com";
        user = "khamui";
        identityFile = "~/.ssh/id_ed25519";
      };
    };
  };

  extraConfig = ''
    Host github.com
      StrictHostKeyChecking accept-new
  '';

  services.ssh-agent.enable = true;
}
