<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
class CategoryTypeTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $categoryType = [
            [
                'name' => "MEN'S",
                'created_at' => new DateTime,
                'updated_at' => null,
            ],
            [
                'name' => "WOMEN'S",
                'created_at' => new DateTime,
                'updated_at' => null,
            ],
            [
                'name' => "CHILDREN'S",
                'created_at' => new DateTime,
                'updated_at' => null,
            ],
            [
                'name' => 'NONE',
                'created_at' => new DateTime,
                'updated_at' => null,
            ],

            [
                'name' => 'ALL',
                'created_at' => new DateTime,
                'updated_at' => null,
            ]
        ];

        DB::table('category_type')->insert($categoryType);
    }
}
