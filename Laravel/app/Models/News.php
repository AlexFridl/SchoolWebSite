<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class News extends Model
{
    public $id_category;

    public function getNews(){
// SELECT * FROM news as n join categories as c ON n.category_id = c.id_category WHERE id_news = '1'
//
//        if(!empty($id)) {
//            $rez = DB::table('news as n')
//                ->join('categories as c', 'n.category_id', '=', 'c.id_category')
//                ->select('*')
//                ->where('id_news','=',$id)
//                ->get();
//        }
//        else{
            $rez = DB::table('news as n')
                ->join('categories as c','n.category_id','=','c.id_category')
                ->select('*')
                ->get();
//        }

        return $rez;
    }
    public function sveIzKategorije(){
        //SELECT * FROM news as n join categories as c on n.category_id = c.id_category WHERE c.id_category='1'

        $rez = DB::table('news as n')
            ->join('categories as c','n.category_id','=','c.id_category')
            ->where('c.id_category',$this->id_category)
            ->get();
        return $rez;
    }

public function oneNews($id){
    $rez = DB::table('news as n')
        ->join('categories as c', 'n.category_id', '=', 'c.id_category')
        ->select('*')
        ->where('id_news','=',$id)
        ->get();

    return $rez;
}
   /* public function getOneNews($id){
        $rez = DB::table('news as n')
                ->join('categories as c','n.category_id','=','c.id_category')
                ->select('*')
                ->where('id_news','=',$id)
                ->first();
        return $rez;
    }*/

}
