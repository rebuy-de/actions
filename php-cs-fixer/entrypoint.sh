#!/bin/bash

set -euo pipefail

# shellcheck disable=SC1091
source /lib.sh

lint() {
	_git_changed_files | php-cs-fixer fix --dry-run -v --diff --path-mode=intersection
}

fix() {
	_git_changed_files | php-cs-fixer fix -v --path-mode=intersection
}

_lint_and_fix_action php-cs-fixer "${@}"
