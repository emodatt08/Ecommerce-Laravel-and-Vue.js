<?php

use Illuminate\Database\Seeder;
use \Illuminate\Support\Facades\DB;
class CategoryTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $categories = [
            [
                'name' => "Electronics",
                'description' => '',
                'created_at' => new DateTime,
                'updated_at' => null,
            ],
            [
                'name' => "Clothes",
                'description' => '',
                'created_at' => new DateTime,
                'updated_at' => null,
            ],
            [
                'name' => "Perfumes",
                'description' => '',
                'created_at' => new DateTime,
                'updated_at' => null,
            ],
            [
                'name' => 'Software',
                'description' => '',
                'created_at' => new DateTime,
                'updated_at' => null,
            ],

            [
                'name' => 'Automobiles',
                'description' => '',
                'created_at' => new DateTime,
                'updated_at' => null,
            ],

            [
                'name' => 'Health & Beauty',
                'description' => '',
                'created_at' => new DateTime,
                'updated_at' => null,
            ],

            [
                'name' => 'Home & Garden',
                'description' => '',
                'created_at' => new DateTime,
                'updated_at' => null,

        ]
    ];
    

        DB::table('categories')->insert($categories);
    }

}
