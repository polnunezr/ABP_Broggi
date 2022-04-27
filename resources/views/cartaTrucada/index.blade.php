@extends("layouts.layoutCard.index")

@section("title","Carta de trucada")

@section("container")
    <div>
        <carta-trucada :show="false" logOutRoute="{{ route('menu') }}" :user="{{ $user }}"></carta-trucada>
    </div>

@endsection
