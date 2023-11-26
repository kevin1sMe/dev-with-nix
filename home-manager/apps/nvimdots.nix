{pkgs, ...}:
{
  programs.neovim.nvimdots = {
    enable = true;
    setBuildEnv = true;  # Only needed for NixOS
    withBuildTools = true; # Only needed for NixOS
  };
}