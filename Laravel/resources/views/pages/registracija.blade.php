@extends('layout.index')


@section('title')
    Registracija
@endsection


@section('content')
    <form method="POST" action="{{route('doReg')}}">
        {{csrf_field()}}
        <table>
            <tr>
                <td>Ime:</td>
                <td><input type="text" name="ime" class="form-control" placeholder="Ime"/></td>
            </tr>
            <tr>
                <td>Prezime:</td>
                <td><input type="text" name="prezime"  class="form-control" placeholder="Prezime"/></td>
            </tr>

            <tr>
                <td>Email:</td>
                <td><input type="text" name="email"  class="form-control" placeholder="Email"/></td>
            </tr>

            <tr>
                <td>Korisnicko ime:</td>
                <td><input type="text" name="korisnicko_ime"  class="form-control" placeholder="Korisnicko ime"/></td>
            </tr>

            <tr>
                <td>Lozinka:</td>
                <td><input type="password" name="lozinka"  class="form-control" placeholder="Lozinka"/></td>
            </tr>


            <tr>
                <td align="center">
                    <td><input type="submit" name="btnRegistracija" value="Registruj se"/></td>
            </tr>
        </table>
    </form>





@endsection