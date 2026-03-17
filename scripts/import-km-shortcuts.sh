#!/bin/zsh
set -euo pipefail

SCRIPT_DIR=${0:A:h}
ROOT_DIR=${SCRIPT_DIR:h}

open -a "Keyboard Maestro" "$ROOT_DIR/keyboard-maestro/QuickTime Controls.kmmacros"
