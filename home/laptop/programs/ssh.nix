# ssh.nix
{config, ...}: {
  programs.ssh = {
    enable = true;
    settings."*".AddKeysToAgent = "yes";

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

  # Use gnome-keyring's gcr-ssh-agent: it stores the key passphrase in the
  # login keyring, which is unlocked at login.
  home.sessionVariables.SSH_AUTH_SOCK = "$XDG_RUNTIME_DIR/gcr/ssh";
}
