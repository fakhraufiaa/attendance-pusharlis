#!/bin/bash

# Build assets (jika ada, misal pakai Vite)
npm run build

# Clear semua cache
php artisan optimize:clear

# Cache ulang config, routes, dll
php artisan config:cache
php artisan event:cache
php artisan route:cache
php artisan view:cache

# Pastikan permission benar (optional tapi aman)
chmod -R 775 storage bootstrap/cache
