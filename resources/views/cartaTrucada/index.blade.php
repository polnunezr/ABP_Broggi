@extends("layouts.layoutCard.index")

@section("title","Carta de trucada")

@section("container")
    <div>
        <carta-trucada :show="false"
        :user="{{ $user }}"
        logOutRoute="{{ route('menu') }}"
        logOutRouteOperador="{{ route('sortir') }}"></carta-trucada>
    </div>

@endsection
