#!/bin/sh
echo -ne '\033c\033]0;FireScenarios1\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/FireScenario_Linux.x86_64" "$@"