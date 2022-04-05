@extends('plantillas.index')

@section("title", "Expedients")

@section("container")

    @include('partials.backgroundDecoration')

    <div class="container-fluid">
        {{ $usuari->perfils_id }}
    </div>

@endsection
