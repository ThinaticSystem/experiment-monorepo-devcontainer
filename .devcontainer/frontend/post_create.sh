#!/usr/bin/env bash
# Bash Strict Mode (http://redsymbol.net/articles/unofficial-bash-strict-mode/)
set -euo pipefail
IFS=$'\n\t'

# Copy pre-built node_modules/ at runtime (after mount workspace)
NODE_MODULES_SOURCE=/built/node_modules
NODE_MODULES_DESTINATION=/workspace/frontend/node_modules
rm -r "$NODE_MODULES_DESTINATION"
ln -s "$NODE_MODULES_SOURCE" "$NODE_MODULES_DESTINATION"
