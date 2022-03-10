@extends("plantillas.index")

@section("title","Carta de trucada")

@section("container")
    <div class="row">

        <div class="col col-2 colCard colNavBarHorizontal">
            <tab-apart></tab-apart>


        </div>
        <div class="col col-7 colCard">
            <personal-section v-if="selectSection == personalData"></personal-section>
            <location-section v-else-if="selectSection == locate"></location-section>
            <agency-section v-else-if="selectSection == agency"></agency-section>
            <emergency-section v-else-if="selectSection == emergency"></emergency-section>
            <commune-note-section v-else-if="selectSection == communeNote"></commune-note-section>
            <relation-section v-else></relation-section>
        </div>

        <time-section></time-section>



        {{-- <div class="col col-6 colCard">

            <personal-section></personal-section>

            <location-section></location-section>

            <agency-section></agency-section>

        </div>
        <div class="col col-6 colCard">
            <emergency-section></emergency-section>
            <commune-note-section></commune-note-section>
            <relation-section></relation-section>
            <finish-section></finish-section>

        </div> --}}

    </div>



@endsection
