# claude.nix
# Matt Pocock's skills (github:mattpocock/skills), pinned in flake.lock.
# Every skill in the engineering and productivity sets is linked into
# ~/.claude/skills, so skills added upstream arrive with `nix flake update`.
# The issue-tracker skills (to-spec, to-tickets, triage, wayfinder,
# implement-spec) need `/setup-matt-pocock-skills` once per repo; they use the
# `gh` CLI for GitHub.
#
# Also `ccs`: a picker over recent Claude Code sessions in all projects.
{
  lib,
  pkgs,
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

  ccs = pkgs.writeShellApplication {
    name = "ccs";
    runtimeInputs = with pkgs; [coreutils findutils gnugrep gnused jq fzf tmux];
    text = builtins.readFile ./scripts/ccs.sh;
  };
in {
  home.file = lib.listToAttrs (lib.concatMap skillsIn categories);

  home.packages = [ccs];

  # prefix + S: session picker as a popup over the current tmux window
  programs.tmux.extraConfig = ''
    bind S display-popup -E -w 90% -h 80% ${ccs}/bin/ccs
  '';

  # first shell of the day lists the latest sessions
  programs.zsh.initContent = lib.mkOrder 1550 "ccs --daily";

  my.tips = [
    {
      cmd = "ccs";
      hint = "recent Claude sessions in all projects; enter resumes, ctrl-n starts a new one there (tmux: prefix + S)";
    }
    {
      cmd = "/voice";
      hint = "in Claude Code: turn on dictation, then hold Space and talk";
    }
    {
      cmd = "/grill-me";
      hint = "in Claude Code: get interviewed until an idea is sharp";
    }
    {
      cmd = "/to-spec → /to-tickets → /implement";
      hint = "in Claude Code: conversation → GitHub spec → tickets → built (run /setup-matt-pocock-skills once per repo)";
    }
    {
      cmd = "/teach <topic>";
      hint = "in Claude Code: a guided learning path on a topic";
    }
    {
      cmd = "/prototype";
      hint = "in Claude Code: throwaway prototype to answer a design question";
    }
    {
      cmd = "/retro";
      hint = "in Claude Code: after a session, suggestions to improve your setup";
    }
  ];
}
