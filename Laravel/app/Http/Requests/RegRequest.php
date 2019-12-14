<?php
namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Validator;

class RegRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {

        return [
            'ime'=>'required|regex:/^[A-Z][a-z]{3,20}$/',
            'prezime'=>'required|regex:/^[A-Z][a-z]{4,25}$/',
            'email'=>'required|email|unique:korisnik,email',
            'korisnicko_ime'=>'required|unique:korisnik,korisnicko_ime',
            'lozinka'=>'required|regex:/^[\w\s\d\]{5,18}$/'
        ];

    }

    public function messages()
    {
        return [
            'ime.required'=>'Polje za ime je obavezno!',
            'prezime.required'=>'Polje za prezime je obavezno!',
            'email.required'=>'Polje za email je obavezno!',
            'korisnicko_ime.required'=>'Polje za korisnicko ime je obavezno!',
            'lozinka.required'=>'Polje za lozinku je obavezno!',
            'email.unique'=>'Email je jedinstveno!',
            'korisnicko_ime.unique'=>'Korisnicko ime je jedinstveno!',
        ];

    }
}
