# QuickTime Player Shortcuts

换过了很多 Mac OS 的播放器，但都不流畅丝滑，还常闪退。兜兜转转又回到了 QuickTime Player，虽然好用，但是没有快捷键的支持等于不可用。教程让 AI 写的很详细，如果你还不会使用，可以扔给 AI 让它自己操作。两个软件都已测试可用。

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

If you want the easiest setup, choose this option.

1. Download and install `Keyboard Maestro`.
2. Open `Keyboard Maestro`.
3. Download this repository, or open it in Terminal.
4. Go to the project folder.
5. Run:

```zsh
./scripts/import-km-shortcuts.sh
```

6. Keyboard Maestro should open an import window.
7. Click the import button.
8. You should now see a macro group named `QuickTime Controls`.
9. Make sure the group is enabled.
10. Open `QuickTime Player`.
11. Open any video file.
12. Press:

- `D` one time: speed should become `1.5x`
- `D` one more time: speed should become `2.0x`
- `S`: speed should go back to `1.0x`
- `A`: speed should go down by `0.5x`
- `Left Arrow`: video should jump back `7` seconds
- `Right Arrow`: video should jump forward `7` seconds

If you only want one setup method, you can stop here.

#### Option 2: BetterTouchTool

Use this if you prefer `BetterTouchTool` instead of `Keyboard Maestro`.

1. Download and install `BetterTouchTool`.
2. Open `BetterTouchTool`.
3. Download this repository, or open it in Terminal.
4. Go to the project folder.
5. Run:

```zsh
./scripts/import-btt-shortcuts.sh
```

6. BetterTouchTool should open the preset import window.
7. Confirm the import.
8. Open `QuickTime Player`.
9. Open any video file.
10. Press:

- `D` one time: speed should become `1.5x`
- `D` one more time: speed should become `2.0x`
- `S`: speed should go back to `1.0x`
- `A`: speed should go down by `0.5x`
- `Left Arrow`: video should jump back `7` seconds
- `Right Arrow`: video should jump forward `7` seconds

This repository uses the current BetterTouchTool preset action format for AppleScript-based keyboard shortcuts.

### Very Detailed Step-by-Step Setup

#### Keyboard Maestro, very slowly

1. Make sure `QuickTime Player` is installed on your Mac.
2. Make sure `Keyboard Maestro` is installed.
3. Open `Keyboard Maestro`.
4. Open `Terminal`.
5. Move into this repository folder.
6. Type:

```zsh
./scripts/import-km-shortcuts.sh
```

7. Go back to `Keyboard Maestro`.
8. Look for a group called `QuickTime Controls`.
9. If you see a checkbox next to it, make sure it is checked.
10. Click the group.
11. You should see five macros inside it.
12. Their names should look like:

- `A -0.5x`
- `S 1.0x`
- `D +0.5x`
- `Left -7s`
- `Right +7s`

13. Open `QuickTime Player`.
14. Open a video.
15. Click the video once so QuickTime is really the active app.
16. Press `D`.
17. Press `D` again.
18. Press `S`.
19. Press `Left Arrow`.
20. Press `Right Arrow`.

If all of these work, setup is finished.

#### BetterTouchTool, very slowly

1. Make sure `QuickTime Player` is installed on your Mac.
2. Make sure `BetterTouchTool` is installed.
3. Open `BetterTouchTool`.
4. Open `Terminal`.
5. Move into this repository folder.
6. Type:

```zsh
./scripts/import-btt-shortcuts.sh
```

7. Go back to `BetterTouchTool`.
8. Confirm the preset import if a prompt appears.
9. In BetterTouchTool, check that there is a QuickTime-specific app section.
10. That section should be for `QuickTime Player`.
11. Inside it, you should have five keyboard shortcuts.
12. Open `QuickTime Player`.
13. Open a video.
14. Click the video once.
15. Press `D`.
16. Press `D` again.
17. Press `S`.
18. Press `Left Arrow`.
19. Press `Right Arrow`.

If all of these work, setup is finished.

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

#### I do not know where to run the command

1. Open `Terminal`
2. Drag the project folder into the Terminal window
3. Type `cd `, then drop the folder path, then press Enter
4. Run one of these:

```zsh
./scripts/import-km-shortcuts.sh
```

or

```zsh
./scripts/import-btt-shortcuts.sh
```

#### I imported it, but the keys still do nothing

1. Open `QuickTime Player`
2. Open a real video file
3. Click inside the video window
4. Try again
5. If it still fails, close and reopen Keyboard Maestro or BetterTouchTool
6. Import the preset or macro file one more time

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

如果你想用最简单的方式，优先选这个。

1. 下载安装 `Keyboard Maestro`
2. 打开 `Keyboard Maestro`
3. 下载这个仓库，或者在终端里进入这个仓库目录
4. 运行：

```zsh
./scripts/import-km-shortcuts.sh
```

5. Keyboard Maestro 会弹出导入窗口
6. 点击导入
7. 你应该能看到一个叫 `QuickTime Controls` 的宏组
8. 确认这个宏组是启用状态
9. 打开 `QuickTime Player`
10. 打开任意一个视频文件
11. 依次测试：

- 按一次 `D`，应该变成 `1.5x`
- 再按一次 `D`，应该变成 `2.0x`
- 按 `S`，应该回到 `1.0x`
- 按 `A`，应该减速 `0.5x`
- 按左方向键，应该后退 `7` 秒
- 按右方向键，应该前进 `7` 秒

如果这些都正常，就已经配置完成了。

#### 方案二：BetterTouchTool

如果你更喜欢 `BetterTouchTool`，就用这个方案。

1. 下载安装 `BetterTouchTool`
2. 打开 `BetterTouchTool`
3. 下载这个仓库，或者在终端里进入这个仓库目录
4. 运行：

```zsh
./scripts/import-btt-shortcuts.sh
```

5. BetterTouchTool 会弹出导入预设窗口
6. 确认导入
7. 打开 `QuickTime Player`
8. 打开任意一个视频文件
9. 依次测试：

- 按一次 `D`，应该变成 `1.5x`
- 再按一次 `D`，应该变成 `2.0x`
- 按 `S`，应该回到 `1.0x`
- 按 `A`，应该减速 `0.5x`
- 按左方向键，应该后退 `7` 秒
- 按右方向键，应该前进 `7` 秒

本仓库里的 BetterTouchTool 预设已经使用当前版本可识别的 AppleScript 动作格式。

### 超详细步骤

#### Keyboard Maestro 版本，慢慢来

1. 先确认你的 Mac 里有 `QuickTime Player`
2. 再确认你已经安装了 `Keyboard Maestro`
3. 打开 `Keyboard Maestro`
4. 打开 `终端`
5. 进入这个仓库所在的文件夹
6. 输入：

```zsh
./scripts/import-km-shortcuts.sh
```

7. 回到 `Keyboard Maestro`
8. 找到一个叫 `QuickTime Controls` 的宏组
9. 确认它前面的勾选框是打开的
10. 点开这个宏组
11. 里面应该有五个宏
12. 名字大概会是：

- `A -0.5x`
- `S 1.0x`
- `D +0.5x`
- `Left -7s`
- `Right +7s`

13. 现在打开 `QuickTime Player`
14. 打开一个视频文件
15. 用鼠标点一下视频窗口，确保现在最前面的程序真的是 QuickTime
16. 按 `D`
17. 再按一次 `D`
18. 按 `S`
19. 按左方向键
20. 按右方向键

如果这些都正常，说明已经配置好了。

#### BetterTouchTool 版本，慢慢来

1. 先确认你的 Mac 里有 `QuickTime Player`
2. 再确认你已经安装了 `BetterTouchTool`
3. 打开 `BetterTouchTool`
4. 打开 `终端`
5. 进入这个仓库所在的文件夹
6. 输入：

```zsh
./scripts/import-btt-shortcuts.sh
```

7. 回到 `BetterTouchTool`
8. 如果弹出导入窗口，就点确认
9. 在 BetterTouchTool 里检查是否出现了一个只针对 `QuickTime Player` 的配置
10. 里面应该有五个键盘快捷键
11. 打开 `QuickTime Player`
12. 打开一个视频文件
13. 用鼠标点一下视频窗口
14. 按 `D`
15. 再按一次 `D`
16. 按 `S`
17. 按左方向键
18. 按右方向键

如果这些都正常，说明已经配置好了。

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

#### 我不知道命令该在哪里输入

1. 打开 `终端`
2. 找到这个仓库文件夹
3. 把文件夹拖进终端窗口
4. 输入 `cd `，再把文件夹路径放进去，然后回车
5. 然后运行下面两个命令中的一个：

```zsh
./scripts/import-km-shortcuts.sh
```

或者：

```zsh
./scripts/import-btt-shortcuts.sh
```

#### 我已经导入了，但按键还是没反应

1. 打开 `QuickTime Player`
2. 打开一个真实的视频文件
3. 用鼠标点一下视频窗口
4. 再试一次按键
5. 如果还不行，就退出并重新打开 Keyboard Maestro 或 BetterTouchTool
6. 然后重新导入一次

### 自定义

你可以直接修改 AppleScript 源码来定制行为：

- 把快进快退间隔从 `7` 秒改成其他秒数
- 把倍速步进从 `0.5x` 改成 `0.25x` 或其他值
- 按需增加最大倍速或最小倍速限制

## License

MIT
