# claude.nix
# Matt Pocock's skills (github:mattpocock/skills), pinned in flake.lock.
# Every skill in the engineering and productivity sets is linked into
# ~/.claude/skills, so skills added upstream arrive with `nix flake update`.
# The issue-tracker skills (to-spec, to-tickets, triage, wayfinder,
# implement-spec) need `/setup-matt-pocock-skills` once per repo; they use the
# `gh` CLI for GitHub.
{
  lib,
  mattpocock-skills,
  ...
}: let
  categories = ["engineering" "productivity"];

  skillsIn = category: let
    dir = "${mattpocock-skills}/skills/${category}";
  in
    lib.mapAttrsToList (name: _: {
      name = ".claude/skills/${name}";
      value.source = "${dir}/${name}";
    })
    (lib.filterAttrs (_: type: type == "directory") (builtins.readDir dir));
in {
  home.file = lib.listToAttrs (lib.concatMap skillsIn categories);
}
