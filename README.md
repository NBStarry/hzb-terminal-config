# hzb-terminal-config

我的终端配置备份：**zsh (oh-my-zsh)** + **Ghostty**。macOS / Apple Silicon。

敏感与机器相关的内容（KUBECONFIG、代理、私有 alias）已抽到不入库的 `~/.zshrc.local`，主配置只保留通用部分，可放心 fork。

## 目录结构

```
hzb-terminal-config/
├── install.sh                  # 软链安装脚本（自动备份已存在的文件）
├── zsh/
│   ├── .zshrc                  # zsh 主配置（脱敏）
│   └── .zshrc.local.example    # 机器/敏感配置模板，复制成 ~/.zshrc.local
└── ghostty/
    ├── config                  # Ghostty 主配置  -> ~/.config/ghostty/config
    └── config.appsupport       # quick-terminal-size 覆盖 -> App Support 路径
```

## 安装

```bash
git clone https://github.com/<you>/hzb-terminal-config.git
cd hzb-terminal-config
bash install.sh
cp zsh/.zshrc.local.example ~/.zshrc.local   # 填入自己的 KUBECONFIG / 代理 等
exec zsh
```

## 依赖

| 组件 | 安装 |
|---|---|
| oh-my-zsh | `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"` |
| zsh-autosuggestions | `brew install zsh-autosuggestions` |
| zsh-syntax-highlighting | `brew install zsh-syntax-highlighting` |
| Ghostty | `brew install --cask ghostty` |
| 字体 Maple Mono NF CN | https://github.com/subframe7536/maple-font |

> oh-my-zsh 的 `custom/` 目录没有自定义内容，主题/插件全在 `.zshrc` 里（`robbyrussell` 主题 + `git` 插件 + 上面两个 brew 插件），无需单独备份。

## Ghostty 说明

`config.appsupport` 是 Ghostty 1.3.x 的一个 workaround：`quick-terminal-size` 放在 `~/.config/ghostty/config` 里 GUI 初始化时常读不到，镜像一份到 `~/Library/Application Support/com.mitchellh.ghostty/config`（后加载、覆盖生效）即可稳定。**改尺寸时两处都要同步改。**

主要快捷键：

- `Cmd + \`` — 全局下拉快速终端（任意 App 内）
- `Cmd + D` — 向右分屏
- `Cmd + Shift + Enter` / `Cmd + Shift + F` — 分屏放大切换
- `Cmd + Shift + ,` — 重载配置
