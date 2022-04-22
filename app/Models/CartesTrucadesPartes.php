<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CartesTrucadesPartes extends Model
{
    use HasFactory;
    // protected $primaryKey = "id";
    // public $incremneting = false;
    // protected $keyType = "string"
    protected $table = "cartes_trucades_partes";
    public $timestamps = false;

    public function audios() {
        return $this->hasMany(Audios::class, "cartes_trucades_partes_id");
    }
}
