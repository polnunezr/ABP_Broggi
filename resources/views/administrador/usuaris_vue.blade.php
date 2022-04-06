@extends('layouts.layout')

@section("title", "Usuaris")

@section("name")

    {{-- Incluimos la decoración de fondo: --}}
    @include('partials.backgroundDecoration')

    <div class="container-fluid d-flex flex-column justify-content-center align-items-center" style="height: 100vh;">
        <div class="h-100 w-100">
            {{-- Creamos una 'Card' para el buscador: --}}
            {{-- <div class="card container mb-5" style="background-color: #F2A0A0;">
                <div class="card-body">
                    <h5 class="card-title mb-4">Cerca</h5>
                    <form action="{{ action([App\Http\Controllers\UsuariController::class, 'index']) }}">

                            Para evitar que la página nos de error y para evitar los ataques Cross-site Request Forgery
                            debemos usar el siguiente toquen dentro del formulario:

                        @csrf
                        <div class="row">
                            <div class="col-1 d-flex justify-content-start align-items-center">
                                <label class="form-check-label" for="selectPerfil">Usuari</label>
                            </div>
                            <div class="col-8 d-flex justify-content-start align-items-center">
                                <select id="selectPerfil" class="form-select" name="selectPerfil">
                                    <option {{ old('selectPerfil') == "" ? 'selected' : '' }} value="0">Tots els perfils</option>
                                    @foreach ($perfiles as $perfil)
                                        <option value="{{ $perfil->id }}" {{ old('selectPerfil') == $perfil->id ? 'selected' : '' }}>{{ $perfil->nom }}</option>
                                    @endforeach
                                </select>
                            </div>

                            Gracias al método 'flash()' que usamos en 'UsuariController' se nos permite
                            recuperar los valores antiguos de los inputs después de hacer submit, con el 'old'
                            comprobamos si la checkbox antes del submit estaba marcada o no para saber si
                            marcarla o desmarcarla, lo mismo haremos usando el método 'old' en la select:
                            @if (old("activoBuscar") == "activo")
                                <div class="col-2 d-flex justify-content-center align-items-center">
                                    <input type="checkbox" class="form-check-input float-end m-2" id="activoBuscar"
                                    name="activoBuscar" value="activo" checked>
                                    <label class="form-check-label" for="activoBuscar">Actiu</label>
                                </div>
                            @else
                                <div class="col-2 d-flex justify-content-center align-items-center">
                                    <input type="checkbox" class="form-check-input float-end m-2" id="activoBuscar"
                                    name="activoBuscar" value="activo">
                                    <label class="form-check-label" for="activoBuscar">Actiu</label>
                                </div>
                            @endif

                            <div class="col-1 d-flex justify-content-center align-items-center float-end">
                                <button type="submit" class="btn btn-secondary">
                                    <i class="fa fa-search" aria-hidden="true"></i>
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div> --}}

            {{-- Componente con la tabla de usuarios, le enviamos los perfiles que sacamos de la base de datos: --}}
            <usuaris-component :perfiles="{{ $perfiles }}"></usuaris-component>
        </div>
    </div>

@endsection
