@extends('layout.index')


@section('content')
    @empty(!session('poruka'))
        {{session('poruka')}}
    @endempty

<div class="author" style="width:800px;height:700px;float:right;">

    <h3>O autoru</h3>
    @if(isset($author))

            <h2 >{{$author->first_last_name}}</h2>
            </br>
            <img src="{{$author->image_path}}"  class="rounded float-left" alt="{{$author->first_last_name}}"/></br></br></br>

            {{$author->text1}}</br>

            {{$author->text2}}</br>


            {{$author->text3}}</br>


        {{$author->text4}}</br>

            </br>
            <b>Broj indeksa: </b>{{$author->no_index}}
    @endif
    </div>
@endsection