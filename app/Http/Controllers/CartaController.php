<?php

namespace App\Http\Controllers;

use App\Models\Accident;
use App\Models\Carta;
use App\Models\Localitzacio;
use Illuminate\Http\Request;

class CartaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $tipusLocs = Localitzacio::all();
        $tipusIncs = Accident::all();
        $cartes = Carta::all();

        //Recollim tots els inputs que introdueix l'usuari
        /*
        $numExpediente = $request->input('id');

        $operador = $request->input('operador');
        $data = $request->input('modificacio');
        $localitzacio = $request->input('loc');
        $emergencia = $request->input('emer');
        $estado = $request->input('actiuBuscar');
        */
        //Consultes SQL



        /* if (!empty($numExpediente)) {

            if (!empty($estado)) {
                    if ($estado == 'actiu') {
                        $cartes = Carta::join('usuaris', 'cartes_trucades.usuaris_id', '=', 'usuaris.id')
                            ->where('usuaris.nom', '=', $operador)
                            ->join('expedients', 'cartes_trucades.expedients_id', '=', 'expedients.id')
                            ->whereIn('expedients.estats_expedients_id', [1, 2, 3])
                            ->orderBy('cartes_trucades.codi_trucada')
                            ->paginate(6)
                            ->withQueryString();
                    } else if ($estado == 'noactiu') {
                        $cartes = Carta::join('usuaris', 'cartes_trucades.usuaris_id', '=', 'usuaris.id')
                            ->where('usuaris.nom', '=', $operador)
                            ->join('expedients', 'cartes_trucades.expedients_id', '=', 'expedients.id')
                            ->whereIn('expedients.estats_expedients_id', [4, 5])
                            ->orderBy('cartes_trucades.codi_trucada')
                            ->paginate(6)
                            ->withQueryString();
                    } else {
                        $carta = Carta::join('usuaris', 'cartes_trucades.usuaris_id', '=', 'usuaris.id')
                            ->where('usuaris.nom', '=', $operador)
                            ->orderBy('cartes_trucades.codi_trucada')
                            ->paginate(6)
                            ->withQueryString();
                    }
                }
            } else if (!empty($operador) and $localitzacio != 'todos') {
                if (!empty($estado)) {
                    if ($estado == 'actiu') {
                        $cartes = Carta::join('usuaris', 'cartes_trucades.usuaris_id', '=', 'usuaris.id')
                            ->where('usuaris.nom', '=', $operador)
                            ->join('expedients', 'cartes_trucades.expedients_id', '=', 'expedients.id')
                            ->whereIn('expedients.estats_expedients_id', [1, 2, 3])
                            ->orderBy('cartes_trucades.codi_trucada')
                            ->paginate(6)
                            ->withQueryString();
                    } else if ($estado == 'noactiu') {
                        $cartes = Carta::join('usuaris', 'cartes_trucades.usuaris_id', '=', 'usuaris.id')
                            ->where('usuaris.nom', '=', $operador)
                            ->join('expedients', 'cartes_trucades.expedients_id', '=', 'expedients.id')
                            ->whereIn('expedients.estats_expedients_id', [4, 5])
                            ->orderBy('cartes_trucades.codi_trucada')
                            ->paginate(6)
                            ->withQueryString();
                    } else {
                        $carta = Carta::join('usuaris', 'cartes_trucades.usuaris_id', '=', 'usuaris.id')
                            ->where('usuaris.nom', '=', $operador)
                            ->orderBy('cartes_trucades.codi_trucada')
                            ->paginate(6)
                            ->withQueryString();
                    }
                }
            }
        } else {
            $cartes = Carta::where('cartes_trucades.codi_trucada', '=', $numExpediente);
        }*/
        return view('cartes.carta', compact('cartes', 'tipusLoc', 'tipusIncs'));
        //
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
    public function show(Carta $carta)
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