# nix-index.nix
# Prebuilt nixpkgs file index (github:nix-community/nix-index-database):
# `, <cmd>` runs any program without installing it, `nix-locate bin/<cmd>`
# finds its package, and unknown commands suggest the package that has them.
{...}: {
  programs.nix-index.enable = true;
  programs.nix-index-database.comma.enable = true;

  my.tips = [
    {
      cmd = ", <cmd>";
      hint = "run any program without installing it (e.g. , cowsay hi)";
    }
    {
      cmd = "nix-locate bin/<cmd>";
      hint = "which package provides a command";
    }
  ];
}
