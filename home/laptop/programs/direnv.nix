# direnv.nix
# Loads a repo's flake devShell on `cd` (add `use flake` to its .envrc);
# nix-direnv caches it, so re-entering is instant and survives garbage collection.
{...}: {
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    silent = true;
  };
}
