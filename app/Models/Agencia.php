<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Prophecy\Call\Call;

class Agencia extends Model
{
    use HasFactory;

    protected $table = "agencies";
    // protected $primaryKey = "id";
    // public $incremneting = false;
    // protected $keyType = "string"
    public $timestamps = false;

    public function municipi() {
        return $this->belongsTo(Municipi::class, "municipis_id");
    }


    public function cartes_trucades_has_agencies()
    {
        return $this->hasMany(CartesTrucadesHasAgencies::class, 'agencies_id');
    }
}
