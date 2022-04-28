@extends('layouts.layout')
@section('titol', 'xx')
@section('name')
    <form action="{{ action([App\Http\Controllers\ExpedientController::class, 'index']) }}" method="GET">

        <h3>Filtres</h3>
        @csrf
        <hr />

        <div class="form-outline">
            <label class="form-label" for="form8Example1">Nº Expedient</label>
            @if (!empty($numExpedient))
                <input type="number" id="form8Example1" min="001" class="form-control" placeholder="Ex:130" name="id"
                    value="{{ $numExpedient }}" />
            @else
                <input type="number" id="form8Example1" min="001" class="form-control" placeholder="Ex:130" name="id"
                    value="" />
            @endif

        </div>

        <hr />

        <div class="row">
            <div class="col">
                <!-- Name input -->
                <div class="form-outline">
                    <label class="form-label" for="form8Example3">Data Creació</label>
                    @if (!empty($fechaCreacio))
                        <input type="date" id="form8Example3" class="form-control" name="creacio"
                            value="{{ $fechaCreacio }}" />
                    @else
                        <input type="date" id="form8Example3" class="form-control" name="creacio" value="" />
                    @endif


                </div>
            </div>
            <div class="col">
                <!-- Name input -->
                <div class="form-outline">
                    <label class="form-label" for="form8Example3">Data Modificació</label>
                    @if (!empty($fechaMod))
                        <input type="date" id="form8Example3" class="form-control" name="modicacio"
                            value="{{ $fechaMod }}" />
                    @else
                        <input type="date" id="form8Example3" class="form-control" name="modicacio" value="" />
                    @endif


                </div>
            </div>


        </div>
        <hr />

        <div class="row">
            <div class="col">
                <!-- Name input -->
                <div class="form-outline">
                    <label class="form-label" for="form8Example3">Estat</label>
                    <select class="form-select" aria-label="Default select example" name="estat">
                        @if (!empty($estat))
                            <option value="todos"> Todos</option>
                            @foreach ($estats as $estatus)
                                @if ($estat == $estatus->estat)
                                    <option value="{{ $estatus->estat }}" selected>{{ $estatus->estat }}</option>
                                @else
                                    <option value="{{ $estatus->estat }}">{{ $estatus->estat }}</option>
                                @endif
                            @endforeach
                        @else
                            <option value="todos" selected>Todos</option>
                            @foreach ($estats as $estatus)
                                <option value="{{ $estatus->estat }}">{{ $estatus->estat }}</option>
                            @endforeach
                        @endif


                    </select>

                </div>
            </div>

        </div>

        <hr />
        <div class="col-1">
            <button type="submit" class="btn  "><i class="fa-solid fa-magnifying-glass" aria-hidden="true"></i>
                Buscar</button>
        </div>
    </form>
    @if (count($expedients) > 0)
        <div class="card mt-2">
            <div class="card-body">
                <h5 class="card-title">
                </h5>
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th scope="col">NºExpedient</th>
                            <th scope="col">Data Creació</th>
                            <th scope="col">Data Última Modificació</th>
                            <th scope="col"> Estat </th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($expedients as $expedient)
                            <tr>
                                <td>{{ $expedient->uid }}</td>
                                <td>{{ date('d-m-Y', strtotime($expedient->data_creacio)) }}</td>
                                <td>{{ date('d-m-Y', strtotime($expedient->data_ultima_modificacio)) }}</td>
                                <td>{{ $expedient->estat }}</td>
                                <td>
                                    <form
                                        action="{{ action([App\Http\Controllers\ExpedientController::class, 'show'], ['expedients_controller' => $expedient->uid]) }}"
                                        method="GET">

                                        @csrf

                                        <button type="submit" class="btn"><i
                                                class="fa-solid fa-note-sticky"></i>
                                            Cartes Trucadaes</button>
                                    </form>
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
                {{ $expedients->links() }}
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
