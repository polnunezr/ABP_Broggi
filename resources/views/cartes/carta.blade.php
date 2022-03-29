@extends('layouts.layout')
@section('titol', 'xx')
@section('name')
    <h3>Filtres</h3>
    <form action="{{ action([App\Http\Controllers\CartaController::class, 'index']) }}" method="GET">
        @csrf
        <div class="row">
            <div class="col">
                <!-- Name input -->
                <div class="form-outline">
                    <label class="form-label" for="form8Example1">Nº Expedient</label>
                    <input type="text" id="form8Example1" min="001" class="form-control" placeholder="Ex:CT_1" name="id"
                        value="" />
                </div>
            </div>
            <div class="col">
                <!-- Email input -->
                <div class="form-outline">
                    <label class="form-label" for="form8Example2">Operador/a</label>
                    <input type="email" id="form8Example2" class="form-control" name="operador" value="" />
                </div>
            </div>
        </div>

        <hr />

        <div class="row">
            <div class="col">
                <!-- Name input -->
                <div class="form-outline">
                    <label class="form-label" for="form8Example3">Data Modificacio</label>
                    <input type="date" id="form8Example3" class="form-control" name="modicacio" />
                </div>
            </div>
            <div class="col">
                <!-- Name input -->
                <div class="form-outline">
                    <label class="form-label" for="form8Example4">Telefon</label>
                    <input type="number" id="form8Example4" class="form-control" minlength="9" maxlength="9" name="telf"
                        placeholder="Ex:222222222" value="" />
                </div>
            </div>

        </div>
        <hr />

        <div class="row">
            <div class="col">
                <!-- Name input -->
                <div class="form-outline">
                    <label class="form-label" for="form8Example3">Tipus Localització</label>
                    <select class="form-select" aria-label="Default select example" name="loc">
                        <option value="todos" selected>Todos</option>
                        @foreach ($tipusLocs as $tipusLoc)
                            <option value="{{ $tipusLoc->tipus }}">{{ $tipusLoc->tipus }}</option>
                        @endforeach
                    </select>

                </div>
            </div>
            <div class="col">
                <!-- Name input -->
                <div class="form-outline">
                    <label class="form-label" for="form8Example4">Tipus Emergencia</label>
                    <select class="form-select" aria-label="Default select example" name="emer">
                        <option value="todos" selected>Todos</option>
                        @foreach ($tipusIncs as $tipusInc)
                            <option value="{{ $tipusInc->descripcio }}">{{ $tipusInc->descripcio }}</option>
                        @endforeach
                    </select>

                </div>
            </div>



        </div>
        <hr />

        <div class="row">
            <h4>Estat</h4>

            <div class="col">
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="checkbox" id="actiuBuscar" value="noactiu" name="actiuBuscar">
                    <label class="form-check-label" for="actiuBuscar">No actiu</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="checkbox" id="actiuBuscar" value="actiu" name="actiuBuscar">
                    <label class="form-check-label" for="actiuBuscar">Actiu</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="checkbox" id="actiuBuscar" value="todos" name="actiuBuscar">
                    <label class="form-check-label" for="actiuBuscar">Tots</label>
                </div>
            </div>
        </div>
        <hr />
        <div class="col-1">
            <button type="submit" class="btn btn-secondary"><i class="fa-solid fa-magnifying-glass" aria-hidden="true"></i>
                Buscar</button>
        </div>
    </form>
    <div class="card mt-2">
        <div class="card-body">
            <h5 class="card-title">
            </h5>
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th scope="col">NºExpedient</th>
                        <th scope="col">Data</th>
                        <th scope="col">Tipus Localitzacio</th>
                        <th scope="col">Tipus accident</th>


                    </tr>
                </thead>
                <tbody>





                    <!--<td>
                                                        xif ($curso->actiu)
                                                            <div class="custom-control custom-checkbox">
                                                                <input class="form-check-input" type="checkbox" value="actiu" id="flexCheckChecked"
                                                                    checked="">

                                                                <label class="custom-control-label" for="actiu"></label>

                                                            </div>
                                                        else
                                                            <div class="custom-control custom-checkbox">
                                                                <input class="form-check-input" type="checkbox" value="actiur"
                                                                    id="flexCheckChecked">

                                                                <label class="custom-control-label" for="actiu"></label>

                                                            </div>
                                                        endif
                                                    </td>-->

                    <!-- Button trigger modal -->




                </tbody>
            </table>
        </div>

    </div>

@endsection
