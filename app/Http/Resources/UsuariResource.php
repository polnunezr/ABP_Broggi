<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class UsuariResource extends JsonResource
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
            "codi" => $this->codi,
            "nom" => $this->nom,
            "cognoms" => $this->cognoms,
            "perfils_id" => $this->perfils_id,
            "actiu" => $this->actiu,
            "perfil" => $this->perfil
        ];
    }
}
