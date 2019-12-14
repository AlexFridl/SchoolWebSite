<?php

namespace App\Http\Controllers;

use App\Models\Kategorija;
use Illuminate\Http\Request;
use  App\Models\Author;
use App\Models\News;
use Illuminate\Support\Str;
class FrontendController extends Controller
{
    private $data = [];

    public function __construct()
    {
         $kategorija = new Kategorija();
         $this->data['kategorije'] = $kategorija->getAll();
         //return view('pages.home', $this->data);

    }
//
//    public function oneNewsCategory($id){
//
//        return view('pages.newsFromCategory',$this->data);
//    }

    public function index()
    {
        $news = new News();
        $this->data['news'] = $news->getNews();

        return view('pages.home', $this->data);
    }

    public function category($id=null)
    {
        $news = new News();
        $this->data['id']= $id;
        if(!empty($id)){
            $news->id_category= $id;
            $this->data['news'] = $news->sveIzKategorije();

            return view('pages.oneNews', $this->data);
        }
        else{
            $this->data['news'] = $news->getNews();

            return view('pages.oneNews', $this->data);
        }

    }

    public function showOne($id){
        $news = new News();
        $this->data['id'] = $id;

        if(!empty($id)){
            $news->id_news = $id;
            $this->data['news'] = $news->oneNews($id);

            return view('pages.oneNews',$this->data);
        }
    }
//    public function kategorija($id){
//        $news = new News();
//        $news->category_id= $id;
//        $this->data['news'] = $news->sveIzKategorije($id);
//
//        return view('pages.newsFromCategory',$this->data);
//
//}

    public function showAuthor(){
        $author = new Author();
        $this->data['author'] = $author->getAll();
        return view('pages.author',$this->data);
    }
}


