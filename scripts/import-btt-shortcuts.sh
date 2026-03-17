#!/bin/zsh
set -euo pipefail

SCRIPT_DIR=${0:A:h}
ROOT_DIR=${SCRIPT_DIR:h}

open -a "BetterTouchTool" "$ROOT_DIR/bettertouchtool/quicktime-player-btt-shortcuts.bttpreset"
