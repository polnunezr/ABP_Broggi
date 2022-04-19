<?php

namespace App\Http\Controllers;

// use App\Models\Accident;
use App\Models\TipusIncident;
// use App\Models\Carta;
use App\Models\CartaTrucada;
use App\Models\Expedient;
use App\Models\Grafica;
use Illuminate\Http\Request;

class GraficaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $accidents = TipusIncident::all();
        foreach ($accidents as $incident) {
            $tipus[] = $incident->descripcio;
            $carta = CartaTrucada::join('tipus_localitzacions', 'cartes_trucades.tipus_localitzacions_id', '=', 'tipus_localitzacions.id')
                ->join('incidents', 'cartes_trucades.incidents_id', '=', 'incidents.id')
                ->join('tipus_incidents', 'incidents.classes_incidents_id', '=', 'tipus_incidents.id')
                ->select('tipus_incidents.descripcio')
                ->where('tipus_incidents.descripcio', '=', $incident->descripcio);

            $countIncidents[] = $carta->count();
        }

        $dates = Expedient::select('data_creacio')->distinct(DATE('data_creacio'))
            ->orderBy('data_creacio')->get();
        foreach ($dates as $data) {
            $datas[] =  date('d-m-Y', strtotime($data->data_creacio));
            $expedients = Expedient::select('data_creacio')->where('data_creacio', '=', $data->data_creacio);
            $count[] = $expedients->count();
        }
        //var_dump($countIncidents);
        return view('grafiques.grafica', compact('datas', 'count', 'tipus', 'countIncidents'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Grafica  $grafica
     * @return \Illuminate\Http\Response
     */
    public function show(Grafica $grafica)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Grafica  $grafica
     * @return \Illuminate\Http\Response
     */
    public function edit(Grafica $grafica)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Grafica  $grafica
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Grafica $grafica)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Grafica  $grafica
     * @return \Illuminate\Http\Response
     */
    public function destroy(Grafica $grafica)
    {
        //
    }
}
