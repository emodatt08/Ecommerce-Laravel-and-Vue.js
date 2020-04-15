<?php

use Illuminate\Database\Seeder;
use \Illuminate\Support\Facades\DB;
class ProductTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $products = [
            [
                'name' => "Vintage Khaki Shorts with GapFlex",
                'description' => 'Featuring GapFlex technology for extra flexibility, total comfort, and a perfect fit.',
                'units' => 21,
                'price' => 200.10,
                'image' => 'https://www.gap.com/webcontent/0017/029/441/cn17029441.jpg',
                'cate_id'      => '16',
                'created_at' => new DateTime,
                'updated_at' => new DateTime,
            ],
            [
                'name' => "Vintage Khaki Shorts with GapFlex(Pink)",
                'description' => 'These colors come from special garment-dyed method that gives the fabric a unique, vintage look which may fade over time or rub-off. Wash inside-out in cold water to minimize color transfer.',
                'units' => 400,
                'price' => 1600.21,
                'image' => 'https://www.gap.com/webcontent/0017/029/441/cn17029441.jpg',
                'cate_id'      => '16',
                'created_at' => new DateTime,
                'updated_at' => new DateTime,
            ],
            [
                'name' => "All Day Pique Polo Shirt",
                'description' => 'Everyday performance meets all day comfort. Win win.',
                'units' => 37,
                'price' => 378.00,
                'image' => 'https://www.gap.com/webcontent/0017/045/934/cn17045934.jpg',
                'cate_id'      => '16',
                'created_at' => new DateTime,
                'updated_at' => new DateTime,
            ],
            [
                'name' => 'Modern Khakis in Slim Fit with GapFlex',
                'description' => 'Smooth stain-resistant weave with GapFlex stretch technology',
                'units' => 10,
                'price' => 21.10,
                'image' => 'https://www.gap.com/webcontent/0017/029/796/cn17029796.jpg',
                'cate_id'      => '16',
                'created_at' => new DateTime,
                'updated_at' => new DateTime,
            ]
        ];

        DB::table('products')->insert($products);
    }

}
