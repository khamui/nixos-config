# ssh.nix
{config, ...}: {
  programs.ssh = {
    enable = true;
    settings."*".AddKeysToAgent = "yes";

    # private hosts live in an untracked local file (kept out of this public repo)
    includes = ["~/.ssh/config.local"];

    matchBlocks = {
      "github.com" = {
        hostname = "github.com";
        user = "git";
        identityFile = "${config.home.homeDirectory}/.ssh/id_ed25519";
      };
    };
  };

  # Use gnome-keyring's gcr-ssh-agent: it stores the key passphrase in the
  # login keyring, which is unlocked at login.
  home.sessionVariables.SSH_AUTH_SOCK = "$XDG_RUNTIME_DIR/gcr/ssh";
}
