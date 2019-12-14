@extends('layout.index')


@section('title')
    Home
    @endsection


@section('content')
<div class="col-md-9" style="padding-bottom: 50px;">


    <div class="row carousel-holder" style="box-shadow: 1px 2px 4px rgba(0, 0, 0, .5);background: #f2a29f; padding-bottom: 30px;">

        <div class="col-md-12">


            <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                </ol>

                <div class="carousel-inner">

                    @if(isset($news))
                        @foreach($news as $n)
                                @php $class = $loop->first ? 'item active': 'item' @endphp
                    <div class="{{$class}}">
                        <h5><b><a href="{{route('showOne').'/'.$n->id_news}}" style="color:#000;a:hover:#f2a29f;/*width:100%;margin:0px auto;text-align:center;*/">{{$n->title_news}}</a></b></h5>
                        <img class="slide-image" src="{{asset('/').$n->picture_path}}" alt="{{$n->title_news}}"/>

{{--                                <div class="carousel-inner">--}}
{{--                                    <div class="item active">--}}
{{--                                        <img class="slide-image" src="http://placehold.it/800x300" alt="">--}}
{{--                                    </div>--}}
{{--                                    <div class="item">--}}
{{--                                        <img class="slide-image" src="http://placehold.it/800x300" alt="">--}}
{{--                                    </div>--}}
{{--                                    <div class="item">--}}
{{--                                        <img class="slide-image" src="http://placehold.it/800x300" alt="">--}}
{{--                                    </div>--}}

                    </div>
                        @endforeach
                    @endif
                </div>

                </div>

                <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev" >
                    <span class="glyphicon glyphicon-chevron-left"></span>
                </a>
                <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right"></span>
                </a>
            </div>
        </div>
    </div>

    <div class="row">

        @if(isset($news))
            @foreach($news as $n)
        <div class="col-sm-4 col-lg-4 col-md-4" style="height:450px;text-overflow: ellipsis;">

            <div class="thumbnail" style="padding-top: 0px;">
                <img src="{{asset('/').$n->picture_path}}" class="img-fluid" style="weight:150px;height:150px;" alt="{{$n->title_news}}"/></br></br>

                <div class="caption" style="padding-top: 0px;">

                    <h5><b><a href="{{route('showOne').'/'.$n->id_news}}" style="color:#000;">{{$n->title_news}}</a></b>
                    </h5>
                    <p>{{

                       $truncated = Str::limit($n->text_news, 200, ' (...)')

                        }}</p>
                </div>
                <div class="ratings">

   <!-- $promenljiva =$n->posted_date;
    $_pro = explode($promenljiva,' ');
    $pro_date = explode($_pro[0],'-');

    $year = $pro_date[0];
    $month = $pro_date[1];
    $date = $pro_date[2];

    $pro_time = explode($_pro[1],':');

    $hours = $pro_time[0];
    $minutes = $pro_time[1];
    $secundes = $pro_time[2];

    $timestamp = mktime($hours,$minutes,$secundes,$month,$date,$year);

    $datum = date("d.m.Y H:i",$timestamp);-->

                    <p class="pull-right"></p>
                    <p>
                       <b><a href="{{route('showOne').'/'.$n->id_news}}" style="color:#000;">Više</a></b>
                    </p>
                </div>
            </div>
        </div>
            @endforeach
        @endif

       <!-- <div class="col-sm-4 col-lg-4 col-md-4">
            <div class="thumbnail">
                <img src="http://placehold.it/320x150" alt="">
                <div class="caption">
                    <h4 class="pull-right">$94.99</h4>
                    <h4><a href="#">Fifth Product</a>
                    </h4>
                    <p>This is a short description. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                </div>
                <div class="ratings">
                    <p class="pull-right">18 reviews</p>
                    <p>
                        <span class="glyphicon glyphicon-star"></span>
                        <span class="glyphicon glyphicon-star"></span>
                        <span class="glyphicon glyphicon-star"></span>
                        <span class="glyphicon glyphicon-star"></span>
                        <span class="glyphicon glyphicon-star-empty"></span>
                    </p>
                </div>
            </div>
        </div>-->

    </div>


</div>

</div>

</div>
<!-- /.container -->
@endsection