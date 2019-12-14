<?php
/**
 * Created by PhpStorm.
 * User: Mladjica
 * Date: 3/24/2019
 * Time: 8:02 PM
 */

namespace App\Models;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Eloquent\Model;

class Kategorija extends Model
{
    public $id;

    public function getAll(){
//        $rez = "SELECT * FROM kategorija";

        $rez = DB::table('categories')
            ->select('*')
            ->get();
        return $rez;
    }


}

