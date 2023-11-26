
## 🚀 Quick Deployment of Your Personal Development Environment - Only Takes 5 Minutes!

## Prerequisites
- Ensure your system has curl and git installed.
- This script will automatically install Nix if it's not already installed.

## 📋 Quick Start
Simply execute the following command, and everything will be done automatically:
```bash
sh <(curl -L https://raw.githubusercontent.com/kevin1sMe/dev-with-nix/main/install)
```

## 🔍 Install Script Details
1. **Check if Nix is Installed:** If already installed, skip installation; otherwise, it will be automatically installed.
2. **Configure Nix:** Enable the Flakes feature in Nix.
3. **Clone the Project Repository:** Clone the `dev-with-nix` repository locally.
4. **Configure Personal Environment:** Copy `config-templ.toml` to `~/.dev-with-nix.toml` and edit as needed.

## 🚀 Start Deployment
After running the install script, follow these steps as prompted:
1. **Activate Nix Configuration:** Execute `source ~/.nix-profile/etc/profile.d/nix.sh`.
2. **Edit Configuration File:** Modify `~/.dev-with-nix.toml`.
3. **Build Environment:** In the `dev-with-nix` directory, run `nix run nixpkgs#home-manager -- switch --flake .#dev --impure`.
4. **Start Session:** Use `zsh`.

## 🎯 About Zsh
This configuration enhances the Zsh experience, highly recommended to try. To set it as the default Shell, execute:
```bash
echo "exec zsh" >> ~/.bashrc
```

## ❓ Frequently Asked Questions
- **Q:** Encounter 'API rate limit exceeded' error?
  - **A:** The company network may limit access to GitHub, try again later.
- **Q:** Environment variables changes not taking effect?
  - **A:** Completely close the session and log in again. It seems to be related to `__HM_ZSH_SESS_VARS_SOURCED`, still investigating.
