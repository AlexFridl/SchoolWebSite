{{--<!-- Page Content -->--}}
{{--<div class="container">--}}

    {{--<div class="row">--}}

        {{--<div class="col-md-3">--}}
            {{--<p class="lead">Shop Name</p>--}}
            {{--<div class="list-group">--}}
                {{--@isset($kategorije)--}}
                    {{--@foreach($kategorije as $kategorija)--}}
                {{--<a href="#" class="list-group-item" data-id="{{$kategorija->id}}">{{$kategorija->naziv}}</a>--}}
                    {{--@endforeach--}}
                {{--@endisset--}}
                {{--<a href="#" class="list-group-item">Category 2</a>--}}
                {{--<a href="#" class="list-group-item">Category 3</a>--}}
            {{--</div>--}}
        {{--</div>--}}



<!-- Page Content -->
<div class="container">
<div class="row">

<div class="col-md-3">
    <p class="lead" style="color:red">TopNews</p>
    <div class="list-group" style="width:100px;">


        <nav class="navbar navbar-light bg-light" >
            <ul class="nav" style="list-style:none;font-size:20px;">

                @if(isset($kategorije))
                    @foreach($kategorije as $kategorija)
                       <li ><a href="{{route('category').'/'.$kategorija->id_category}}" class="nav-brand" style="display: block;width:120px;color:#000;">{{$kategorija->name_category}}</a></li>

                    @endforeach
                @endif

{{--a href="{{url::to('kategorija/'.$id->id_category)}}"--}}


            </ul>
        </nav>
    </div>
    <div id="search">
        <form class="form-inline">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit" name="btnSubmit">Search</button>
        </form>

    </div>
</div>