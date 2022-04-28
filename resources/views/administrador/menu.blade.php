@extends('layouts.layoutS.plantilla')

@section("title", "Menu")

@section("container")

    {{-- Incluimos la decoración de fondo: --}}
    @include('partials.backgroundDecoration')

    @if ($usuari->perfils_id == 2)
        <div class="container-fluid d-flex flex-row justify-content-around align-items-center w-100" style="height: 100vh;">
            <div class="card mb-3 d-flex justify-content-center align-items-center rounded"
            style="width: 33%; height: 25%; background-color: #F2A0A0; box-shadow: rgba(0, 0, 0, 0.2) 0px 20px 30px; outline: none; border: none; cursor: pointer;">
                <div class="row g-0 h-100 w-100">
                    <div class="col-md-4 d-flex justify-content-center align-items-center rounded"
                    style="background-color: #f28787;">
                        <i class="fa fa-id-card fa-5x" aria-hidden="true"></i>
                    </div>
                    <div class="col-md-8 d-flex justify-content-center align-items-center h-100">
                        <div class="card-body m-0 p-0 h-100 d-flex flex-column justify-content-center align-items-center w-100">
                            <form action="{{ action([App\Http\Controllers\CartaTrucadaController::class, 'index']) }}" class="m-0 p-0 w-100" method="GET">
                                @csrf
                                <button type="submit" class="d-flex justify-content-center align-items-center w-100" style="background-color: transparent; outline: none; border: none; cursor: pointer;">
                                    <h5 class="card-title m-0 p-0 col-9 d-flex justift-content-start ps-3">Carta de trucada</h5>
                                    <i class="pe-4 ps-4 fas fa-arrow-right fa-2x col-3 d-flex justify-content-center align-items-center"></i>
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card mb-3 d-flex justify-content-center align-items-center rounded"
            style="width: 33%; height: 25%; background-color: #F2A0A0; box-shadow: rgba(0, 0, 0, 0.2) 0px 20px 30px; outline: none; border: none;">
                <div class="row g-0 h-100 w-100">
                    <div class="col-md-4 d-flex justify-content-center align-items-center rounded"
                    style="background-color: #F28787;">
                        <i class="fa fa-file-pdf-o fa-5x" aria-hidden="true"></i>
                    </div>
                    <div class="col-md-8 d-flex justify-content-center align-items-center h-100">
                        <div class="card-body m-0 p-0 w-100 h-100 d-flex flex-column justify-content-center align-items-center">
                            <form action="{{ action([App\Http\Controllers\ExpedientController::class, 'index']) }}" class="m-0 p-0 w-100" method="GET">
                                @csrf
                                <button type="submit" class="d-flex justify-content-center align-items-center w-100" style="background-color: transparent; outline: none; border: none; cursor: pointer;">
                                    <h5 class="card-title m-0 p-0 col-9 d-flex justift-content-start ps-3">Expedients</h5>
                                    <i class="pe-4 ps-4 fas fa-arrow-right fa-2x col-3 d-flex justify-content-center align-items-center"></i>
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    @else
        <div class="container-fluid d-flex flex-column justify-content-center align-items-around" style="height: 100vh;">
            <div class="container-fluid h-50 d-flex flex-row justify-content-around align-items-center">
                <div class="card mb-3 d-flex justify-content-center align-items-center mt-5 rounded"
                style="width: 33%; height: 50%; background-color: #F2A0A0; box-shadow: rgba(0, 0, 0, 0.2) 0px 20px 30px; outline: none; border: none;">
                    <div class="row g-0 h-100 w-100">
                        <div class="col-md-4 d-flex justify-content-center align-items-center rounded"
                        style="background-color: #F28787;">
                            <i class="fa fa-file-pdf-o fa-5x" aria-hidden="true"></i>
                        </div>
                        <div class="col-md-8 d-flex justify-content-center align-items-center h-100">
                            <div class="card-body m-0 p-0 w-100 h-100 d-flex flex-column justify-content-center align-items-center">
                                <form action="{{ action([App\Http\Controllers\ExpedientController::class, 'index']) }}" class="m-0 p-0 w-100" method="GET">
                                    @csrf
                                    <button type="submit" class="d-flex justify-content-center align-items-center w-100" style="background-color: transparent; outline: none; border: none; cursor: pointer;">
                                        <h5 class="card-title m-0 p-0 col-9 d-flex justift-content-start ps-3">Expedients</h5>
                                        <i class="pe-4 ps-4 fas fa-arrow-right fa-2x col-3 d-flex justify-content-center align-items-center"></i>
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card mb-3 d-flex justify-content-center align-items-center mt-5 rounded"
                style="width: 33%; height: 50%; background-color: #F2A0A0; box-shadow: rgba(0, 0, 0, 0.2) 0px 20px 30px; outline: none; border: none; cursor: pointer;">
                    <div class="row g-0 h-100 w-100">
                        <div class="col-md-4 d-flex justify-content-center align-items-center rounded"
                        style="background-color: #f28787;">
                            <i class="fa fa-users fa-5x" aria-hidden="true"></i>
                        </div>
                        <div class="col-md-8 d-flex justify-content-center align-items-center h-100">
                            <div class="card-body m-0 p-0 h-100 d-flex flex-column justify-content-center align-items-center w-100">
                                <form action="{{ action([App\Http\Controllers\UsuariController::class, 'index']) }}" class="m-0 p-0 w-100" method="GET">
                                    @csrf
                                    <button type="submit" class="d-flex justify-content-center align-items-center w-100" style="background-color: transparent; outline: none; border: none; cursor: pointer;">
                                        <h5 class="card-title m-0 p-0 col-9 d-flex justift-content-start ps-3">Usuaris</h5>
                                        <i class="pe-4 ps-4 fas fa-arrow-right fa-2x col-3 d-flex justify-content-center align-items-center"></i>
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container-fluid h-50 d-flex flexd-row justify-content-around align-items-center">
                <div class="card mb-3 d-flex justify-content-center align-items-center mb-5 rounded"
                style="width: 33%; height: 50%; background-color: #F2A0A0; box-shadow: rgba(0, 0, 0, 0.2) 0px 20px 30px; outline: none; border: none; cursor: pointer;">
                    <div class="row g-0 h-100 w-100">
                        <div class="col-md-4 d-flex justify-content-center align-items-center rounded"
                        style="background-color: #f28787;">
                            <i class="fa fa-id-card fa-5x" aria-hidden="true"></i>
                        </div>
                        <div class="col-md-8 d-flex justify-content-center align-items-center h-100">
                            <div class="card-body m-0 p-0 h-100 d-flex flex-column justify-content-center align-items-center w-100">
                                <form action="{{ action([App\Http\Controllers\CartaTrucadaController::class, 'index']) }}" class="m-0 p-0 w-100" method="GET">
                                    @csrf
                                    <button type="submit" class="d-flex justify-content-center align-items-center w-100" style="background-color: transparent; outline: none; border: none; cursor: pointer;">
                                        <h5 class="card-title m-0 p-0 col-9 d-flex justift-content-start ps-3">Carta de trucada</h5>
                                        <i class="pe-4 ps-4 fas fa-arrow-right fa-2x col-3 d-flex justify-content-center align-items-center"></i>
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card mb-3 d-flex justify-content-center align-items-center mb-5 rounded"
                style="width: 33%; height: 50%; background-color: #F2A0A0; box-shadow: rgba(0, 0, 0, 0.2) 0px 20px 30px; outline: none; border: none; cursor: pointer;">
                    <div class="row g-0 h-100 w-100">
                        <div class="col-md-4 d-flex justify-content-center align-items-center rounded"
                        style="background-color: #f28787;">
                            <i class="fas fa-chart-line fa-5x"></i>
                        </div>
                        <div class="col-md-8 d-flex justify-content-center align-items-center h-100">
                            <div class="card-body m-0 p-0 h-100 d-flex flex-column justify-content-center align-items-cente w-100">
                                <form action="{{ action([App\Http\Controllers\GraficaController::class, 'index']) }}" class="m-0 p-0 w-100" method="GET">
                                    @csrf
                                    <button type="submit" class="d-flex justify-content-center align-items-center w-100" style="background-color: transparent; outline: none; border: none; cursor: pointer;">
                                        <h5 class="card-title m-0 p-0 col-9 d-flex justift-content-start ps-3">Big data</h5>
                                        <i class="pe-4 ps-4 fas fa-arrow-right fa-2x col-3 d-flex justify-content-center align-items-center"></i>
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    @endif

@endsection
