<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Expedient;
use Illuminate\Http\Request;
use App\Http\Resources\ExpedientResource;
use Illuminate\Database\QueryException;

class ExpedientController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $expedients = Expedient::all();

        return ExpedientResource::collection($expedients);

    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // $expedients = new Expedient();

        // $expedients->data_creacio  = $request->input("data_creacio");
        // $expedients->data_ultima_modificacio = $request->input("data_ultima_modificacio");
        // $expedients->estats_expedients_id = $request->input("estats_expedients_id");

        // try {
        //     $expedients->save();
        //     $response = (new ExpedientResource($expedients))
        //                 ->response()
        //                 ->setStatusCode(201);
        // }
        // catch(QueryException $ex) {
        //     $response = redirect()->action([ExpedientController::class,"index"])->withInput();
        // }

        // return $response;


    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\ExpedientController  $expedientController
     * @return \Illuminate\Http\Response
     */
    public function show(ExpedientController $expedientController)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\ExpedientController  $expedientController
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, ExpedientController $expedientController)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\ExpedientController  $expedientController
     * @return \Illuminate\Http\Response
     */
    public function destroy(ExpedientController $expedientController)
    {
        //
    }
}
