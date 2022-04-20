<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CartesTrucadesHasAgencies extends Model
{
    use HasFactory;
    protected $table = "cartes_trucades_has_agencies";
    protected $primaryKey = ["cartes_trucades_id","agencies_id"];
    public $incrementing = false;
    //public $incremneting = false;
    // protected $keyType = "string"
    public $timestamps = false;


    public function agencia()
    {
        return $this->belongsTo(Agencia::class,"agencies_id");
    }

    public function cartaTrucada()
    {
        return $this->belongsTo(CartaTrucada::class,"cartes_trucades_id");
    }

    public function estatAgencia()
    {
        return $this->belongsTo(EstatAgencia::class,"estats_agencies_id");
    }


}
