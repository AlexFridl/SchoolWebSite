<?php
/**
 * Created by PhpStorm.
 * User: Mladjica
 * Date: 3/26/2019
 * Time: 1:35 AM
 */

namespace App\Models;

use Illuminate\Support\Facades\DB;
class Korisnik
{

    public $ime;
    public $prezime;
    public  $email;
    public $lozinka;
    public $korisnicko_ime;
    public $uloga_id;

    public function insertRegistracija(){
        return $rez = DB::table('korisnik')
            ->insert([
                'ime'=>$this->ime,
                'prezime'=>$this->prezime,
                'email'=>$this->email,
                'lozinka'=>md5($this->lozinka),
                'korisnicko_ime'=>$this->korisnicko_ime,
                'uloga_id'=>$this->uloga_id
            ]);
    }
}