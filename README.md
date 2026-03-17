# QuickTime Player Shortcuts

QuickTime Player shortcuts for macOS, with `Keyboard Maestro` as the primary setup and `BetterTouchTool` as an optional alternative.

This project adds simple single-key controls that only work when `QuickTime Player` is the active app, so they do not interfere with typing in other applications.

## English

### Features

- `A`: decrease playback speed by `0.5x`, down to `0.5x`
- `S`: reset playback speed to `1.0x`
- `D`: increase playback speed by `0.5x`
- `Left Arrow`: seek backward `7` seconds
- `Right Arrow`: seek forward `7` seconds

The speed controls are designed to keep the new playback rate after each key press, for example:

`1.0x -> 1.5x -> 2.0x -> 2.5x`

### Why This Exists

QuickTime Player has a clean video player, but its default keyboard controls are limited for language learning, reviewing recordings, and repeated playback.

This repository provides a lightweight AppleScript-based solution with app-scoped keyboard triggers.

### Repository Layout

- `keyboard-maestro/QuickTime Controls.kmmacros`
  Importable Keyboard Maestro macro group
- `applescripts/*.applescript`
  Source AppleScripts for speed and seek control
- `bettertouchtool/quicktime-player-btt-shortcuts.bttpreset`
  Optional BetterTouchTool preset
- `scripts/import-km-shortcuts.sh`
  Opens the Keyboard Maestro import file
- `scripts/import-btt-shortcuts.sh`
  Opens the BetterTouchTool preset

### Requirements

- macOS
- QuickTime Player
- One of the following:
  - Keyboard Maestro
  - BetterTouchTool

### Quick Start

#### Option 1: Keyboard Maestro

1. Install and launch `Keyboard Maestro`.
2. Run:

```zsh
./scripts/import-km-shortcuts.sh
```

3. Import the macro group when Keyboard Maestro opens the file.
4. Open a video in QuickTime Player and test `A`, `S`, `D`, `Left Arrow`, and `Right Arrow`.

#### Option 2: BetterTouchTool

1. Install and launch `BetterTouchTool`.
2. Run:

```zsh
./scripts/import-btt-shortcuts.sh
```

3. Import the preset.
4. Open a video in QuickTime Player and test the same keys.

This repository uses the current BetterTouchTool preset action format for AppleScript-based keyboard shortcuts.

### Manual Keyboard Maestro Setup

If you prefer to create the macros manually instead of importing the file:

1. Create a new macro group named `QuickTime Controls`.
2. Set the group to be available only in `QuickTime Player`.
3. Create five macros with these triggers:
   - `A`
   - `S`
   - `D`
   - `Left Arrow`
   - `Right Arrow`
4. Use `Execute an AppleScript` for each macro.
5. Copy the matching script from the `applescripts/` folder.

### How It Works

- Seeking is controlled through QuickTime's AppleScript document time properties.
- Speed changes are applied after triggering playback, which avoids QuickTime resetting the rate back to `1.0x`.
- The keyboard bindings are scoped to QuickTime Player, so single-letter keys remain normal in every other app.

### Troubleshooting

#### The arrow keys work, but `A`, `S`, or `D` do not

- Confirm the macro group is limited to `QuickTime Player`
- Confirm the Keyboard Maestro Engine is running
- Re-import `keyboard-maestro/QuickTime Controls.kmmacros`

#### The playback speed resets to `1.0x`

- Re-import the latest macro file from this repository
- Make sure you are using the updated scripts in this repo, not an older local copy

#### Nothing happens at all

- Verify QuickTime Player is the frontmost app
- Verify a document is open in QuickTime Player
- Make sure Keyboard Maestro or BetterTouchTool has the permissions it needs in macOS

### Customization

You can change the default behavior by editing the AppleScripts:

- change the seek interval from `7` seconds to any value you want
- change the speed step from `0.5x` to `0.25x` or another increment
- add upper or lower speed limits if needed

## 中文

### 功能

- `A`：减速 `0.5x`，最低到 `0.5x`
- `S`：恢复到 `1.0x`
- `D`：加速 `0.5x`
- `左方向键`：快退 `7` 秒
- `右方向键`：快进 `7` 秒

倍速支持连续累加，例如：

`1.0x -> 1.5x -> 2.0x -> 2.5x`

### 这个项目解决什么问题

QuickTime Player 本身很轻量，但默认快捷键在听写、语言学习、看录屏、反复回放时不够顺手。

这个仓库提供了一套基于 AppleScript 的快捷键方案，并通过应用级作用域把按键限制在 QuickTime Player 前台时生效。

### 仓库结构

- `keyboard-maestro/QuickTime Controls.kmmacros`
  可直接导入的 Keyboard Maestro 宏组
- `applescripts/*.applescript`
  控制倍速和快进快退的 AppleScript 源码
- `bettertouchtool/quicktime-player-btt-shortcuts.bttpreset`
  可选的 BetterTouchTool 预设
- `scripts/import-km-shortcuts.sh`
  用 Keyboard Maestro 打开导入文件
- `scripts/import-btt-shortcuts.sh`
  用 BetterTouchTool 打开导入文件

### 环境要求

- macOS
- QuickTime Player
- 以下工具任选其一：
  - Keyboard Maestro
  - BetterTouchTool

### 快速开始

#### 方案一：Keyboard Maestro

1. 安装并启动 `Keyboard Maestro`
2. 运行：

```zsh
./scripts/import-km-shortcuts.sh
```

3. 在 Keyboard Maestro 中导入宏组
4. 打开一个 QuickTime 视频，测试 `A`、`S`、`D`、左右方向键

#### 方案二：BetterTouchTool

1. 安装并启动 `BetterTouchTool`
2. 运行：

```zsh
./scripts/import-btt-shortcuts.sh
```

3. 在 BetterTouchTool 中导入预设
4. 打开一个 QuickTime 视频，测试同样的按键

本仓库里的 BetterTouchTool 预设已经使用当前版本可识别的 AppleScript 动作格式。

### 手动配置 Keyboard Maestro

如果你不想直接导入 `.kmmacros` 文件，也可以手动创建：

1. 新建一个宏组，名称设为 `QuickTime Controls`
2. 将这个宏组设置为只在 `QuickTime Player` 中生效
3. 创建五个宏，触发键分别为：
   - `A`
   - `S`
   - `D`
   - `左方向键`
   - `右方向键`
4. 每个宏的动作都选择 `Execute an AppleScript`
5. 从 `applescripts/` 目录复制对应脚本进去

### 工作原理

- 快进快退通过 QuickTime 文档的时间属性控制
- 倍速脚本会先触发播放，再把播放速率设为目标值，避免 QuickTime 自动重置到 `1.0x`
- 快捷键只在 QuickTime Player 前台时接管，不影响其他应用输入

### 常见问题

#### 左右方向键可用，但 `A`、`S`、`D` 不工作

- 检查宏组是否真的限制在 `QuickTime Player`
- 检查 Keyboard Maestro Engine 是否正在运行
- 重新导入 `keyboard-maestro/QuickTime Controls.kmmacros`

#### 倍速会自动掉回 `1.0x`

- 重新导入本仓库里的最新宏文件
- 确认你使用的是当前仓库里的新脚本，而不是旧版本本地副本

#### 完全没有反应

- 确认 QuickTime Player 是当前前台应用
- 确认 QuickTime 里已经打开了视频文件
- 确认 Keyboard Maestro 或 BetterTouchTool 已获得 macOS 所需权限

### 自定义

你可以直接修改 AppleScript 源码来定制行为：

- 把快进快退间隔从 `7` 秒改成其他秒数
- 把倍速步进从 `0.5x` 改成 `0.25x` 或其他值
- 按需增加最大倍速或最小倍速限制

## License

MIT
