{ config, pkgs, ... }:

# 一些配置的示例
{
  programs.tmux = {
    enable = true;

    # 设置tmux插件
    plugins = with pkgs.tmuxPlugins; [
      yank               # 用于复制到系统剪贴板
      prefix-highlight   # 高亮显示前缀键
      # 添加更多你需要的插件
    ];

    # 设置tmux.conf配置内容
    extraConfig = ''
      # 绑定 'Ctrl-q' 作为新的前缀键，代替默认的 'Ctrl-b'
      set -g prefix C-q
      unbind C-b
      bind C-q send-prefix

      # 其他一些你喜欢的配置...
    '';
  };
}