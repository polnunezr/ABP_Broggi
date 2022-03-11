@extends("plantillas.index")

@section("title","Carta de trucada")

@section("container")
    <div>
        {{-- <finish-section  v-if="selectSection != interactiveVideo"></finish-section> --}}
        <div class="container-fluid">
            <div class="row">

                <div class="col col-2 colCard colNavBarHorizontal">
                    <tab-apart></tab-apart>


                </div>
                <div v-bind:class = "selectSection != interactiveVideo ? 'col col-7 colCard' : 'col col-10 colCard'">
                    <div v-bind:style="selectSection == personalData ? 'display: block;' : 'display: none;'">
                        <personal-section></personal-section>
                    </div>
                    <div v-bind:style="selectSection == locate ? 'display: block;' : 'display: none;'">
                        <location-section></location-section>
                    </div>
                    <div v-bind:style="selectSection == agency ? 'display: block;' : 'display: none;'">
                        <agency-section></agency-section>
                    </div>
                    <div v-bind:style="selectSection == emergency ? 'display: block;' : 'display: none;'">
                        <emergency-section></emergency-section>
                    </div>
                    <div v-bind:style="selectSection == communeNote ? 'display: block;' : 'display: none;'">
                        <commune-note-section></commune-note-section>
                    </div>
                    <div v-bind:style="selectSection == relationExpedient ? 'display: block;' : 'display: none;'">
                        <relation-section></relation-section>
                    </div>
                    <div v-bind:style="selectSection == interactiveVideo ? 'display: block;' : 'display: none;'">
                        <video-section></video-section>
                    </div>


                </div>

                <time-section v-if="selectSection != interactiveVideo"></time-section>





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
        </div>
    </div>




@endsection
