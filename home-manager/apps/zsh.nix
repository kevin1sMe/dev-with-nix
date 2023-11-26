{userConfig}:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [ "vi-mode" "z" "colored-man-pages" "sudo" "last-working-dir" ];
      theme = "dst";
    };
    initExtra = ''
      bindkey '^f' autosuggest-accept
      neofetch
    '';

    # 设置一些alias
    shellAliases = {
        k = "kubectl";
        b = "byobu";

    };
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
}

