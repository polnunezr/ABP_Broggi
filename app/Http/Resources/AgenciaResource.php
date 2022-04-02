<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class AgenciaResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        // return parent::toArray($request);
        return [
            "id" => $this->id,
            "nom" => $this->nom,
            "data_ultima_modificacio" => $this->data_creacio,
            "carrer" => $this->carrer,
            "codi_postal" => $this->codi_postal,
            "correu" => $this->correu,
            "municipis_id" => $this->municipis_id,
            "municipi" => $this->municipi,
        ];
    }
}
