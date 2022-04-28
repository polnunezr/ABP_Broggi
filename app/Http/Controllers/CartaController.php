<?php

namespace App\Http\Controllers;
use App\Models\Accident;
use App\Models\CartaTrucada;
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
    public function show($codiCartaTrucada)
    {
        // $cartaTrucada = CartaTrucada::where("codi_trucada","=",$codiCartaTrucada);
        // $a = $cartaTrucada->id;
        return redirect()->route("cartes_trucades_controller.show", ['cartes_trucades_controller' => $codiCartaTrucada]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Carta  $carta
     * @return \Illuminate\Http\Response
     */
    public function edit(CartaTrucada $carta)
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
    public function update(Request $request, CartaTrucada $carta)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Carta  $carta
     * @return \Illuminate\Http\Response
     */
    public function destroy(CartaTrucada $carta)
    {
        //
    }
}
