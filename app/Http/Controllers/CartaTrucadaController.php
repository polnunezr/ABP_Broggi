<?php

namespace App\Http\Controllers;

use App\Models\CartaTrucada;
use Illuminate\Http\Request;
use Illuminate\Routing\Route;
use Illuminate\Support\Facades\Auth;

class CartaTrucadaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $usuari = Auth::user();

        return view("cartaTrucada.index", compact('usuari'));
        // Route::view('/cartes_trucades',"cartaTrucada.index");
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
     * @param  \App\Models\CartaTrucada  $cartaTrucada
     * @return \Illuminate\Http\Response
     */
    public function show(CartaTrucada $cartaTrucada)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\CartaTrucada  $cartaTrucada
     * @return \Illuminate\Http\Response
     */
    public function edit(CartaTrucada $cartaTrucada)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\CartaTrucada  $cartaTrucada
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, CartaTrucada $cartaTrucada)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\CartaTrucada  $cartaTrucada
     * @return \Illuminate\Http\Response
     */
    public function destroy(CartaTrucada $cartaTrucada)
    {
        //
    }
}
