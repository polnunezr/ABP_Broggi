<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class EstatAgencia extends Model
{
    use HasFactory;
    protected $table = "estats_agencies";
    // protected $primaryKey = "id";
    // public $incremneting = false;
    // protected $keyType = "string"
    public $timestamps = false;


    public function cartes_trucades_has_agencies()
    {
        return $this->belongsTo(CartesTrucadesHasAgencies::class, 'estats_agencies_id');

    }


}
