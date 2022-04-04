<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Carta extends Model
{
    use HasFactory;
    protected $table = 'cartes_trucades';
    public $timestamps = false;

    /**
     * Get all of the comments for the Carta
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function carta()
    {
        return $this->belongsTo(Localitzacio::class, 'tipus_localitzacions_id');
    }
    public function expedientCarta()
    {
        return $this->belongsTo(Expedient::class, 'expedients_id');
    }
    public function provincia()
    {
        return $this->belongsTo(Provincies::class, 'provincies_id');
    }
    public function cartesMunicipis()
    {
        return $this->hasMany(Municipi::class, 'municipis_id');
    }
    public function cartaTrucada()
    {
        return $this->belongsTo(CartesTrucadesAgencies::class, "cartes_trucades_id");
    }
    public function dades_personal()
    {
        return $this->belongsTo(DadesPersonals::class, 'dades_personals_id');
    }
    public function usuari_carta()
    {
        return $this->belongsTo(Usuari::class, 'usuaris_id');
    }
}