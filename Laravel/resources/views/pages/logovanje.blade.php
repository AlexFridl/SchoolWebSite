@extends('layout.index')

@section('content')
    @empty(!session('poruka'))
        {{session('poruka')}}
    @endempty


    <form method="POST" action="{{route('doLogin')}}" >
    {{csrf_field()}}
    <table>
        <tr>
            <td>Korisnicko ime:</td>
            <td><input type="text" name="korisnicko_ime"  class="form-control" placeholder="Korisnicko ime"/></td>
        </tr>

        <tr>
            <td>Lozinka:</td>
            <td><input type="password" name="lozinka"  class="form-control" placeholder="Lozinka"/></td>
        </tr>
        <tr>
            <td  colspan="2" align="center"><input type="submit" name="btnRegistracija" value="Registruj se"/></td>
        </tr>
    </table>
    </form>


@endsection