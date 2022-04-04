<?php

namespace App\Http\Controllers;

use App\Models\Expedient;
use App\Models\Localitzacio;
use App\Models\Accident;
use App\Models\Carta;
use App\Models\EstatExpedient;
use Illuminate\Http\Request;

class ExpedientController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $numExpedient = $request->input('id');
        $fechaCreacio = $request->input('creacio');
        $estat = $request->input('estat');
        $fechaMod = $request->input('modicacio');
        //SQL
        $estats = EstatExpedient::all();
        if (empty($numExpedient) && empty($fechaCreacio) && empty($fechaMod)) {
            $expedients = Expedient::join('estats_expedients', 'estats_expedients_id', '=', 'estats_expedients.id')
                ->select('expedients.id AS uid', 'estats_expedients.estat', 'expedients.data_creacio', 'expedients.data_ultima_modificacio')
                ->orderBy('expedients.id')
                ->paginate(7)
                ->withQueryString();
        } else if (!empty($numExpedient)) {
            $expedients = Expedient::join('estats_expedients', 'estats_expedients_id', '=', 'estats_expedients.id')
                ->select('expedients.id AS uid', 'estats_expedients.estat', 'expedients.data_creacio', 'expedients.data_ultima_modificacio')
                ->where('expedients.id', '=', $numExpedient)
                ->orderBy('expedients.id')
                ->paginate(7)
                ->withQueryString();
        } else if (empty($numExpedient) && !empty($fechaCreacio) && $estat == 'todos') {
            $expedients = Expedient::join('estats_expedients', 'estats_expedients_id', '=', 'estats_expedients.id')
                ->select('expedients.id AS uid', 'estats_expedients.estat', 'expedients.data_creacio', 'expedients.data_ultima_modificacio')
                ->where('expedients.data_creacio', 'like', '%' . $fechaCreacio . '%')
                ->orderBy('expedients.id')
                ->paginate(7)
                ->withQueryString();
        } else if (empty($numExpedient) && !empty($fechaCreacio) && $estat != 'todos') {
            $expedients = Expedient::join('estats_expedients', 'estats_expedients_id', '=', 'estats_expedients.id')
                ->select('expedients.id AS uid', 'estats_expedients.estat', 'expedients.data_creacio', 'expedients.data_ultima_modificacio')
                ->where('expedients.data_creacio', 'like', '%' . $fechaCreacio . '%')
                ->where('estats_expedients.estat', '=', $estat)
                ->orderBy('expedients.id')
                ->paginate(7)
                ->withQueryString();
        } else if (empty($numExpedient) && !empty($fechaCreacio) && $estat == 'todos') {
            $expedients = Expedient::join('estats_expedients', 'estats_expedients_id', '=', 'estats_expedients.id')
                ->select('expedients.id AS uid', 'estats_expedients.estat', 'expedients.data_creacio', 'expedients.data_ultima_modificacio')
                ->where('expedients.data_creacio', 'like', '%' . $fechaCreacio . '%')
                ->where('expedients.data_ultima_modificacio', 'like', '%' . $fechaMod . '%')
                ->orderBy('expedients.id')
                ->paginate(7)
                ->withQueryString();
        } else if (empty($numExpedient) && empty($fechaCreacio) && !empty($fechaMod) && $estat != 'todos') {
            $expedients = Expedient::join('estats_expedients', 'estats_expedients_id', '=', 'estats_expedients.id')
                ->select('expedients.id AS uid', 'estats_expedients.estat', 'expedients.data_creacio', 'expedients.data_ultima_modificacio')
                ->where('expedients.data_ultima_modificacio', 'like', '%' . $fechaMod . '%')
                ->where('estats_expedients.estat', '=', $estat)
                ->orderBy('expedients.id')
                ->paginate(7)
                ->withQueryString();
        } else if (empty($numExpedient) && empty($fechaCreacio) && empty($fechaMod) && $estat != 'todos') {
            $expedients = Expedient::join('estats_expedients', 'estats_expedients_id', '=', 'estats_expedients.id')
                ->select('expedients.id AS uid', 'estats_expedients.estat', 'expedients.data_creacio', 'expedients.data_ultima_modificacio')
                ->where('estats_expedients.estat', '=', $estat)
                ->orderBy('expedients.id')
                ->paginate(7)
                ->withQueryString();
        }

        return view('expedient.expedient', compact('expedients', 'estats', 'numExpedient', 'fechaMod', 'fechaCreacio', 'estat'));
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
     * @param  \App\Models\Expedient  $expedient
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request, Expedient $expedient)
    {
        //
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

        if (empty($fecha) && empty($id) && empty($tel)) {
            $cartes = Carta::join('tipus_localitzacions', 'cartes_trucades.tipus_localitzacions_id', '=', 'tipus_localitzacions.id')
                ->join('incidents', 'cartes_trucades.incidents_id', '=', 'incidents.id')
                ->join('tipus_incidents', 'incidents.classes_incidents_id', '=', 'tipus_incidents.id')
                ->select('tipus_localitzacions.tipus', 'codi_trucada', 'data_hora', 'tipus_incidents.descripcio', 'telefon', 'expedients_id')
                ->where('cartes_trucades.expedients_id', '=', $expedient->id)->orderBy('codi_trucada')
                ->paginate(5)
                ->withQueryString();
        } else if (!empty($id)) {
            $cartes = Carta::join('tipus_localitzacions', 'cartes_trucades.tipus_localitzacions_id', '=', 'tipus_localitzacions.id')
                ->join('incidents', 'cartes_trucades.incidents_id', '=', 'incidents.id')
                ->join('tipus_incidents', 'incidents.classes_incidents_id', '=', 'tipus_incidents.id')
                ->select('tipus_localitzacions.tipus', 'codi_trucada', 'data_hora', 'tipus_incidents.descripcio', 'telefon', 'expedients_id')
                ->where('cartes_trucades.expedients_id', '=', $expedient->id)
                ->where('cartes_trucades.codi_trucada', '=', $id)->orderBy('codi_trucada')
                ->paginate(5)
                ->withQueryString();
        } else  if (!empty($fecha)) {
            $cartes = Carta::join('tipus_localitzacions', 'cartes_trucades.tipus_localitzacions_id', '=', 'tipus_localitzacions.id',)
                ->join('incidents', 'cartes_trucades.incidents_id', '=', 'incidents.id')
                ->join('tipus_incidents', 'incidents.classes_incidents_id', '=', 'tipus_incidents.id')
                ->select('tipus_localitzacions.tipus', 'codi_trucada', 'data_hora', 'tipus_incidents.descripcio', 'telefon', 'expedients_id')
                ->where('cartes_trucades.expedients_id', '=', $expedient->id)
                ->where('cartes_trucades.data_hora', 'like', '%' . $fecha . '%')->orderBy('codi_trucada')
                ->paginate(5)
                ->withQueryString();
        } else if (!empty($fecha) && !empty($tel)) {
            $cartes = Carta::join('tipus_localitzacions', 'cartes_trucades.tipus_localitzacions_id', '=', 'tipus_localitzacions.id')
                ->join('incidents', 'cartes_trucades.incidents_id', '=', 'incidents.id')
                ->join('tipus_incidents', 'incidents.classes_incidents_id', '=', 'tipus_incidents.id')
                ->select('tipus_localitzacions.tipus', 'codi_trucada', 'data_hora', 'tipus_incidents.descripcio', 'telefon', 'expedients_id')
                ->where('cartes_trucades.data_hora', 'like', '%' . $fecha . '%')
                ->where('cartes_trucades.expedients_id', '=', $expedient->id)
                ->where('cartes_trucades.telefon', '=', $tel)->orderBy('codi_trucada')
                ->paginate(5)
                ->withQueryString();
        } else if (empty($fecha) && !empty($tel)) {
            $cartes = Carta::join('tipus_localitzacions', 'cartes_trucades.tipus_localitzacions_id', '=', 'tipus_localitzacions.id')
                ->join('incidents', 'cartes_trucades.incidents_id', '=', 'incidents.id')
                ->join('tipus_incidents', 'incidents.classes_incidents_id', '=', 'tipus_incidents.id')
                ->select('tipus_localitzacions.tipus', 'codi_trucada', 'data_hora', 'tipus_incidents.descripcio', 'telefon', 'expedients_id')
                ->where('cartes_trucades.expedients_id', '=', $expedient->id)
                ->where('cartes_trucades.telefon', '=', $tel)->orderBy('codi_trucada')
                ->paginate(5)
                ->withQueryString();
        } else if (!empty($fecha) && !empty($tel) && $tipusEmgs == 'todos') {
            $cartes = Carta::join('tipus_localitzacions', 'cartes_trucades.tipus_localitzacions_id', '=', 'tipus_localitzacions.id')
                ->join('incidents', 'cartes_trucades.incidents_id', '=', 'incidents.id')
                ->join('tipus_incidents', 'incidents.classes_incidents_id', '=', 'tipus_incidents.id')
                ->select('tipus_localitzacions.tipus', 'codi_trucada', 'data_hora', 'tipus_incidents.descripcio', 'telefon', 'expedients_id')
                ->where('cartes_trucades.data_hora', 'like', '%' . $fecha . '%')
                ->where('cartes_trucades.expedients_id', '=', $expedient->id)
                ->where('cartes_trucades.telefon', '=', $tel)->orderBy('codi_trucada')
                ->paginate(5)
                ->withQueryString();
        } else if (!empty($fecha) && !empty($tel) && $tipusEmgs != 'todos') {
            $cartes = Carta::join('tipus_localitzacions', 'cartes_trucades.tipus_localitzacions_id', '=', 'tipus_localitzacions.id')
                ->join('incidents', 'cartes_trucades.incidents_id', '=', 'incidents.id')
                ->join('tipus_incidents', 'incidents.classes_incidents_id', '=', 'tipus_incidents.id')
                ->select('tipus_localitzacions.tipus', 'codi_trucada', 'data_hora', 'tipus_incidents.descripcio', 'telefon', 'expedients_id')
                ->where('cartes_trucades.data_hora', 'like', '%' . $fecha . '%')
                ->where('cartes_trucades.expedients_id', '=', $expedient->id)
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
                ->where('cartes_trucades.expedients_id', '=', $expedient->id)
                ->where('cartes_trucades.telefon', '=', $tel)->orderBy('codi_trucada')
                ->paginate(5)
                ->withQueryString();
        } else if (!empty($fecha) && !empty($tel) && $tipusLocs != 'todos') {
            $cartes = Carta::join('tipus_localitzacions', 'cartes_trucades.tipus_localitzacions_id', '=', 'tipus_localitzacions.id')
                ->join('incidents', 'cartes_trucades.incidents_id', '=', 'incidents.id')
                ->join('tipus_incidents', 'incidents.classes_incidents_id', '=', 'tipus_incidents.id')
                ->select('tipus_localitzacions.tipus', 'codi_trucada', 'data_hora', 'tipus_incidents.descripcio', 'telefon', 'expedients_id')
                ->where('cartes_trucades.data_hora', 'like', '%' . $fecha . '%')
                ->where('cartes_trucades.expedients_id', '=', $expedient->id)
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
                ->where('cartes_trucades.expedients_id', '=', $expedient->id)
                ->where('cartes_trucades.telefon', '=', $tel)->orderBy('codi_trucada')
                ->paginate(5)
                ->withQueryString();
        } else if (!empty($fecha) && !empty($tel) && $tipusLocs == 'todos' && $tipusEmgs != 'todos') {
            $cartes = Carta::join('tipus_localitzacions', 'cartes_trucades.tipus_localitzacions_id', '=', 'tipus_localitzacions.id')
                ->join('incidents', 'cartes_trucades.incidents_id', '=', 'incidents.id')
                ->join('tipus_incidents', 'incidents.classes_incidents_id', '=', 'tipus_incidents.id')
                ->select('tipus_localitzacions.tipus', 'codi_trucada', 'data_hora', 'tipus_incidents.descripcio', 'telefon', 'expedients_id')
                ->where('cartes_trucades.data_hora', 'like', '%' . $fecha . '%')
                ->where('cartes_trucades.expedients_id', '=', $expedient->id)
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
                ->where('cartes_trucades.expedients_id', '=', $expedient->id)
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
                ->where('cartes_trucades.expedients_id', '=', $expedient->id)
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
                ->where('cartes_trucades.expedients_id', '=', $expedient->id)
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
                ->where('cartes_trucades.expedients_id', '=', $expedient->id)
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
                ->where('cartes_trucades.expedients_id', '=', $expedient->id)
                ->orderBy('codi_trucada')
                ->paginate(5)
                ->withQueryString();
        } else if (!empty($fecha)  && $tipusEmgs == 'todos') {
            $cartes = Carta::join('tipus_localitzacions', 'cartes_trucades.tipus_localitzacions_id', '=', 'tipus_localitzacions.id')
                ->join('incidents', 'cartes_trucades.incidents_id', '=', 'incidents.id')
                ->join('tipus_incidents', 'incidents.classes_incidents_id', '=', 'tipus_incidents.id')
                ->select('tipus_localitzacions.tipus', 'codi_trucada', 'data_hora', 'tipus_incidents.descripcio', 'telefon', 'expedients_id')
                ->where('cartes_trucades.expedients_id', '=', $expedient->id)
                ->orderBy('codi_trucada')
                ->paginate(5)
                ->withQueryString();
        } else if (!empty($fecha)  && $tipusEmgs != 'todos') {
            $cartes = Carta::join('tipus_localitzacions', 'cartes_trucades.tipus_localitzacions_id', '=', 'tipus_localitzacions.id')
                ->join('incidents', 'cartes_trucades.incidents_id', '=', 'incidents.id')
                ->join('tipus_incidents', 'incidents.classes_incidents_id', '=', 'tipus_incidents.id')
                ->select('tipus_localitzacions.tipus', 'codi_trucada', 'data_hora', 'tipus_incidents.descripcio', 'telefon', 'expedients_id')
                ->where('cartes_trucades.expedients_id', '=', $expedient->id)
                ->where('tipus_incidents.descripcio', '=', $tipusEmgs)
                ->orderBy('codi_trucada')
                ->paginate(5);
        }

        return view('cartes.carta', compact('tipusLoc', 'tipusEmg', 'cartes', 'id', 'fecha', 'tipusEmgs', 'tipusLocs', 'tel', 'expedient'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Expedient  $expedient
     * @return \Illuminate\Http\Response
     */
    public function edit(Expedient $expedient)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Expedient  $expedient
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Expedient $expedient)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Expedient  $expedient
     * @return \Illuminate\Http\Response
     */
    public function destroy(Expedient $expedient)
    {
        //
    }
}