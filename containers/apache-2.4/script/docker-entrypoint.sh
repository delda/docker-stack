#!/usr/bin/env bash

echo "*** ${PHP_DOCUMENT_ROOT}"
sed -i "s/%%%DOCUMENT_ROOT%%%/${PHP_DOCUMENT_ROOT}/g" /etc/apache2/sites-available/000-default.conf
sed -i "s/%%%IP%%%/${PHP_IP}/g" /etc/apache2/sites-available/000-default.conf