<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\CartaTrucada;
use App\Models\DadaPersonal;
use App\Models\Municipi;
use App\Models\Comarca;
use App\Models\Provincia;
use App\Models\TipusLocalitzacio;
use App\Models\Incident;
use App\Models\TipusIncident;
use Illuminate\Http\Request;
use Illuminate\Routing\Route;
use App\Http\Resources\CartesTrucadesResource;

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

        // return view("cartaTrucada.index");
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
    public function show($codiCartaTrucada)
    {
        // $cartaTrucadaShow = CartaTrucada::find($cartaTrucadaId);
        $cartaTrucadaShow = CartaTrucada::where("codi_trucada","=",$codiCartaTrucada)->get();
        $cartaTrucadaShow = $cartaTrucadaShow[0];
        // $cartaTrucadaShow = $cartaTrucada;
        // $cartaTrucadaShow->dades_personals_id = null;
        $dadaPersonalShow = json_encode(null);
        // $dadaPersonalShow = (Object)[];
        // $dadaPersonalShow->property = "null";
        if($cartaTrucadaShow->dades_personals_id != null){
            $dadaPersonalShow = DadaPersonal::find($cartaTrucadaShow->dades_personals_id);
        }
        $localitzacioTrucadaShow = json_encode(null);
        if($cartaTrucadaShow->municipis_id_trucada != null) {
            $municipi = Municipi::find($cartaTrucadaShow->municipis_id_trucada);
            $comarca = Comarca::find($municipi->comarques_id);
            $provincia = Provincia::find($comarca->provincies_id);

            // $localitzacioTrucadaShow = ["Provincia" => json_decode($provincia->nom),
            // "Comarca" => json_decode($comarca->nom),"Municipi" => json_decode($municipi->nom)];
            // $localitzacioTrucadaShow = (Object) $localitzacioTrucadaShow;
            // $localitzacioTrucada = [];
            // $localitzacioTrucadaShow = new Localitzacio($provincia->nom,$comarca->nom,$municipi->nom);
            // $localitzacioTrucadaShow = json_encode($localitzacioTrucadaShow);
            //"{"municipi":"Vilaverd"}"

            $localitzacioTrucadaShow = ["provincia" => $provincia->nom,
            "comarca" => $comarca->nom,"municipi" => $municipi->nom];

            $localitzacioTrucadaShow = json_encode($localitzacioTrucadaShow);
        }

        //Localitzacio
        $provincia;
        $comarca;
        $municipi;

        $localitzacioShow = json_encode(null);

        if($cartaTrucadaShow->provincies_id != null) {
            $provincia = Provincia::find($cartaTrucadaShow->provincies_id);
            if($cartaTrucadaShow->municipis_id != null) {
                $municipi = Municipi::find($cartaTrucadaShow->municipis_id);
                $comarca = Comarca::find($municipi->comarques_id);

                $localitzacioShow = ["provincia" => $provincia->nom,
                "comarca" => $comarca->nom,"municipi" => $municipi->nom];
                $localitzacioShow = json_encode($localitzacioShow);
            }
            else {
                $municipi = null;
                $comarca = null;

                $localitzacioShow = ["provincia" => $provincia->nom,
                "comarca" => null,"municipi" => null];
                $localitzacioShow = json_encode($localitzacioShow);
            }
        }
        else {
            $localitzacioShow = ["provincia" => null,
                "comarca" => null,"municipi" => null];
            $localitzacioShow = json_encode($localitzacioShow);
        }



        //tipus localitzacio
        $tipusLocalitzacioShow = json_encode(null);
        $tipusNom = null;

        switch($cartaTrucadaShow->tipus_localitzacions_id) {
            case 1: //Carrers
                $tipus = TipusLocalitzacio::find($cartaTrucadaShow->tipus_localitzacions_id);
                $tipusId = $tipus->id;
                $tipusNom = $tipus->tipus;

                $tipusDeVia = null;
                $nom = null;
                //tipus de via + nom
                if($cartaTrucadaShow->descripcio_localitzacio != null) {
                    if(str_contains($cartaTrucadaShow->descripcio_localitzacio,",")) {
                        $tipusSplit = explode(",",$cartaTrucadaShow->descripcio_localitzacio);
                        $tipusDeVia = $tipusSplit[0];
                        $nom = $tipusSplit[1];
                    }
                    else {
                        $tipusDeVia = $cartaTrucadaShow->descripcio_localitzacio;
                    }
                }
                else {
                    $tipusDeVia = null;
                    $nom = null;
                }
                $numero = null;
                $escala = null;
                $pis = null;
                $porta = null;
                //Numero + escala + pis + porta
                if($cartaTrucadaShow->detall_localitzacio != null) {
                    if(str_contains($cartaTrucadaShow->detall_localitzacio,",")) {
                        $tipusSplit = explode(",",$cartaTrucadaShow->detall_localitzacio);
                        switch(count($tipusSplit)) {
                            case 1:
                                $numero = $tipusSplit[0];
                                break;
                            case 2:
                                $numero = $tipusSplit[0];
                                $escala = $tipusSplit[1];
                                $escala = substr($escala,1);
                                break;
                            case 3:
                                $numero = $tipusSplit[0];
                                $escala = $tipusSplit[1];
                                $escala = substr($escala,1);
                                $pis = $tipusSplit[2];
                                $pis = substr($pis,1);
                                break;
                            case 4:
                                $numero = $tipusSplit[0];
                                $escala = $tipusSplit[1];
                                $escala = substr($escala,1);
                                $pis = $tipusSplit[2];
                                $pis = substr($pis,1);
                                $porta = $tipusSplit[3];
                                $porta = substr($porta,1);
                                break;
                        }
                    }
                    else {
                        $numero =$cartaTrucadaShow->detall_localitzacio;
                    }

                }
                else {
                    $numero = null;
                    $escala = null;
                    $pis = null;
                    $porta = null;
                }

                $tipusLocalitzacioShow = ["id" => $tipusId,
                "nomTipus" => $tipusNom,"tipusDeVia" => $tipusDeVia,
                "nom" => $nom,"numero" => $numero,"escala" => $escala,"pis" => $pis
                ,"porta" => $porta];

                $tipusLocalitzacioShow = json_encode($tipusLocalitzacioShow);


                break;
            case 2: //Punt Singular
                $tipus = TipusLocalitzacio::find($cartaTrucadaShow->tipus_localitzacions_id);
                $tipusId = $tipus->id;
                $tipusNom = $tipus->tipus;

                $nomPuntSingular = null;

                if($cartaTrucadaShow->descripcio_localitzacio != null) {

                    $nomPuntSingular = $cartaTrucadaShow->descripcio_localitzacio;

                }

                $tipusLocalitzacioShow = ["id" => $tipusId,
                "nomTipus" => $tipusNom,"nomPuntSingular" => $nomPuntSingular];

                $tipusLocalitzacioShow = json_encode($tipusLocalitzacioShow);



                break;
            case 3: //Entitat Població
                $tipus = TipusLocalitzacio::find($cartaTrucadaShow->tipus_localitzacions_id);
                $tipusId = $tipus->id;
                $tipusNom = $tipus->tipus;

                $tipusLocalitzacioShow = ["id" => $tipusId,"nomTipus" => $tipusNom];

                $tipusLocalitzacioShow = json_encode($tipusLocalitzacioShow);

                break;
            case 4: //Carretera
                $tipus = TipusLocalitzacio::find($cartaTrucadaShow->tipus_localitzacions_id);
                $tipusId = $tipus->id;
                $tipusNom = $tipus->tipus;

                //Nom carretera
                $nomCarretera = null;

                if($cartaTrucadaShow->descripcio_localitzacio != null) {
                    $nomCarretera = $cartaTrucadaShow->descripcio_localitzacio;
                }
                else {
                    $nomCarretera = null;
                }

                //Punt kilometric + sentit
                $puntKilometric = null;
                $sentit = null;

                if($cartaTrucadaShow->detall_localitzacio != null) {
                    if(str_contains($cartaTrucadaShow->detall_localitzacio,",")) {
                        $tipusSplit = explode(",",$cartaTrucadaShow->detall_localitzacio);
                        $puntKilometric = $tipusSplit[0];
                        $sentit = $tipusSplit[1];
                    }
                    else {
                        $puntKilometric = $cartaTrucadaShow->detall_localitzacio;
                    }
                }
                else {
                    $puntKilometric = null;
                    $sentit = null;

                }

                $tipusLocalitzacioShow = ["id" => $tipusId,
                "nomTipus" => $tipusNom,"nomCarretera" => $nomCarretera,
                "puntKilometric" => $puntKilometric,"sentit" => $sentit];

                $tipusLocalitzacioShow = json_encode($tipusLocalitzacioShow);

                break;
            case 5: //Provincia
                $tipus = TipusLocalitzacio::find($cartaTrucadaShow->tipus_localitzacions_id);
                $tipusId = $tipus->id;
                $tipusNom = $tipus->tipus;

                $provinciaNom = null;

                if($cartaTrucadaShow->provincies_id != null) {
                    $provinciaNom = Provincia::find($cartaTrucadaShow->provincies_id);
                    $provinciaNom = $provinciaNom->nom;
                }

                $municipiNom = null;

                if($cartaTrucadaShow->descripcio_localitzacio != null) {
                    $municipiNom = $cartaTrucadaShow->descripcio_localitzacio;
                }

                $tipusLocalitzacioShow = ["id" => $tipusId,
                "nomTipus" => $tipusNom,"provinciaNom" => $provinciaNom,"municipiNom" => $municipiNom];

                $tipusLocalitzacioShow = json_encode($tipusLocalitzacioShow);


                break;
        }

        //Emergencia

        $incident = Incident::find($cartaTrucadaShow->incidents_id);

        $tipusIncident = TipusIncident::find($incident->classes_incidents_id);
        $tipusIncidentDescripcio = $tipusIncident->descripcio;

        $incidentShow = ["incident" => $incident,"tipusIncidentDescripcio" => $tipusIncidentDescripcio];

        $incidentShow = json_encode($incidentShow);


        //$cartaTrucadaShow = CartesTrucadesResource::collection($cartaTrucadaShow);
        return view("cartaTrucada.show",compact("cartaTrucadaShow","dadaPersonalShow","localitzacioTrucadaShow","localitzacioShow"
        ,"tipusLocalitzacioShow","incidentShow"));

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
