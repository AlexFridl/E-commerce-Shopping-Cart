<?php

namespace Database\Seeders;

use Carbon\Traits\Timestamp;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
class ProductSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('products')->insert([
        // [
        //     'name'              =>  'Blue schoolbag',
        //     'description'       =>  'Durable and comfortable backpack for everyday school use.
        //                             Features multiple compartments and padded straps for easy and organized carrying.',
        //     'image'             => 'blue-schoolbag.jpb',
        //     'price'             => '43.00',
        //     'stock_quantity'    => '45',
        //     'created_at'        =>  now(),
        //     'updated_at'        => now()
        // ],
        // [
        //     'name'              =>  'Green backpack',
        //     'description'       =>  'Lightweight and water-resistant school bag with a sporty design.
        //                             Spacious interior and breathable back panel make it perfect for active students.',
        //     'image'             => 'green-backpack.jpg',
        //     'price'             => '48.00',
        //     'stock_quantity'    => '45',
        //     'created_at'        =>  now(),
        //     'updated_at'        => now()
        // ],
        // [
        //     'name'              =>  'Yellow backpack',
        //     'description'       =>  'Colorful and fun backpack for younger students.
        //                             Lightweight, practical, and easy to organize with multiple pockets for school essentials.',
        //     'image'             => 'yellow-backpack.jpg',
        //     'price'             => '15.00',
        //     'stock_quantity'    => '45',
        //     'created_at'        =>  now(),
        //     'updated_at'        => now()
        // ],


        [
            'name'              =>  'Chilli',
            'description'       =>  '',
            'image'             => 'chilli.jpg',
            'price'             => '43.00',
            'category_id'       => 2,
            'stock_quantity'    => '45',
            'created_at'        =>  now(),
            'updated_at'        => now()
        ],
        [
            'name'              =>  'Green apple',
            'description'       =>  '',
            'image'             => 'gApple.jpg',
            'price'             => '48.00',
            'category_id'       => 1,
            'stock_quantity'    => '45',
            'created_at'        =>  now(),
            'updated_at'        => now()
        ],
        [
            'name'              =>  'Garlic',
            'description'       =>  '',
            'image'             => 'garlic.jpg',
            'price'             => '15.00',
            'category_id'       => 2,
            'stock_quantity'    => '45',
            'created_at'        =>  now(),
            'updated_at'        => now()
        ],

        [
            'name'              =>  'Lemon',
            'description'       =>  '',
            'image'             => 'lemon.jpg',
            'price'             => '43.00',
            'category_id'       => 1,
            'stock_quantity'    => '45',
            'created_at'        =>  now(),
            'updated_at'        => now()
        ],
        [
            'name'              =>  'Manngo',
            'description'       =>  '',
            'image'             => 'manngo.jpg',
            'price'             => '48.00',
            'category_id'       => 1,
            'stock_quantity'    => '45',
            'created_at'        =>  now(),
            'updated_at'        => now()
        ],
        [
            'name'              =>  'Melon',
            'description'       =>  '',
            'image'             => 'melon.jpg',
            'price'             => '15.00',
            'category_id'       => 2,
            'stock_quantity'    => '45',
            'created_at'        =>  now(),
            'updated_at'        => now()
        ],
        [
            'name'              =>  'Mint',
            'description'       =>  '',
            'image'             => 'mint.jpg',
            'price'             => '43.00',
            'category_id'       => 3,
            'stock_quantity'    => '45',
            'created_at'        =>  now(),
            'updated_at'        => now()
        ],
        [
            'name'              =>  'Orange',
            'description'       =>  '',
            'image'             => 'orange.jpg',
            'price'             => '48.00',
            'category_id'       => 1,
            'stock_quantity'    => '45',
            'created_at'        =>  now(),
            'updated_at'        => now()
        ],
        [
            'name'              =>  'Papaya',
            'description'       =>  '',
            'image'             => 'papaya.jpg',
            'price'             => '15.00',
            'category_id'       => 1,
            'stock_quantity'    => '45',
            'created_at'        =>  now(),
            'updated_at'        => now()
        ],
         [
            'name'              =>  'Pom',
            'description'       =>  '',
            'image'             => 'pom.jpg',
            'price'             => '48.00',
            'category_id'       => 1,
            'stock_quantity'    => '45',
            'created_at'        =>  now(),
            'updated_at'        => now()
        ],
        [
            'name'              =>  'Onions',
            'description'       =>  '',
            'image'             => 'raw-onions.jpg',
            'price'             => '15.00',
            'category_id'       => 2,
            'stock_quantity'    => '45',
            'created_at'        =>  now(),
            'updated_at'        => now()
        ],
         [
            'name'              =>  'Red Apple',
            'description'       =>  '',
            'image'             => 'red-apple.jpg',
            'price'             => '48.00',
            'category_id'       => 1,
            'stock_quantity'    => '45',
            'created_at'        =>  now(),
            'updated_at'        => now()
        ],
        [
            'name'              =>  'Strawbery',
            'description'       =>  '',
            'image'             => 'strawnb.jpg',
            'price'             => '15.00',
            'category_id'       => 1,
            'stock_quantity'    => '45',
            'created_at'        =>  now(),
            'updated_at'        => now()
        ],



        ]);
    }
}
