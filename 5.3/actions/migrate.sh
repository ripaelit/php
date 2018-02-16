#!/usr/bin/env bash

set -e

if [[ -n "${DEBUG}" ]]; then
    set -x
fi

from="${1:-}"
to="${2:-}"

# Default user changed from www-data (82) to wodby (1000), change recursively codebase permissions on volume.
if [[ "${to:0:1}" == 5 && "${from:0:1}" < 5 ]]; then
    echo "Migrating to a new major 5.x version."
    echo "Fixing permissions for codebase volume except symlinks (public files dir)"
    find "${APP_ROOT}" -uid 82 ! -type l -exec chown wodby:wodby {} +
fi
