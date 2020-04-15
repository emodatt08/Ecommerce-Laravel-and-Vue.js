<?php

use Illuminate\Database\Seeder;

class UserTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        $user = new \App\User();
        $user->name = "Admin";
        $user->email = "admin@devtest.com";
        $user->password = bcrypt('secret');
        $user->is_admin = true;
        $user->save();
    }
}
