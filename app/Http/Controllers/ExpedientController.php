<?php

namespace App\Http\Controllers;

use App\Models\Expedient;
use App\Models\TipusLocalitzacio;
use App\Models\TipusIncident;
use App\Models\CartaTrucada;
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
        $h = 'hola';
        $estats = EstatExpedient::all();
         if (!empty($numExpedient)) {
            $expedients = Expedient::join('estats_expedients', 'estats_expedients_id', '=', 'estats_expedients.id')
                ->select('expedients.id AS uid', 'estats_expedients.estat', 'expedients.data_creacio', 'expedients.data_ultima_modificacio')
                ->where('expedients.id', '=', $numExpedient)
                ->orderBy('expedients.id')
                ->paginate(7)
                ->withQueryString();
        } else if (empty($numExpedient) && !empty($fechaCreacio) && empty($fechaMod) &&  $estat == 'todos') {
            $expedients = Expedient::join('estats_expedients', 'estats_expedients_id', '=', 'estats_expedients.id')
                ->select('expedients.id AS uid', 'estats_expedients.estat', 'expedients.data_creacio', 'expedients.data_ultima_modificacio')
                ->where('expedients.data_creacio', 'like', '%' . $fechaCreacio . '%')
                ->orderBy('expedients.id')
                ->paginate(7)
                ->withQueryString();
        } else if (empty($numExpedient) && !empty($fechaCreacio) && empty($fechaMod) &&  $estat != 'todos') {
            $expedients = Expedient::join('estats_expedients', 'estats_expedients_id', '=', 'estats_expedients.id')
                ->select('expedients.id AS uid', 'estats_expedients.estat', 'expedients.data_creacio', 'expedients.data_ultima_modificacio')
                ->where('expedients.data_creacio', 'like', '%' . $fechaCreacio . '%')
                ->where('estats_expedients.estat', '=', $estat)
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
        }  else if (empty($numExpedient) && !empty($fechaCreacio) && !empty($fechaMod) && $estat != 'todos') {
            $expedients = Expedient::join('estats_expedients', 'estats_expedients_id', '=', 'estats_expedients.id')
                ->select('expedients.id AS uid', 'estats_expedients.estat', 'expedients.data_creacio', 'expedients.data_ultima_modificacio')
                ->where('expedients.data_creacio', 'like', '%' . $fechaCreacio . '%')
                ->where('expedients.data_ultima_modificacio', 'like', '%' . $fechaMod . '%')
                ->where('estats_expedients.estat', '=', $estat)
                ->orderBy('expedients.id')
                ->paginate(7)
                ->withQueryString();
        }
        else if (empty($numExpedient) && !empty($fechaCreacio) && !empty($fechaMod) && $estat == 'todos') {
            $expedients = Expedient::join('estats_expedients', 'estats_expedients_id', '=', 'estats_expedients.id')
                ->select('expedients.id AS uid', 'estats_expedients.estat', 'expedients.data_creacio', 'expedients.data_ultima_modificacio')
                ->where('expedients.data_creacio', 'like', '%' . $fechaCreacio . '%')
                ->where('expedients.data_ultima_modificacio', 'like', '%' . $fechaMod . '%')
                ->orderBy('expedients.id')
                ->paginate(7)
                ->withQueryString();
        }  else if ( $estat != 'todos' && $estat != null) {
            $expedients = Expedient::join('estats_expedients', 'estats_expedients_id', '=', 'estats_expedients.id')
                ->select('expedients.id AS uid', 'estats_expedients.estat', 'expedients.data_creacio', 'expedients.data_ultima_modificacio')
                ->where('estats_expedients.estat', '=', $estat)
                ->orderBy('expedients.id')
                ->paginate(7)
                ->withQueryString();
        } else  {
            $expedients = Expedient::join('estats_expedients', 'estats_expedients_id', '=', 'estats_expedients.id')
                ->select('expedients.id AS uid', 'estats_expedients.estat', 'expedients.data_creacio', 'expedients.data_ultima_modificacio')
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
    public function show(Request $request, Expedient $expedients_controller)
    {
        //
        $tipusLoc = TipusLocalitzacio::all();
        $tipusEmg = TipusIncident::all();

        //
        $tipusLoc = TipusLocalitzacio::all();
        $tipusEmg = TipusIncident::all();

        $fecha =  $request->input('fecha');
        $tipusLocs =  $request->input('loc');
        $tipusEmgs =  $request->input('emer');
        $tel =  $request->input('telf');
        $id = $request->input('id');
        $h = 'a';
        if (empty($fecha) && empty($id) && empty($tel) && $tipusEmgs == 'todos' && $tipusLocs == 'todos' && $id == null) {
            //funciona
            $cartes = CartaTrucada::join('tipus_localitzacions', 'cartes_trucades.tipus_localitzacions_id', '=', 'tipus_localitzacions.id')
                ->join('incidents', 'cartes_trucades.incidents_id', '=', 'incidents.id')
                ->join('tipus_incidents', 'incidents.classes_incidents_id', '=', 'tipus_incidents.id')
                ->select('tipus_localitzacions.tipus', 'codi_trucada', 'data_hora', 'tipus_incidents.descripcio', 'telefon', 'expedients_id')
                ->where('cartes_trucades.expedients_id', '=', $expedients_controller->id)->orderBy('codi_trucada')
                ->paginate(5)
                ->withQueryString();

        } else if (!empty($id)) {
            //Funciona
            $cartes = CartaTrucada::join('tipus_localitzacions', 'cartes_trucades.tipus_localitzacions_id', '=', 'tipus_localitzacions.id')
                ->join('incidents', 'cartes_trucades.incidents_id', '=', 'incidents.id')
                ->join('tipus_incidents', 'incidents.classes_incidents_id', '=', 'tipus_incidents.id')
                ->select('tipus_localitzacions.tipus', 'codi_trucada', 'data_hora', 'tipus_incidents.descripcio', 'telefon', 'expedients_id')
                ->where('cartes_trucades.expedients_id', '=', $expedients_controller->id)
                ->where('cartes_trucades.codi_trucada', '=', $id)->orderBy('codi_trucada')
                ->paginate(5)
                ->withQueryString();

        } else  if (!empty($fecha) && empty($tel) && empty($id) && $tipusEmgs == 'todos' && $tipusLocs == 'todos') {
            //funciona
            $cartes = CartaTrucada::join('tipus_localitzacions', 'cartes_trucades.tipus_localitzacions_id', '=', 'tipus_localitzacions.id',)
                ->join('incidents', 'cartes_trucades.incidents_id', '=', 'incidents.id')
                ->join('tipus_incidents', 'incidents.classes_incidents_id', '=', 'tipus_incidents.id')
                ->select('tipus_localitzacions.tipus', 'codi_trucada', 'data_hora', 'tipus_incidents.descripcio', 'telefon', 'expedients_id')
                ->where('cartes_trucades.expedients_id', '=', $expedients_controller->id)
                ->where('cartes_trucades.data_hora', 'like', '%' . $fecha . '%')->orderBy('codi_trucada')
                ->paginate(5)
                ->withQueryString();

        } else if (!empty($fecha) && !empty($tel) && $tipusEmgs == 'todo' && $tipusLocs == 'todo') {
            //funciona
            $cartes = CartaTrucada::join('tipus_localitzacions', 'cartes_trucades.tipus_localitzacions_id', '=', 'tipus_localitzacions.id')
                ->join('incidents', 'cartes_trucades.incidents_id', '=', 'incidents.id')
                ->join('tipus_incidents', 'incidents.classes_incidents_id', '=', 'tipus_incidents.id')
                ->select('tipus_localitzacions.tipus', 'codi_trucada', 'data_hora', 'tipus_incidents.descripcio', 'telefon', 'expedients_id')
                ->where('cartes_trucades.data_hora', 'like', '%' . $fecha . '%')
                ->where('cartes_trucades.expedients_id', '=', $expedients_controller->id)
                ->where('cartes_trucades.telefon', '=', $tel)->orderBy('codi_trucada')
                ->paginate(5)
                ->withQueryString();

        } else if (empty($fecha) && !empty($tel) && $tipusLocs == 'todos' && $tipusEmgs == 'todos') {
            //Funciona
            $cartes = CartaTrucada::join('tipus_localitzacions', 'cartes_trucades.tipus_localitzacions_id', '=', 'tipus_localitzacions.id')
                ->join('incidents', 'cartes_trucades.incidents_id', '=', 'incidents.id')
                ->join('tipus_incidents', 'incidents.classes_incidents_id', '=', 'tipus_incidents.id')
                ->select('tipus_localitzacions.tipus', 'codi_trucada', 'data_hora', 'tipus_incidents.descripcio', 'telefon', 'expedients_id')
                ->where('cartes_trucades.expedients_id', '=', $expedients_controller->id)
                ->where('cartes_trucades.telefon', '=', $tel)->orderBy('codi_trucada')
                ->paginate(5)
                ->withQueryString();

        } else if (!empty($fecha) && !empty($tel) && $tipusLocs == 'todos' && $tipusEmgs != 'todos') {
            $cartes = CartaTrucada::join('tipus_localitzacions', 'cartes_trucades.tipus_localitzacions_id', '=', 'tipus_localitzacions.id')
                ->join('incidents', 'cartes_trucades.incidents_id', '=', 'incidents.id')
                ->join('tipus_incidents', 'incidents.classes_incidents_id', '=', 'tipus_incidents.id')
                ->select('tipus_localitzacions.tipus', 'codi_trucada', 'data_hora', 'tipus_incidents.descripcio', 'telefon', 'expedients_id')
                ->where('cartes_trucades.data_hora', 'like', '%' . $fecha . '%')
                ->where('cartes_trucades.expedients_id', '=', $expedients_controller->id)
                ->where('tipus_incidents.descripcio', '=', $tipusEmgs)
                ->where('cartes_trucades.telefon', '=', $tel)->orderBy('codi_trucada')
                ->paginate(5)
                ->withQueryString();

        } else if (!empty($fecha) && !empty($tel) && $tipusLocs != 'todos' && $tipusEmgs == 'todos') {
            //Funciona
            $cartes = CartaTrucada::join('tipus_localitzacions', 'cartes_trucades.tipus_localitzacions_id', '=', 'tipus_localitzacions.id')
                ->join('incidents', 'cartes_trucades.incidents_id', '=', 'incidents.id')
                ->join('tipus_incidents', 'incidents.classes_incidents_id', '=', 'tipus_incidents.id')
                ->select('tipus_localitzacions.tipus', 'codi_trucada', 'data_hora', 'tipus_incidents.descripcio', 'telefon', 'expedients_id')
                ->where('cartes_trucades.data_hora', 'like', '%' . $fecha . '%')
                ->where('cartes_trucades.expedients_id', '=', $expedients_controller->id)
                ->where('tipus_localitzacions.tipus', '=', $tipusLocs)
                ->where('cartes_trucades.telefon', '=', $tel)->orderBy('codi_trucada')
                ->paginate(5)
                ->withQueryString();

        } else if (!empty($fecha) && !empty($tel) && $tipusLocs != 'todos' && $tipusEmgs != 'todos') {
            //Funciona
            $cartes = CartaTrucada::join('tipus_localitzacions', 'cartes_trucades.tipus_localitzacions_id', '=', 'tipus_localitzacions.id')
                ->join('incidents', 'cartes_trucades.incidents_id', '=', 'incidents.id')
                ->join('tipus_incidents', 'incidents.classes_incidents_id', '=', 'tipus_incidents.id')
                ->select('tipus_localitzacions.tipus', 'codi_trucada', 'data_hora', 'tipus_incidents.descripcio', 'telefon', 'expedients_id')
                ->where('cartes_trucades.data_hora', 'like', '%' . $fecha . '%')
                ->where('cartes_trucades.expedients_id', '=', $expedients_controller->id)
                ->where('tipus_localitzacions.tipus', '=', $tipusLocs)
                ->where('tipus_incidents.descripcio', '=', $tipusEmgs)
                ->where('cartes_trucades.telefon', '=', $tel)->orderBy('codi_trucada')
                ->paginate(5)
                ->withQueryString();
        } else if (!empty($fecha)  && $tipusLocs == 'todos' && $tipusEmgs != 'todos') {
            //Funciona
            $cartes = CartaTrucada::join('tipus_localitzacions', 'cartes_trucades.tipus_localitzacions_id', '=', 'tipus_localitzacions.id')
                ->join('incidents', 'cartes_trucades.incidents_id', '=', 'incidents.id')
                ->join('tipus_incidents', 'incidents.classes_incidents_id', '=', 'tipus_incidents.id')
                ->select('tipus_localitzacions.tipus', 'codi_trucada', 'data_hora', 'tipus_incidents.descripcio', 'telefon', 'expedients_id')
                ->where('cartes_trucades.data_hora', 'like', '%' . $fecha . '%')
                ->where('cartes_trucades.expedients_id', '=', $expedients_controller->id)
                ->where('tipus_incidents.descripcio', '=', $tipusEmgs)
                ->orderBy('codi_trucada')
                ->paginate(5)
                ->withQueryString();

        } else if (!empty($fecha)  && $tipusLocs != 'todos' && $tipusEmgs == 'todos') {
            //Funciona
            $cartes = CartaTrucada::join('tipus_localitzacions', 'cartes_trucades.tipus_localitzacions_id', '=', 'tipus_localitzacions.id')
                ->join('incidents', 'cartes_trucades.incidents_id', '=', 'incidents.id')
                ->join('tipus_incidents', 'incidents.classes_incidents_id', '=', 'tipus_incidents.id')
                ->select('tipus_localitzacions.tipus', 'codi_trucada', 'data_hora', 'tipus_incidents.descripcio', 'telefon', 'expedients_id')
                ->where('cartes_trucades.data_hora', 'like', '%' . $fecha . '%')
                ->where('cartes_trucades.expedients_id', '=', $expedients_controller->id)
                ->where('tipus_localitzacions.tipus', '=', $tipusLocs)
                ->orderBy('codi_trucada')
                ->paginate(5)
                ->withQueryString();

        } else if (!empty($fecha)  && $tipusLocs != 'todos' && $tipusEmgs != 'todos') {
            //Funciona
            $cartes = CartaTrucada::join('tipus_localitzacions', 'cartes_trucades.tipus_localitzacions_id', '=', 'tipus_localitzacions.id')
                ->join('incidents', 'cartes_trucades.incidents_id', '=', 'incidents.id')
                ->join('tipus_incidents', 'incidents.classes_incidents_id', '=', 'tipus_incidents.id')
                ->select('tipus_localitzacions.tipus', 'codi_trucada', 'data_hora', 'tipus_incidents.descripcio', 'telefon', 'expedients_id')
                ->where('cartes_trucades.data_hora', 'like', '%' . $fecha . '%')
                ->where('cartes_trucades.expedients_id', '=', $expedients_controller->id)
                ->where('tipus_localitzacions.tipus', '=', $tipusLocs)
                ->where('tipus_incidents.descripcio', '=', $tipusEmgs)
                ->orderBy('codi_trucada')
                ->paginate(5)
                ->withQueryString();

        } else if (empty($fecha) && empty($tel) && $tipusEmgs != 'todos') {
            //Funciona
            $cartes = CartaTrucada::join('tipus_localitzacions', 'cartes_trucades.tipus_localitzacions_id', '=', 'tipus_localitzacions.id')
                ->join('incidents', 'cartes_trucades.incidents_id', '=', 'incidents.id')
                ->join('tipus_incidents', 'incidents.classes_incidents_id', '=', 'tipus_incidents.id')
                ->select('tipus_localitzacions.tipus', 'codi_trucada', 'data_hora', 'tipus_incidents.descripcio', 'telefon', 'expedients_id')
                ->where('cartes_trucades.expedients_id', '=', $expedients_controller->id)
                ->where('tipus_incidents.descripcio', '=', $tipusEmgs)
                ->orderBy('codi_trucada')
                ->paginate(5)
                ->withQueryString();

        } else if ($tipusLocs == 'todos') {
            //Funciona
            $cartes = CartaTrucada::join('tipus_localitzacions', 'cartes_trucades.tipus_localitzacions_id', '=', 'tipus_localitzacions.id')
                ->join('incidents', 'cartes_trucades.incidents_id', '=', 'incidents.id')
                ->join('tipus_incidents', 'incidents.classes_incidents_id', '=', 'tipus_incidents.id')
                ->select('tipus_localitzacions.tipus', 'codi_trucada', 'data_hora', 'tipus_incidents.descripcio', 'telefon', 'expedients_id')
                ->where('cartes_trucades.expedients_id', '=', $expedients_controller->id)
                ->orderBy('codi_trucada')
                ->paginate(5)
                ->withQueryString();

        } else if ($tipusLocs != 'todos') {
            //Funciona
            $cartes = CartaTrucada::join('tipus_localitzacions', 'cartes_trucades.tipus_localitzacions_id', '=', 'tipus_localitzacions.id')
                ->join('incidents', 'cartes_trucades.incidents_id', '=', 'incidents.id')
                ->join('tipus_incidents', 'incidents.classes_incidents_id', '=', 'tipus_incidents.id')
                ->select('tipus_localitzacions.tipus', 'codi_trucada', 'data_hora', 'tipus_incidents.descripcio', 'telefon', 'expedients_id')
                ->where('cartes_trucades.expedients_id', '=', $expedients_controller->id)
                ->where('tipus_localitzacions.tipus', '=', $tipusLocs)
                ->orderBy('codi_trucada')
                ->paginate(5)
                ->withQueryString();
        } else if ($tipusEmgs == 'todos') {
            //Funciona
            $cartes = CartaTrucada::join('tipus_localitzacions', 'cartes_trucades.tipus_localitzacions_id', '=', 'tipus_localitzacions.id')
                ->join('incidents', 'cartes_trucades.incidents_id', '=', 'incidents.id')
                ->join('tipus_incidents', 'incidents.classes_incidents_id', '=', 'tipus_incidents.id')
                ->select('tipus_localitzacions.tipus', 'codi_trucada', 'data_hora', 'tipus_incidents.descripcio', 'telefon', 'expedients_id')
                ->where('cartes_trucades.expedients_id', '=', $expedients_controller->id)
                ->orderBy('codi_trucada')
                ->paginate(5)
                ->withQueryString();

        } else if (!empty($fecha)  && $tipusEmgs == 'todos') {
            //Funciona
            $cartes = CartaTrucada::join('tipus_localitzacions', 'cartes_trucades.tipus_localitzacions_id', '=', 'tipus_localitzacions.id')
                ->join('incidents', 'cartes_trucades.incidents_id', '=', 'incidents.id')
                ->join('tipus_incidents', 'incidents.classes_incidents_id', '=', 'tipus_incidents.id')
                ->select('tipus_localitzacions.tipus', 'codi_trucada', 'data_hora', 'tipus_incidents.descripcio', 'telefon', 'expedients_id')
                ->where('cartes_trucades.expedients_id', '=', $expedients_controller->id)
                ->orderBy('codi_trucada')
                ->paginate(5)
                ->withQueryString();

        } else if (!empty($fecha)  && $tipusEmgs != 'todos') {
            $cartes = CartaTrucada::join('tipus_localitzacions', 'cartes_trucades.tipus_localitzacions_id', '=', 'tipus_localitzacions.id')
                ->join('incidents', 'cartes_trucades.incidents_id', '=', 'incidents.id')
                ->join('tipus_incidents', 'incidents.classes_incidents_id', '=', 'tipus_incidents.id')
                ->select('tipus_localitzacions.tipus', 'codi_trucada', 'data_hora', 'tipus_incidents.descripcio', 'telefon', 'expedients_id')
                ->where('cartes_trucades.expedients_id', '=', $expedients_controller->id)
                ->where('tipus_incidents.descripcio', '=', $tipusEmgs)
                ->orderBy('codi_trucada')
                ->paginate(5);
        }

        return view('cartes.carta', compact('tipusLoc', 'tipusEmg', 'cartes', 'id', 'fecha', 'tipusEmgs', 'tipusLocs', 'tel', 'expedients_controller'));
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
