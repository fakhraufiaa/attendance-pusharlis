<?php

namespace Database\Seeders;

use App\Models\Talk;
use App\Models\User;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {

        $this->call([
            FilamentAdminSeeder::class,
            // Panggil seeder lain di sini jika ada
        ]);
    }
}
