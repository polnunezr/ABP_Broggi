<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class CartesTrucadesResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        return parent::toArray($request);
        // return [
        //     "id" => $this->id,
        //     "codi_trucada" => $this->codi_trucada,
        //     "data_hora" => $this->data_hora,
        //     "temps_trucada" => $this->temps_trucada,
        //     "dades_personals_id" => $this->dades_personals_id,
        //     "telefon" => $this->telefon,
        //     "procedencia_trucada" => $this->procedencia_trucada,
        //     "origen_trucada" => $this->origen_trucada,
        //     "nom_trucada" => $this->nom_trucada,
        //     "municipis_id_trucada" => $this->municipis_id_trucada,
        //     "adreca_trucada" => $this->adreca_trucada,
        //     "fora_catalunya" => $this->fora_catalunya,
        //     "provincies_id" => $this->provincies_id,
        //     "municipis_id" => $this->municipis_id,
        //     "tipus_localitzacions_id" => $this->tipus_localitzacions_id,
        //     "descripcio_localitzacio" => $this->descripcio_localitzacio,
        //     "detall_localitzacio" => $this->detall_localitzacio,
        //     "altres_ref_localitzacio" => $this->altres_ref_localitzacio,
        //     "incidents_id" => $this->incidents_id,
        //     "nota_comuna" => $this->nota_comuna,
        //     "expedients_id" => $this->expedients_id,
        //     "usuaris_id" => $this->usuaris_id,
        //     "expedient" => $this->expedient,
        // ];
    }
}
