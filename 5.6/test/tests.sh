#!/usr/bin/env bash

set -e

if [[ -n "${DEBUG}" ]]; then
    set -x
fi

php -m > ~/php_modules.tmp
echo -n "Checking PHP modules... "

# Modify copy, keep the mounted version untouched.
cp ~/php_modules ~/php_modules.orig

if [[ "${PHP_DEBUG}" == 1 ]]; then
    sed -i '/blackfire/d' ~/php_modules.orig
fi

if ! cmp -s ~/php_modules.tmp ~/php_modules.orig; then
    echo "Error. PHP modules are not identical."
    diff ~/php_modules.tmp ~/php_modules.orig
    exit 1
fi

echo "OK"

echo -n "Checking composer... "
composer --version | grep -q 'Composer version'
echo "OK"

echo -n "Checking walter... "
walter -v | grep -q 'Walter version'
echo "OK"

echo -n "Checking PHPUnit... "
phpunit -version | grep -q 'PHPUnit'
echo "OK"
