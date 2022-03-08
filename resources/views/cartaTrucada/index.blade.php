@extends("plantillas.index")

@section("title","Carta de trucada")

@section("container")
    <div class="row">
        <div class="col col-6 colCard">

            <personal-section></personal-section>

            <location-section></location-section>

            <div class="row">
                <div class="col colSection colLocation">
                    <div class="row">
                        <div class="col">
                            <h4>Localització</h4>
                        </div>
                    </div>


                </div>
            </div>

        </div>
        <div class="col col-6 colCard">

        </div>

    </div>

@endsection
