<?php

namespace App\Http\Controllers;
use App\Http\Requests\RegRequest;
use Illuminate\Http\Request;
use App\Models\Korisnik;
class AuthController extends FrontendController
{


    public function registracija(){
        return view('pages.registracija');
    }

    public function logovanje(){
        return view('pages.logovanje');
    }

//
//    /**
//     * @param RegRequest $request
//     * @return \Illuminate\Http\RedirectResponse
//     */
//    public function doReg(RegRequest $request){
//        if($request->has('btnRegistracija')){
//            $ime = $request->input('ime');
//            $prezime = $request->input('prezime');
//            $email = $request->input('email');
//            $korisnicko_ime = $request->input('korisnicko_ime');
//            $lozinka = $request->input('lozinka');
//
//            $korisnik = new Korisnik();
//            dd($korisnik);
//            $korisnik->ime = $ime;
//            $korisnik->prezime = $prezime;
//            $korisnik->email = $email;
//            $korisnik->korisnicko_ime = $korisnicko_ime;
//            $korisnik->lozinka = $lozinka;
//            $korisnik->uloga_id = 2;
//
//
//
//            $rez = $korisnik->insertRegistracija();
//            if($rez){
//                return redirect()->route('loginForma')->with('poruka','Uspesno ste se registrovali');
//            }
//            else{
//                return redirect()->route('regForma')->with('poruka','Niste ste se registrovali!');
//            }
//        }
//    }




//    public function doLogout(Request $request){
//        if($request->session()->has('korisnik')){
//            $request->session()->forget('korisnik');
//            return redirect()->route('loginForma')->with('poruka','Uspesno ste se izlogovali!');
//        }
//        $request->session()->flash();
//    }
}
