<?php


namespace App\Models;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Eloquent\Model;


class Author extends Model
{
    public function getAll(){
        //$rez = "SELECT * FROM author";

        return $rez = DB::table('author')
            ->select('*')
            ->first();

    }

}
