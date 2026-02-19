<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class CitySeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
          DB::table('cities')->insert([
            [
                'town'          => 'Belgrade',
                'zip'           => 11000,
                'created_at'    => now(),
                'updated_at'    => now()
            ],
                     [
                'town'          => 'Novi Sad',
                'zip'           => 21000,
                'created_at'    => now(),
                'updated_at'    => now()
            ],
            [
                'town'          => 'Valjevo',
                'zip'           => 14000,
                'created_at'    => now(),
                'updated_at'    => now()
            ],
            [
                'town'          => 'Nis',
                'zip'           => 18000,
                'created_at'    => now(),
                'updated_at'    => now()
            ],

        ]);
    }
}
