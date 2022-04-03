@extends('plantillas.index')

@section("title", "Menu")

@section("container")

    {{-- Incluimos la decoración de fondo: --}}
    @include('partials.backgroundDecoration')

    <div class="container-fluid d-flex flex-column justify-content-center align-items-center" style="height: 100vh;">
        <div class="container-fluid h-50 d-flex flex-row justify-content-around align-items-center">
            <div class="card mb-3 d-flex justify-content-center align-items-center"
            style="width: 30%; height: 50%; background-color: #F2A0A0; box-shadow: rgba(0, 0, 0, 0.2) 0px 20px 30px; outline: none; border: none; cursor: pointer;">
                <div class="row g-0">
                    <div class="col-md-4 d-flex justify-content-center align-items-center">
                        <i class="fa fa-file-pdf-o fa-5x" aria-hidden="true"></i>
                    </div>
                    <div class="col-md-8">
                        <div class="card-body">
                        <h5 class="card-title">Gestionar expedients</h5>
                        {{-- <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                        <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p> --}}
                        </div>
                    </div>
                </div>
            </div>
            <div class="card mb-3 d-flex justify-content-center align-items-center"
            style="width: 30%; height: 50%; background-color: #F2A0A0; box-shadow: rgba(0, 0, 0, 0.2) 0px 20px 30px; outline: none; border: none; cursor: pointer;">
                <div class="row g-0">
                    <div class="col-md-4 d-flex justify-content-center align-items-center">
                        <i class="fa fa-users fa-5x" aria-hidden="true"></i>
                    </div>
                    <div class="col-md-8">
                        <div class="card-body">
                        <h5 class="card-title">Gestionar usuaris</h5>
                        {{-- <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                        <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p> --}}
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid h-50 d-flex flexd-row justify-content-around align-items-center">
            <div class="card mb-3 d-flex justify-content-center align-items-center"
            style="width: 30%; height: 50%; background-color: #F2A0A0; box-shadow: rgba(0, 0, 0, 0.2) 0px 20px 30px; outline: none; border: none; cursor: pointer;">
                <div class="row g-0">
                    <div class="col-md-4 d-flex justify-content-center align-items-center">
                        <i class="fa fa-id-card fa-5x" aria-hidden="true"></i>
                    </div>
                    <div class="col-md-8">
                        <div class="card-body">
                        <h5 class="card-title">Carta de trucada</h5>
                        {{-- <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                        <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p> --}}
                        </div>
                    </div>
                </div>
            </div>
            <div class="card mb-3 d-flex justify-content-center align-items-center"
            style="width: 30%; height: 50%; background-color: #F2A0A0; box-shadow: rgba(0, 0, 0, 0.2) 0px 20px 30px; outline: none; border: none; cursor: pointer;">
                <div class="row g-0">
                    <div class="col-md-4 d-flex justify-content-center align-items-center">
                        <i class="fas fa-chart-line fa-5x"></i>
                    </div>
                    <div class="col-md-8">
                        <div class="card-body">
                        <h5 class="card-title">Big data</h5>
                        {{-- <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                        <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p> --}}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

@endsection
