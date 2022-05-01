@extends('layouts.layoutS.plantilla')

@section("title", "Usuaris")

@section("container")

    {{-- Incluimos la decoración de fondo: --}}
    {{-- @include('partials.backgroundDecoration') --}}

    <div class="container-fluid d-flex flex-column justify-content-center align-items-center" style="height: 100vh; background-color: #dcdcdc">
        <div class="h-100 w-100">
            {{-- Componente que contiene la tabla de usuarios y componentes hijos como los modals de insertar, modificar y desactivar usuarios. A este componente
            le enviamos un array con los perfiles de usuario, el 'id' del usuario con el que iniciamos sesión y la ruta para volver al menú: --}}
            <usuaris-component :perfiles="{{ $perfiles }}" :authid="{{ $authid }}" menu="{{ route('menu') }}"></usuaris-component>
        </div>
    </div>

@endsection
