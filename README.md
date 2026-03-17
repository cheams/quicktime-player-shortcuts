# QuickTime Player Shortcuts

一套给 `QuickTime Player` 用的快捷键配置，主方案是 `Keyboard Maestro`，可选方案是 `BetterTouchTool`。

目标是只在 QuickTime Player 前台时接管这些按键，不影响其他应用里的正常输入。

## 快捷键

`Keyboard Maestro` 配置里的快捷键如下：

- `A`: 减速 `0.5x`，最低到 `0.5x`
- `S`: 恢复到 `1.0x`
- `D`: 加速 `0.5x`，支持连续累加，比如 `1.0x -> 1.5x -> 2.0x`
- `Left Arrow`: 快退 `7` 秒
- `Right Arrow`: 快进 `7` 秒

## 仓库内容

- `keyboard-maestro/QuickTime Controls.kmmacros`: 可直接导入的 Keyboard Maestro 宏组
- `applescripts/*.applescript`: 对应的 AppleScript 源码
- `bettertouchtool/quicktime-player-btt-shortcuts.bttpreset`: 可选的 BetterTouchTool 预设
- `scripts/import-km-shortcuts.sh`: 用 Keyboard Maestro 打开导入文件
- `scripts/import-btt-shortcuts.sh`: 用 BetterTouchTool 打开导入文件

## 使用方法

### Keyboard Maestro

1. 安装并打开 `Keyboard Maestro`
2. 运行：

```zsh
./scripts/import-km-shortcuts.sh
```

也可以直接双击 `keyboard-maestro/QuickTime Controls.kmmacros` 导入。

### BetterTouchTool

1. 安装并打开 `BetterTouchTool`
2. 运行：

```zsh
./scripts/import-btt-shortcuts.sh
```

## 说明

- `Keyboard Maestro` 宏组已经限制在 `QuickTime Player` 中生效
- 倍速脚本会在触发播放后重新设置目标速率，避免 QuickTime 把速率重置回 `1.0x`
- AppleScript 本身不能直接绑定单个按键，所以需要 `Keyboard Maestro` 或 `BetterTouchTool` 这类启动器

## 许可证

MIT
