@extends('plantillas.index')

@section("title", "Login")

@section("container")

    {{-- Imagen esquina superior izquierda: --}}
    <img src="{{ asset('images/pinkSquare.svg') }}" alt="Logo Broggi" width="150" height="150"
    class="parteLogoArribaIzquierda animationPink p-0 position-absolute top-0 start-0">

    {{-- Imagen esquina inferior izquierda: --}}
    <img src="{{ asset('images/yellowSquare.svg') }}" alt="Logo Broggi" width="325" height="325"
    class="parteLogoAbajoIzquierda partesSeparadasLogoRotar animationYellow p-0 position-absolute start-0 bottom-0">

    {{-- Imagen esquina inferior derecha: --}}
    <img src="{{ asset('images/pinkSquare.svg') }}" alt="Logo Broggi" width="150" height="150"
    class="parteLogoAbajoDerecha rotarParteAbajoIzquierda animationPink p-0 position-absolute bottom-0 end-0">

    {{-- Imagen esquina superior derecha: --}}
    <img src="{{ asset('images/blueSquare.svg') }}" alt="Logo Broggi" width="325" height="325"
    class="parteLogoArribaDerecha partesSeparadasLogoRotar animationBlue p-0 position-absolute top-0 end-0">

    {{-- Formulario para el login --}}
    <div class="container-fluid d-flex justify-content-center align-items-center position-absolute rounded overflow-hidden w-100 h-100">
        <div class="card d-flex flex-row rounded-2" style="width: 65%; height: 40%; box-shadow: rgba(0, 0, 0, 0.2) 0px 20px 30px; outline: none; border: none;">
            <div class=" rounded bg-light text-light p-0 m-0 d-flex justify-content-center align-items-center">
                <img class="m-2 p-0" src="{{ asset('images/LogoHorizontal.svg') }}" width="150" height="150" alt="Broggi Logo">
            </div>
            <div class="card-body h-100">
                <form class="h-100 d-flex flex-column justify-content-around" method="POST">
                    @csrf
                    <div class="form-group row mb-3">
                        <label for="correu" class="col-sm-3 col-form-label">Codi</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="codigo" name="codigo" autofocus
                                value="{{ old('codigo') }}">
                        </div>
                    </div>
                    <div class="form-group row mb-3">
                        <label for="contrasenya" class="col-sm-3 col-form-label">Contrasenya</label>
                        <div class="col-sm-9">
                            <input type="password" class="form-control" id="passwd" name="passwd"
                                value="{{ old('passwd') }}">
                        </div>
                    </div>

                    <div class="form-group row">
                        <div class="col-sm-12 d-flex justify-content-end">
                            <button type="submit" class="btn" style="background-color: #636AF2"><i class="fa fa-check"
                                aria-hidden="true"></i> Login</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

@endsection
