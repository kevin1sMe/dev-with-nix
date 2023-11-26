{ config, pkgs, userConfig, lib, nvimdots, pkgs-for-kubectl, ... }:

let 
  # 演示打印一些变量
  user = userConfig.user.name;
  homeDir = userConfig.user.homeDir;
in
rec {
  home.username = (builtins.trace "user is ${user}" user );
  home.homeDirectory = (builtins.trace "homeDir is ${homeDir}" homeDir );
  home.stateVersion = "23.05";

  home.packages = with pkgs; [ 
    python3
    git
    openssh
    curl
    htop
    lsof
    neofetch

    tmux 
    byobu

    go

    #k9s 
    ( import ./apps/k9s.nix { inherit lib stdenv fetchurl; } )

    # go example
    ( import ./apps/go-example.nix { inherit (pkgs) lib buildGoModule fetchFromGitHub; } ) # 显式指明lib/buildGoModule/fetchFromGitHub属于pkgs包

  ] ++ [ 
    # 这个版本是v1.23.4
    pkgs-for-kubectl.kubectl 
  ];



  imports = [
    nvimdots.nixosModules.nvimdots
    (import ./apps/zsh.nix { inherit userConfig; })
    ./apps/nvim.nix
    ./apps/nvimdots.nix
    # 设置tmux的配置
    ./apps/tmux.nix

    # 设置一些环境变量
    (import ./envs/vars.nix {inherit userConfig;})

    # 设置一些配置
    (import ./configs/gitconfig.nix {inherit userConfig;})
    ./configs/neofetch.nix
  ];

  # 设置默认shell为zsh
  # Notice: hm不提供直接设置登录默认shell. 暂时没有特别好的解决办法。除非手动设置，比如
  # 在~/.bash_profile中添加如下行
  # exec zsh

  # home.sessionVariables = {
  #   # SHELL = "${pkgs.zsh}/bin/zsh";
  #   SHELL = pkgs.zsh;
  # };

} 
