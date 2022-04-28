@extends('layouts.layout')
@section('titol', 'xx')
@section('name')
<a href="{{ url('/expedients_controller') }} " class="btn btn-info" role="button"><i class="fa-solid fa-arrow-left-long"></i></a>
    <h3>Filtres</h3>
    <form
        action="{{ action([App\Http\Controllers\ExpedientController::class, 'show'], ['expedients_controller' => $expedients_controller->id]) }}"
        method="GET">
        @csrf
        <div class="row">
            <div class="col">
                <!-- Name input -->
                <div class="form-outline">
                    <label class="form-label" for="form8Example1">Nº Carta</label>
                    @if (!empty($id))
                        <input type="text" id="form8Example1" min="001" class="form-control" placeholder="Ex:CT_1"
                            name="id" value="{{ $id }}" />
                    @else
                        <input type="text" id="form8Example1" min="001" class="form-control" placeholder="Ex:CT_1"
                            name="id" value="" />
                    @endif

                </div>
            </div>

        </div>

        <hr />

        <div class="row">
            <div class="col">
                <!-- Name input -->
                <div class="form-outline">
                    <label class="form-label" for="form8Example3">Data </label>
                    @if (!empty($fecha))
                        <input type="date" id="form8Example3" class="form-control" name="fecha"
                            value="{{ $fecha }}" />
                    @else
                        <input type="date" id="form8Example3" class="form-control" name="fecha" value="" />
                    @endif
                </div>
            </div>
            <div class="col">
                <!-- Name input -->
                <div class="form-outline">
                    <label class="form-label" for="form8Example4">Telefon</label>
                    @if (!empty($tel))
                        <input type="number" id="form8Example4" class="form-control" minlength="9" maxlength="9"
                            name="telf" placeholder="Ex:222222222" value="{{ $tel }}" />
                    @else
                        <input type="number" id="form8Example4" class="form-control" minlength="9" maxlength="9"
                            name="telf" placeholder="Ex:222222222" value="" />
                    @endif

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
                        @if (!empty($tipusLocs))
                            <option value="todos"> Todos</option>
                            @foreach ($tipusLoc as $tipusLloc)
                                @if ($tipusLocs == $tipusLloc->tipus)
                                    <option value="{{ $tipusLloc->tipus }}" selected>{{ $tipusLloc->tipus }}
                                    </option>
                                @else
                                    <option value="{{ $tipusLloc->tipus }}">{{ $tipusLloc->tipus }}</option>
                                @endif
                            @endforeach
                        @else
                            <option value="todos" selected>Todos</option>
                            @foreach ($tipusLoc as $tipusLloc)
                                <option value="{{ $tipusLloc->tipus }}">{{ $tipusLloc->tipus }}</option>
                            @endforeach
                        @endif


                    </select>

                </div>
            </div>
            <div class="col">
                <!-- Name input -->
                <div class="form-outline">
                    <label class="form-label" for="form8Example4">Tipus Emergencia</label>
                    <select class="form-select" aria-label="Default select example" name="emer">
                        @if (!empty($tipusEmgs))
                            <option value="todos"> Todos</option>
                            @foreach ($tipusEmg as $tipusEmer)
                                @if ($tipusEmgs == $tipusEmer->descripcio)
                                    <option value="{{ $tipusEmer->descripcio }}" selected>
                                        {{ $tipusEmer->descripcio }}
                                    </option>
                                @else
                                    <option value="{{ $tipusEmer->descripcio }}">{{ $tipusEmer->descripcio }}
                                    </option>
                                @endif
                            @endforeach
                        @else
                            <option value="todos" selected>Todos</option>
                            @foreach ($tipusEmg as $tipusEmer)
                                <option value="{{ $tipusEmer->descripcio }}">{{ $tipusEmer->descripcio }}</option>
                            @endforeach
                        @endif

                    </select>

                </div>
            </div>



        </div>
        <hr />


        <div class="col-1">
            <button type="submit" class="btn"><i class="fa-solid fa-magnifying-glass" aria-hidden="true"></i>
                Buscar</button>
        </div>
    </form>
    @if (count($cartes) > 0)

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
                            <th scope="col">Telefon</th>



                        </tr>
                    </thead>
                    <tbody>

                        @foreach ($cartes as $carta)
                            <tr>
                                <td>{{ $carta->codi_trucada }}</td>
                                <td>{{ date('d-m-Y', strtotime($carta->data_hora)) }}</td>
                                <td>{{ $carta->tipus }}</td>
                                <td>{{ $carta->descripcio }}</td>
                                <td>{{ $carta->telefon }}</td>
                                <td>
                                    <form
                                        action="{{ action([App\Http\Controllers\CartaController::class, 'show'], ['cartum' => $carta->codi_trucada]) }}"
                                        method="GET">

                                        @csrf

                                        <button type="submit" class="btn"><i
                                                class="fa-solid fa-pen-to-square"></i>
                                            Carta Trucada</button>
                                    </form>
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
                {{ $cartes->links() }}

            </div>

        </div>
    @else
        <br>
        <div class="alert alert-dismissible alert-danger">
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            <strong>Cap resultat trobat!</strong>
        </div>
    @endif
@endsection
