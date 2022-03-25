<?php

namespace App\Http\Resources;

use App\Http\Resources\ExpedientEstatResource;
use Illuminate\Http\Resources\Json\JsonResource;

class ExpedientResource extends JsonResource
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
        // return [
        //     "id" => $this->id,
        //     "data_creacio" => $this->data_creacio,
        //     "data_ultima_modificacio" => $this->data_creacio,
        //     "estats_expedients_id" => $this->estats_expedients_id,
        //     "cartesTrucada" => CartesTrucadesResource::collection($this->cartesTrucada)
        // ];
        return [
            "id" => $this->id,
            "data_creacio" => $this->data_creacio,
            "data_ultima_modificacio" => $this->data_creacio,
            "estats_expedients_id" => $this->estats_expedients_id,
            "estat_expedient" => $this->estatExpedient
        ];
    }
}
