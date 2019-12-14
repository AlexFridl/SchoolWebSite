@extends('layout.index')


@section('title')

    @if(isset($news))
        @foreach($news as $n)
            {{$n->name_category}}
            @endforeach
    @endif
@endsection


@section('content')

    <div class="col-md-9">
        @if(isset($news))
            @foreach($news as $n)
{{--        <div class="row carousel-holder">--}}
{{--            <!--SLAJDER-->--}}
{{--            <div class="col-md-12">--}}
        <div class="row">

                <div>
                    <h2>{{$n->title_news}}</h2>
                    <h6>{{$n->posted_date}}</h6>
                    <img src="{{asset('/').$n->picture_path}}" class="img-fluid" style="weight:800px;height:300px;" alt="{{$n->title_news}}"/></br></br>


{{--                    <img src="{{$author->image_path}}"  class="rounded float-left" alt="{{$author->first_last_name}}"/--}}
                    <p>{{$n->subtitle}}</br>
                    {{$n->text_news}}
                    </p>
                    <h5><b>Kategorija:</b> {{$n->name_category}}</h5>
                </div>

                <!--
           <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                      <ol class="carousel-indicators">
                          <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                          <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                          <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                      </ol>
                      <div class="carousel-inner">
                          <div class="item active">
                              <img class="slide-image" src="http://placehold.it/800x300" alt="">
                          </div>
                          <div class="item">
                              <img class="slide-image" src="http://placehold.it/800x300" alt="">
                          </div>
                          <div class="item">
                              <img class="slide-image" src="http://placehold.it/800x300" alt="">
                          </div>
                      </div>
                      <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                          <span class="glyphicon glyphicon-chevron-left"></span>
                      </a>
                      <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                          <span class="glyphicon glyphicon-chevron-right"></span>
                      </a>
                  </div>
              </div>-->
            </div>
            @endforeach
            @endif
    </div>
            <!-- /.container -->
@endsection