<body>

<!-- Navigation -->
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation" style="background:#D41A1F">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#" style="font-weight:bold;color: black">TopNews</a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav" >
                <li>
                    <a href="{{route('index')}}" style="color: black">Pocetna</a>
                </li>
                <li>
                    <a href="{{route('regForma')}}" style="color: black">Registracija</a>
                </li>
                <li>
                    <a href="{{route('loginForma')}}" style="color: black">Logovanje</a>
                </li>
                <li>
                    <a href="{{route('logout')}}" style="color: black">Logout</a>
                </li>
                <li>
                    <a href="{{route('author')}}" style="color: black">Autor</a>
                </li>
                <li>
                    <a href="doc/dokumentacija.pdf" style="color: black">Dokumentacija</a>
                </li>


            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container -->
</nav>
