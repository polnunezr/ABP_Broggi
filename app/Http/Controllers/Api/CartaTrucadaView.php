<?php

namespace App\Http\Controllers\Api;

use App\Clases\Utilitat;
use App\Models\Expedient;
use App\Models\CartaTrucada;
use App\Models\DadaPersonal;
use App\Models\CartesTrucadesHasAgencies;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Database\QueryException;
use App\Http\Resources\CartesTrucadesResource;
use App\Http\Controllers\CartaTrucadaController;

class CartaTrucadaView extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // $dades_personals = $request->input("dades_personals");
        // $expedients = $request->input("expedients");
        // $cartes_trucades = $request->input("cartes_trucades");

        $dades_personals = $request["dades_personals"];
        $expedients = $request["expedients"];
        $cartes_trucades = $request["cartes_trucades"];
        $cartes_trucades_has_agencies = $request["cartes_trucades_has_agencies"];

        //Carta_trucada_object
        $cartaTrucada = new CartaTrucada();


        //Dada personal
        $dadaPersonal = null;
        $insertDadaPersonal = false;

        if($dades_personals["guardar"] && $dades_personals["adreca"] != null
            && $dades_personals["antecedents"] != null) { //false

            $insertDadaPersonal = true;
            $dadaPersonal = new DadaPersonal();
            $dadaPersonal->telefon = $dades_personals["telefon"];
            $dadaPersonal->adreca = $dades_personals["adreca"];
            $dadaPersonal->antecedents= $dades_personals["antecedents"];

        }
        else if($dades_personals["guardar"] === null){
            $cartaTrucada->dades_personals_id = $dades_personals["id"];
        }

        // $idDadaPersonal = $dades_personals["id"];
        // if($idDadaPersonal == null && ($dades_personals["adreca"] == null || $dades_personals["antecedents"] == null ||
        // $dades_personals["telefon"] == null)) {
        //     //Data personal no relacionada, y no llenada de datos
        //     $cartaTrucada->dades_personals_id = null;
        // }
        // else if($idDadaPersonal == null && $dades_personals["adreca"] != null && $dades_personals["antecedents"] != null &&
        // $dades_personals["telefon"] != null) {
        //     //Data personal no relacionada pero datos rellenados | insert dades_personals
        //     $dadaPersonal = new DadaPersonal();
        //     $dadaPersonal->telefon = $dades_personals["telefon"];
        //     $dadaPersonal->adreca = $dades_personals["adreca"];
        //     $dadaPersonal->antecedents= $dades_personals["antecedents"];

        //     $insertDadaPersonal = true;

        //     //$cartaTrucada->dades_personals_id = idDada
        // }
        // else {
        //     //Data personal relacionada
        //     $cartaTrucada->dades_personals_id = $idDadaPersonal;
        // }

        //Expedient
        $expedient = null;
        $insertExpedient = false;
        if($expedients["id"] == null) {
            $expedient = new Expedient();
            $expedient->data_creacio = $expedients["data_creacio"];
            $expedient->data_ultima_modificacio = $expedients["data_ultima_modificacio"];
            $expedient->estats_expedients_id = $expedients["estats_expedients_id"];

            //insert expedient

            $insertExpedient = true;

            //$cartaTrucada->expedients_id = idExpedient
        }
        else {
            $cartaTrucada->expedients_id = $expedients["id"];
        }

        // temps_trucada
        $cartaTrucada->codi_trucada = $cartes_trucades["codi_trucada"];
        $cartaTrucada->data_hora = $cartes_trucades["data_hora"];
        $cartaTrucada->temps_trucada = $cartes_trucades["temps_trucada"];
        //dades personals id -> obtenido
        $cartaTrucada->telefon = $cartes_trucades["telefon"];
        $cartaTrucada->procedencia_trucada = $cartes_trucades["procedencia_trucada"];
        $cartaTrucada->origen_trucada = $cartes_trucades["origen_trucada"];
        $cartaTrucada->nom_trucada = $cartes_trucades["nom_trucada"];
        $cartaTrucada->municipis_id_trucada = $cartes_trucades["municipis_id_trucada"];
        $cartaTrucada->adreca_trucada = $cartes_trucades["adreca_trucada"];
        $cartaTrucada->fora_catalunya = $cartes_trucades["fora_catalunya"];
        $cartaTrucada->provincies_id = $cartes_trucades["provincies_id"];
        $cartaTrucada->municipis_id = $cartes_trucades["municipis_id"];
        $cartaTrucada->tipus_localitzacions_id = $cartes_trucades["tipus_localitzacions_id"];
        $cartaTrucada->descripcio_localitzacio = $cartes_trucades["descripcio_localitzacio"];
        $cartaTrucada->detall_localitzacio = $cartes_trucades["detall_localitzacio"];
        $cartaTrucada->altres_ref_localitzacio = $cartes_trucades["altres_ref_localitzacio"];
        $cartaTrucada->incidents_id = $cartes_trucades["incidents_id"];
        $cartaTrucada->nota_comuna = $cartes_trucades["nota_comuna"];
        //expedients id -> obtenido
        $cartaTrucada->usuaris_id = $cartes_trucades["usuaris_id"];

        //Agencies
        $insertAgencies = false;
        $cartesTrucadesHasAgencies = null;
        if(count($cartes_trucades_has_agencies["agenciesId"]) > 0) {
            $insertAgencies = true;
        }

        DB::beginTransaction();

        try {
            if($insertDadaPersonal) {
                $dadaPersonal->save();
                $cartaTrucada->dades_personals_id = $dadaPersonal->id;
            }
            if($insertExpedient) {
                $expedient->save();
                $cartaTrucada->expedients_id = $expedient->id;

            }
            $cartaTrucada->save();

            if($insertAgencies) {
                foreach($cartes_trucades_has_agencies["agenciesId"] as $agenciesId) {
                    $cartesTrucadesHasAgencies = new CartesTrucadesHasAgencies();

                    $cartesTrucadesHasAgencies->cartes_trucades_id = $cartaTrucada->id;
                    $cartesTrucadesHasAgencies->agencies_id = $agenciesId;
                    $cartesTrucadesHasAgencies->estats_agencies_id = 1;
                    $cartesTrucadesHasAgencies->save();
                }
            }

            DB::commit();
            $response = (new CartesTrucadesResource($cartaTrucada))
                    ->response()
                    ->setStatusCode(201);
            // $response = redirect()->action([CartaTrucadaController::class,"index"]);

        }
        catch(QueryException $ex) {
            DB::rollBack();
            $mensaje = Utilitat::errorMessage($ex);
            $response = \response()
                        ->json(["error" => $mensaje], 400);

            // $response = redirect()->action([CartaTrucadaView::class,"index"])->withInput();
        }

        return $response;
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
