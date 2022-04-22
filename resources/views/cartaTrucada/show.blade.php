@extends("layouts.layoutCard.index")

@section("title","Carta de trucada View")

@section("container")
    <div>
        {{-- @if ($dadaPersonalShow == null)
            {{ $dadaPersonalShow = json_encode(null) }}
        @endif --}}
        {{-- {{ var_dump($cartaTrucadaShow) }} --}}
        <carta-trucada :cartaTrucadaShow="{{ $cartaTrucadaShow }}" :show="true"
                        :dadaPersonalShow="{{ $dadaPersonalShow }}"
                        :localitzacioTrucadaShow="{{ $localitzacioTrucadaShow }}"
                        :localitzacioShow="{{ $localitzacioShow }}"
                        :tipusLocalitzacioShow="{{ $tipusLocalitzacioShow }}"
                        :incidentShow="{{ $incidentShow }}"
                        :agenciesShow="{{ $agenciesShow }}"
                        ></carta-trucada>
    </div>

@endsection
