<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

//Route::get('/', function () {
//    return view('welcome');
//});
Route::get('/','FrontendController@index')->name('index');

Route::get('/category/{id?}','FrontendController@category')->name('category');
Route::get('/new/{id?}','FrontendController@showOne')->name('showOne');

Route::get('/registracija','AuthController@registracija')->name('regForma');
Route::post('/registracija','AuthController@doReg')->name('doReg');

Route::get('/logovanje','AuthController@logovanje')->name('loginForma');
Route::post('/doLogovanje','AuthController@doLog')->name('doLogin');
Route::get('/logout','AuthController@doLogout')->name('logout');

Route::get('/author','FrontendController@showAuthor')->name('author');