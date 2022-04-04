<?php

namespace App\Http\Controllers;

use App\Models\Accident;
use App\Models\Carta;
use App\Models\Expedient;
use App\Models\Localitzacio;
use Illuminate\Http\Request;
use Session;


class CartaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request, Expedient $idExpedient)
    {
        $tipusLoc = Localitzacio::all();
        $tipusEmg = Accident::all();

        //
        $tipusLoc = Localitzacio::all();
        $tipusEmg = Accident::all();

        $fecha =  $request->input('fecha');
        $tipusLocs =  $request->input('loc');
        $tipusEmgs =  $request->input('emer');
        $tel =  $request->input('telf');
        $id = $request->input('id');
        if (!empty($id)) {
            $cartes = Carta::join('tipus_localitzacions', 'cartes_trucades.tipus_localitzacions_id', '=', 'tipus_localitzacions.id')
                ->join('incidents', 'cartes_trucades.incidents_id', '=', 'incidents.id')
                ->join('tipus_incidents', 'incidents.classes_incidents_id', '=', 'tipus_incidents.id')
                ->select('tipus_localitzacions.tipus', 'codi_trucada', 'data_hora', 'tipus_incidents.descripcio', 'telefon', 'expedients_id')
                ->where('cartes_trucades.expedients_id', '=', $expedient)
                ->where('cartes_trucades.codi_trucada', '=', $id)->orderBy('codi_trucada')
                ->paginate(5)
                ->withQueryString();
        } else  if (!empty($fecha)) {
            $cartes = Carta::join('tipus_localitzacions', 'cartes_trucades.tipus_localitzacions_id', '=', 'tipus_localitzacions.id',)
                ->join('incidents', 'cartes_trucades.incidents_id', '=', 'incidents.id')
                ->join('tipus_incidents', 'incidents.classes_incidents_id', '=', 'tipus_incidents.id')
                ->select('tipus_localitzacions.tipus', 'codi_trucada', 'data_hora', 'tipus_incidents.descripcio', 'telefon', 'expedients_id')
                ->where('cartes_trucades.expedients_id', '=', $expedient)
                ->where('cartes_trucades.data_hora', 'like', '%' . $fecha . '%')->orderBy('codi_trucada')
                ->paginate(5)
                ->withQueryString();
        } else if (!empty($fecha) && !empty($tel)) {
            $cartes = Carta::join('tipus_localitzacions', 'cartes_trucades.tipus_localitzacions_id', '=', 'tipus_localitzacions.id')
                ->join('incidents', 'cartes_trucades.incidents_id', '=', 'incidents.id')
                ->join('tipus_incidents', 'incidents.classes_incidents_id', '=', 'tipus_incidents.id')
                ->select('tipus_localitzacions.tipus', 'codi_trucada', 'data_hora', 'tipus_incidents.descripcio', 'telefon', 'expedients_id')
                ->where('cartes_trucades.data_hora', 'like', '%' . $fecha . '%')
                ->where('cartes_trucades.expedients_id', '=', $expedient)
                ->where('cartes_trucades.telefon', '=', $tel)->orderBy('codi_trucada')
                ->paginate(5)
                ->withQueryString();
        } else if (empty($fecha) && !empty($tel)) {
            $cartes = Carta::join('tipus_localitzacions', 'cartes_trucades.tipus_localitzacions_id', '=', 'tipus_localitzacions.id')
                ->join('incidents', 'cartes_trucades.incidents_id', '=', 'incidents.id')
                ->join('tipus_incidents', 'incidents.classes_incidents_id', '=', 'tipus_incidents.id')
                ->select('tipus_localitzacions.tipus', 'codi_trucada', 'data_hora', 'tipus_incidents.descripcio', 'telefon', 'expedients_id')
                ->where('cartes_trucades.expedients_id', '=', $expedient)
                ->where('cartes_trucades.telefon', '=', $tel)->orderBy('codi_trucada')
                ->paginate(5)
                ->withQueryString();
        } else if (!empty($fecha) && !empty($tel) && $tipusEmgs == 'todos') {
            $cartes = Carta::join('tipus_localitzacions', 'cartes_trucades.tipus_localitzacions_id', '=', 'tipus_localitzacions.id')
                ->join('incidents', 'cartes_trucades.incidents_id', '=', 'incidents.id')
                ->join('tipus_incidents', 'incidents.classes_incidents_id', '=', 'tipus_incidents.id')
                ->select('tipus_localitzacions.tipus', 'codi_trucada', 'data_hora', 'tipus_incidents.descripcio', 'telefon', 'expedients_id')
                ->where('cartes_trucades.data_hora', 'like', '%' . $fecha . '%')
                ->where('cartes_trucades.expedients_id', '=', $expedient)
                ->where('cartes_trucades.telefon', '=', $tel)->orderBy('codi_trucada')
                ->paginate(5)
                ->withQueryString();
        } else if (!empty($fecha) && !empty($tel) && $tipusEmgs != 'todos') {
            $cartes = Carta::join('tipus_localitzacions', 'cartes_trucades.tipus_localitzacions_id', '=', 'tipus_localitzacions.id')
                ->join('incidents', 'cartes_trucades.incidents_id', '=', 'incidents.id')
                ->join('tipus_incidents', 'incidents.classes_incidents_id', '=', 'tipus_incidents.id')
                ->select('tipus_localitzacions.tipus', 'codi_trucada', 'data_hora', 'tipus_incidents.descripcio', 'telefon', 'expedients_id')
                ->where('cartes_trucades.data_hora', 'like', '%' . $fecha . '%')
                ->where('cartes_trucades.expedients_id', '=', $expedient)
                ->where('tipus_accidents.descripcio', '=', $tipusEmgs)
                ->where('cartes_trucades.telefon', '=', $tel)->orderBy('codi_trucada')
                ->paginate(5)
                ->withQueryString();
        } else if (!empty($fecha) && !empty($tel) && $tipusLocs == 'todos') {
            $cartes = Carta::join('tipus_localitzacions', 'cartes_trucades.tipus_localitzacions_id', '=', 'tipus_localitzacions.id')
                ->join('incidents', 'cartes_trucades.incidents_id', '=', 'incidents.id')
                ->join('tipus_incidents', 'incidents.classes_incidents_id', '=', 'tipus_incidents.id')
                ->select('tipus_localitzacions.tipus', 'codi_trucada', 'data_hora', 'tipus_incidents.descripcio', 'telefon', 'expedients_id')
                ->where('cartes_trucades.data_hora', 'like', '%' . $fecha . '%')
                ->where('cartes_trucades.expedients_id', '=', $expedient)
                ->where('cartes_trucades.telefon', '=', $tel)->orderBy('codi_trucada')
                ->paginate(5)
                ->withQueryString();
        } else if (!empty($fecha) && !empty($tel) && $tipusLocs != 'todos') {
            $cartes = Carta::join('tipus_localitzacions', 'cartes_trucades.tipus_localitzacions_id', '=', 'tipus_localitzacions.id')
                ->join('incidents', 'cartes_trucades.incidents_id', '=', 'incidents.id')
                ->join('tipus_incidents', 'incidents.classes_incidents_id', '=', 'tipus_incidents.id')
                ->select('tipus_localitzacions.tipus', 'codi_trucada', 'data_hora', 'tipus_incidents.descripcio', 'telefon', 'expedients_id')
                ->where('cartes_trucades.data_hora', 'like', '%' . $fecha . '%')
                ->where('cartes_trucades.expedients_id', '=', $expedient)
                ->where('tipus_localitzacions.tipus', '=', $tipusLocs)
                ->where('cartes_trucades.telefon', '=', $tel)->orderBy('codi_trucada')
                ->paginate(5)
                ->withQueryString();
        } else if (!empty($fecha) && !empty($tel) && $tipusLocs != 'todos' && $tipusEmgs == 'todos') {
            $cartes = Carta::join('tipus_localitzacions', 'cartes_trucades.tipus_localitzacions_id', '=', 'tipus_localitzacions.id')
                ->join('incidents', 'cartes_trucades.incidents_id', '=', 'incidents.id')
                ->join('tipus_incidents', 'incidents.classes_incidents_id', '=', 'tipus_incidents.id')
                ->select('tipus_localitzacions.tipus', 'codi_trucada', 'data_hora', 'tipus_incidents.descripcio', 'telefon', 'expedients_id')
                ->where('cartes_trucades.data_hora', 'like', '%' . $fecha . '%')
                ->where('tipus_localitzacions.tipus', '=', $tipusLocs)
                ->where('cartes_trucades.expedients_id', '=', $expedient)
                ->where('cartes_trucades.telefon', '=', $tel)->orderBy('codi_trucada')
                ->paginate(5)
                ->withQueryString();
        } else if (!empty($fecha) && !empty($tel) && $tipusLocs == 'todos' && $tipusEmgs != 'todos') {
            $cartes = Carta::join('tipus_localitzacions', 'cartes_trucades.tipus_localitzacions_id', '=', 'tipus_localitzacions.id')
                ->join('incidents', 'cartes_trucades.incidents_id', '=', 'incidents.id')
                ->join('tipus_incidents', 'incidents.classes_incidents_id', '=', 'tipus_incidents.id')
                ->select('tipus_localitzacions.tipus', 'codi_trucada', 'data_hora', 'tipus_incidents.descripcio', 'telefon', 'expedients_id')
                ->where('cartes_trucades.data_hora', 'like', '%' . $fecha . '%')
                ->where('cartes_trucades.expedients_id', '=', $expedient)
                ->where('tipus_accidents.descripcio', '=', $tipusEmgs)
                ->where('cartes_trucades.telefon', '=', $tel)->orderBy('codi_trucada')
                ->paginate(5)
                ->withQueryString();
        } else if (!empty($fecha) && !empty($tel) && $tipusLocs != 'todos' && $tipusEmgs != 'todos') {
            $cartes = Carta::join('tipus_localitzacions', 'cartes_trucades.tipus_localitzacions_id', '=', 'tipus_localitzacions.id')
                ->join('incidents', 'cartes_trucades.incidents_id', '=', 'incidents.id')
                ->join('tipus_incidents', 'incidents.classes_incidents_id', '=', 'tipus_incidents.id')
                ->select('tipus_localitzacions.tipus', 'codi_trucada', 'data_hora', 'tipus_incidents.descripcio', 'telefon', 'expedients_id')
                ->where('cartes_trucades.data_hora', 'like', '%' . $fecha . '%')
                ->where('cartes_trucades.expedients_id', '=', $expedient)
                ->where('tipus_localitzacions.tipus', '=', $tipusLocs)
                ->where('tipus_accidents.descripcio', '=', $tipusEmgs)
                ->where('cartes_trucades.telefon', '=', $tel)->orderBy('codi_trucada')
                ->paginate(5)
                ->withQueryString();
        } else if (!empty($fecha)  && $tipusLocs == 'todos' && $tipusEmgs != 'todos') {
            $cartes = Carta::join('tipus_localitzacions', 'cartes_trucades.tipus_localitzacions_id', '=', 'tipus_localitzacions.id')
                ->join('incidents', 'cartes_trucades.incidents_id', '=', 'incidents.id')
                ->join('tipus_incidents', 'incidents.classes_incidents_id', '=', 'tipus_incidents.id')
                ->select('tipus_localitzacions.tipus', 'codi_trucada', 'data_hora', 'tipus_incidents.descripcio', 'telefon', 'expedients_id')
                ->where('cartes_trucades.data_hora', 'like', '%' . $fecha . '%')
                ->where('cartes_trucades.expedients_id', '=', $expedient)
                ->where('tipus_accidents.descripcio', '=', $tipusEmgs)
                ->orderBy('codi_trucada')
                ->paginate(5)
                ->withQueryString();
        } else if (!empty($fecha)  && $tipusLocs != 'todos' && $tipusEmgs == 'todos') {
            $cartes = Carta::join('tipus_localitzacions', 'cartes_trucades.tipus_localitzacions_id', '=', 'tipus_localitzacions.id')
                ->join('incidents', 'cartes_trucades.incidents_id', '=', 'incidents.id')
                ->join('tipus_incidents', 'incidents.classes_incidents_id', '=', 'tipus_incidents.id')
                ->select('tipus_localitzacions.tipus', 'codi_trucada', 'data_hora', 'tipus_incidents.descripcio', 'telefon', 'expedients_id')
                ->where('cartes_trucades.data_hora', 'like', '%' . $fecha . '%')
                ->where('cartes_trucades.expedients_id', '=', $expedient)
                ->where('tipus_localitzacions.tipus', '=', $tipusLocs)
                ->orderBy('codi_trucada')
                ->paginate(5)
                ->withQueryString();
        } else if (!empty($fecha)  && $tipusLocs != 'todos' && $tipusEmgs != 'todos') {
            $cartes = Carta::join('tipus_localitzacions', 'cartes_trucades.tipus_localitzacions_id', '=', 'tipus_localitzacions.id')
                ->join('incidents', 'cartes_trucades.incidents_id', '=', 'incidents.id')
                ->join('tipus_incidents', 'incidents.classes_incidents_id', '=', 'tipus_incidents.id')
                ->select('tipus_localitzacions.tipus', 'codi_trucada', 'data_hora', 'tipus_incidents.descripcio', 'telefon', 'expedients_id')
                ->where('cartes_trucades.data_hora', 'like', '%' . $fecha . '%')
                ->where('cartes_trucades.expedients_id', '=', $expedient)
                ->where('tipus_localitzacions.tipus', '=', $tipusLocs)
                ->where('tipus_accidents.descripcio', '=', $tipusEmgs)
                ->orderBy('codi_trucada')
                ->paginate(5)
                ->withQueryString();
        } else if (!empty($fecha)  && $tipusLocs == 'todos') {
            $cartes = Carta::join('tipus_localitzacions', 'cartes_trucades.tipus_localitzacions_id', '=', 'tipus_localitzacions.id')
                ->join('incidents', 'cartes_trucades.incidents_id', '=', 'incidents.id')
                ->join('tipus_incidents', 'incidents.classes_incidents_id', '=', 'tipus_incidents.id')
                ->select('tipus_localitzacions.tipus', 'codi_trucada', 'data_hora', 'tipus_incidents.descripcio', 'telefon', 'expedients_id')
                ->where('cartes_trucades.data_hora', 'like', '%' . $fecha . '%')
                ->where('cartes_trucades.expedients_id', '=', $expedient)
                ->orderBy('codi_trucada')
                ->paginate(5)
                ->withQueryString();
        } else if (!empty($fecha)  && $tipusLocs != 'todos') {
            $cartes = Carta::join('tipus_localitzacions', 'cartes_trucades.tipus_localitzacions_id', '=', 'tipus_localitzacions.id')
                ->join('incidents', 'cartes_trucades.incidents_id', '=', 'incidents.id')
                ->join('tipus_incidents', 'incidents.classes_incidents_id', '=', 'tipus_incidents.id')
                ->select('tipus_localitzacions.tipus', 'codi_trucada', 'data_hora', 'tipus_incidents.descripcio', 'telefon', 'expedients_id')
                ->where('cartes_trucades.data_hora', 'like', '%' . $fecha . '%')
                ->where('cartes_trucades.expedients_id', '=', $expedient)
                ->where('tipus_localitzacions.tipus', '=', $tipusLocs)
                ->orderBy('codi_trucada')
                ->paginate(5)
                ->withQueryString();
        } else if ($tipusEmgs != 'todos') {
            $cartes = Carta::join('tipus_localitzacions', 'cartes_trucades.tipus_localitzacions_id', '=', 'tipus_localitzacions.id')
                ->join('incidents', 'cartes_trucades.incidents_id', '=', 'incidents.id')
                ->join('tipus_incidents', 'incidents.classes_incidents_id', '=', 'tipus_incidents.id')
                ->select('tipus_localitzacions.tipus', 'codi_trucada', 'data_hora', 'tipus_incidents.descripcio', 'telefon', 'expedients_id')
                ->where('cartes_trucades.expedients_id', '=', $expedient)
                ->where('tipus_incidents.descripcio', '=', $tipusEmgs)
                ->orderBy('codi_trucada')
                ->paginate(5)
                ->withQueryString();
        } else if ($tipusEmgs == 'todos') {
            $cartes = Carta::join('tipus_localitzacions', 'cartes_trucades.tipus_localitzacions_id', '=', 'tipus_localitzacions.id')
                ->join('incidents', 'cartes_trucades.incidents_id', '=', 'incidents.id')
                ->join('tipus_incidents', 'incidents.classes_incidents_id', '=', 'tipus_incidents.id')
                ->select('tipus_localitzacions.tipus', 'codi_trucada', 'data_hora', 'tipus_incidents.descripcio', 'telefon', 'expedients_id')
                ->where('cartes_trucades.expedients_id', '=', $expedient)
                ->orderBy('codi_trucada')
                ->paginate(5)
                ->withQueryString();
        } else if (!empty($fecha)  && $tipusEmgs == 'todos') {
            $cartes = Carta::join('tipus_localitzacions', 'cartes_trucades.tipus_localitzacions_id', '=', 'tipus_localitzacions.id')
                ->join('incidents', 'cartes_trucades.incidents_id', '=', 'incidents.id')
                ->join('tipus_incidents', 'incidents.classes_incidents_id', '=', 'tipus_incidents.id')
                ->select('tipus_localitzacions.tipus', 'codi_trucada', 'data_hora', 'tipus_incidents.descripcio', 'telefon', 'expedients_id')
                ->where('cartes_trucades.expedients_id', '=', $expedient)
                ->orderBy('codi_trucada')
                ->paginate(5)
                ->withQueryString();
        } else if (!empty($fecha)  && $tipusEmgs != 'todos') {
            $cartes = Carta::join('tipus_localitzacions', 'cartes_trucades.tipus_localitzacions_id', '=', 'tipus_localitzacions.id')
                ->join('incidents', 'cartes_trucades.incidents_id', '=', 'incidents.id')
                ->join('tipus_incidents', 'incidents.classes_incidents_id', '=', 'tipus_incidents.id')
                ->select('tipus_localitzacions.tipus', 'codi_trucada', 'data_hora', 'tipus_incidents.descripcio', 'telefon', 'expedients_id')
                ->where('cartes_trucades.expedients_id', '=', $expedient)
                ->where('tipus_incidents.descripcio', '=', $tipusEmgs)
                ->orderBy('codi_trucada')
                ->paginate(5)
                ->withQueryString();
        } else if (empty($fecha) && empty($id) && empty($tel)) {
            $cartes = Carta::join('tipus_localitzacions', 'cartes_trucades.tipus_localitzacions_id', '=', 'tipus_localitzacions.id')
                ->join('incidents', 'cartes_trucades.incidents_id', '=', 'incidents.id')
                ->join('tipus_incidents', 'incidents.classes_incidents_id', '=', 'tipus_incidents.id')
                ->select('tipus_localitzacions.tipus', 'codi_trucada', 'data_hora', 'tipus_incidents.descripcio', 'telefon', 'expedients_id')
                ->where('cartes_trucades.expedients_id', '=', $expedient)->orderBy('codi_trucada')
                ->paginate(5)
                ->withQueryString();
        }


        return view('cartes.carta', compact('tipusLoc', 'tipusEmg', 'cartes', 'id', 'fecha', 'tipusEmgs', 'tipusLocs', 'tel'));
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
     * @param  \App\Models\Carta  $carta
     * @return \Illuminate\Http\Response
     */
    public function show()
    {

        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Carta  $carta
     * @return \Illuminate\Http\Response
     */
    public function edit(Carta $carta)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Carta  $carta
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Carta $carta)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Carta  $carta
     * @return \Illuminate\Http\Response
     */
    public function destroy(Carta $carta)
    {
        //
    }
}