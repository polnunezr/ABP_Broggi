<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\CartesTrucadesPartes;
use Illuminate\Http\Request;
use App\Http\Resources\CartesTrucadesPartesResource;

class CartesTrucadesPartesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $cartesTrucadesPartes = CartesTrucadesPartes::all();
        return CartesTrucadesPartesResource::collection($cartesTrucadesPartes);
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
     * @param  \App\Models\CartesTrucadesPartes  $cartesTrucadesPartes
     * @return \Illuminate\Http\Response
     */
    public function show(CartesTrucadesPartes $cartesTrucadesPartes)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\CartesTrucadesPartes  $cartesTrucadesPartes
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, CartesTrucadesPartes $cartesTrucadesPartes)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\CartesTrucadesPartes  $cartesTrucadesPartes
     * @return \Illuminate\Http\Response
     */
    public function destroy(CartesTrucadesPartes $cartesTrucadesPartes)
    {
        //
    }
}
