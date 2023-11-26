
## 🚀 快速部署你的专属开发环境 - 只需5分钟！

- [English](README_en.md)

## 前置要求
- 确保您的系统已安装 curl 和 git。
- 本脚本将自动安装 Nix（如果尚未安装）。

## 📋 简要步骤
只需执行以下命令，一切将自动完成：
```bash
sh <(curl -L https://raw.githubusercontent.com/kevin1sMe/dev-with-nix/main/install)
```

## 🔍 安装脚本细节
1. **检查 Nix 是否已安装：** 如果已安装，则跳过安装步骤；如果未安装，将自动进行安装。
2. **配置 Nix：** 开启 Nix 的 Flakes 功能。
3. **克隆项目仓库：** 克隆 `dev-with-nix` 仓库到本地。
4. **配置个人环境：** 拷贝 `config-templ.toml` 为 `~/.dev-with-nix.toml` 并按需编辑。

## 🚀 开始部署
运行安装脚本后，请根据提示完成以下步骤：
1. **激活 Nix 配置：** 执行 `source ~/.nix-profile/etc/profile.d/nix.sh`。
2. **编辑配置文件：** 修改 `~/.dev-with-nix.toml`。
3. **构建环境：** 在 `dev-with-nix` 目录下执行 `nix run nixpkgs#home-manager -- switch --flake .#dev --impure`。
4. **启动会话：** 使用 `zsh`。

## 🎯 关于 Zsh
本配置优化了 Zsh 的使用体验，建议尝试。若需设为默认 Shell，可执行：
```bash
echo "exec zsh" >> ~/.bashrc
```

## ❓ 常见问题解答
- **Q:** 报 `API rate limit exceeded` 错误？
  - **A:** 公司网络可能限制了对 GitHub 的访问，稍后重试即可。
- **Q:** 修改环境变量后未生效？
  - **A:** 完全关闭 session 并重新登录。可能与 `__HM_ZSH_SESS_VARS_SOURCED` 相关，我正在研究中。
