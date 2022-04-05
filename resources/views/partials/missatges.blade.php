{{-- Si en la sesión hay un error mostramos una alert danger con el error: --}}
@if (Session::has("error"))
    <div class="container-fluid d-flex justify-content-center align-items-center">
        <div class="position-absolute top-0 mt-5 p-4 alert alert-dismissible w-75"
        role="alert" style="background-color: #D962A3; margin: 0 auto; z-index: 999;
        box-shadow: rgba(0, 0, 0, 0.2) 0px 20px 30px; outline: none; border: none;">
            <div class="container-fluid d-flex flex-row justify-content-center align-items-center">
                <span class="col-11 text-center">{{ Session::get("error") }}</span>
                <i class="fa fa-times" type="button" class="btn-close col-1" data-bs-dismiss="alert"></i>
            </div>
        </div>
    </div>
@endif

{{-- Si en la sesión hay un mensaje de confirmación mostramos una alert success con el mensaje: --}}
@if (Session::has('mensaje'))
    <div class="container-fluid d-flex justify-content-center align-items-center">
        <div class="position-absolute top-0 mt-5 p-4 alert alert-dismissible w-75"
        role="alert" style="background-color: #636AF2; margin: 0 auto; z-index: 999;
        box-shadow: rgba(0, 0, 0, 0.2) 0px 20px 30px; outline: none; border: none;">
            <div class="container-fluid d-flex flex-row justify-content-center align-items-center">
                <span class="col-11 text-center">{{ Session::get("mensaje") }}</span>
                <i class="fa fa-times" type="button" class="btn-close col-1" data-bs-dismiss="alert"></i>
            </div>
        </div>
    </div>
@endif
