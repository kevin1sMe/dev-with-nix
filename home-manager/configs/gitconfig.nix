{userConfig, ...}:
# 这是一个示例，如何设置一些用户配置
let 
    # 设置git配置
    gitConfigContent = builtins.readFile ../files/gitconfig;
in
{
	#name = REPLACE_NAME_AUTO
	#email = REPLACE_EMAIL_AUTO
    # 将内容中的name/email替换为用户输入的值
    home.file.".gitconfig".text =  builtins.replaceStrings ["REPLACE_NAME_AUTO" "REPLACE_EMAIL_AUTO"] [userConfig.gitconfig.name userConfig.gitconfig.email] gitConfigContent;
}
