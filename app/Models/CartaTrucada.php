<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CartaTrucada extends Model
{
    use HasFactory;

    protected $table = "cartes_trucades";
    // protected $primaryKey = "id";
    // public $incremneting = false;
    // protected $keyType = "string"
    public $timestamps = false;

    public function incident() {
        return $this->belongsTo(Incident::class, "incidents_id");
    }

    public function provincia() {
        return $this->belongsTo(Provincia::class, "provincies_id");
    }

    public function municipi() {
        return $this->belongsTo(Municipi::class, "municipis_id");
    }

    public function municipiTrucada() {
        return $this->belongsTo(Municipi::class, "municipis_id_trucada");
    }

    public function usuari() {
        return $this->belongsTo(Usuari::class, "perfils_id");
    }


    // public function agencies() {
    //     return $this->belongsToMany
    //     (Agencia::class, "cartes_trucades_has_agencies","cartes_trucades_id","agencies_id")->withPivot("estats_agencies_id");
    // }


    public function cartes_trucades_has_agencies(){
        return $this->hasMany(CartesTrucadesHasAgencies::class, 'cartes_trucades_id');
    }

    public function tipusLocalitzacio() {
        return $this->belongsTo(TipusLocalitzacio::class, "tipus_localitzacions_id");
    }


    public function dadaPersonal() {
        return $this->belongsTo(DadaPersonal::class, "dades_personals_id");
    }

    public function expedient() {
        return $this->belongsTo(Expedient::class, "expedients_id");
    }


}
