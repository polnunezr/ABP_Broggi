<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\DadaPersonal;
use Illuminate\Http\Request;
use App\Http\Resources\DadaPersonalResource;
use Illuminate\Database\QueryException;

class DadaPersonalController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $dadesPersonal = DadaPersonal::all();
        return DadaPersonalResource::collection($dadesPersonal);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $dadaPersonal = new DadaPersonal();

        $dadaPersonal->telefon = $request->input("telefon");
        $dadaPersonal->adreca = $request->input("adreca");
        $dadaPersonal->antecedents = $request->input("antecedents");

        try {
            $dadaPersonal->save();
            $response = (new DadaPersonalResource($dadaPersonal))
                        ->response()
                        ->setStatusCode(201);
        }
        catch(QueryException $ex) {
            $response = redirect()->action([DadaPersonalController::class,"index"])->withInput();
        }

        return $response;
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\DadaPersonal  $dadaPersonal
     * @return \Illuminate\Http\Response
     */
    public function show(DadaPersonal $dadaPersonal)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\DadaPersonal  $dadaPersonal
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, DadaPersonal $dadaPersonal)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\DadaPersonal  $dadaPersonal
     * @return \Illuminate\Http\Response
     */
    public function destroy(DadaPersonal $dadaPersonal)
    {
        //
    }
}
