#!/bin/bash
# File ini akan dijalankan saat start container Railway

# Pastikan permission benar
chmod -R 775 storage bootstrap/cache

# Bersihkan dan siapkan ulang cache Laravel
php artisan optimize:clear

# Jalankan migrasi
php artisan migrate --force

# Shield setup: hanya pertama kali deploy yang perlu install
# Cek jika folder sudah ada, skip install
if [ ! -d "app/Policies" ]; then
  php artisan shield:install
  php artisan shield:generate
fi

# Jadikan user pertama sebagai super-admin (pastikan ada user dulu)
php artisan shield:super-admin || true

# Generate config cache terakhir (setelah install shield)
php artisan config:cache
php artisan route:cache
php artisan view:cache
php artisan event:cache

# Jalankan nginx & php-fpm
node /assets/scripts/prestart.mjs /assets/nginx.template.conf /nginx.conf
php-fpm -y /assets/php-fpm.conf &
nginx -c /nginx.conf
