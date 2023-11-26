{ userConfig, ... }:
let 
    envs = builtins.concatStringsSep " + " (builtins.attrNames userConfig.env);
    appendEnvs = builtins.trace "user append envs: *** ${envs} ***" userConfig.env;
in
{
  home.sessionVariables = {

    # 默认编辑器
    EDITOR = "nvim";

} // appendEnvs;
}
