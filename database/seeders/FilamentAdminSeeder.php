<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class FilamentAdminSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
         // Cek apakah user admin sudah ada untuk menghindari duplikasi
        if (!User::where('email', 'admin@example.com')->exists()) {
            User::create([
                'name' => 'Test User',
                'email' => 'test@example.com', // Ganti dengan email admin Anda
                'password' => Hash::make('12345678'), // Ganti dengan password kuat!
                // Tambahkan kolom lain jika ada, misalnya 'is_admin' => true
            ]);
        }
    }
}
