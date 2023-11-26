{ pkgs, ... }:
{
  # 安装lazygit用于终端管理git
  home.packages = with pkgs; [ lazygit ];

  # 设置一些alias
  programs = {
    neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
    };
  };
}
