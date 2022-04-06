<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Audios extends Model
{
    use HasFactory;
    // protected $primaryKey = "id";
    // public $incremneting = false;
    // protected $keyType = "string"
    protected $table = "audios";
    public $timestamps = false;

    public function provincia() {
        return $this->belongsTo(CartesTrucadesPartes::class, "cartes_trucades_partes_id");
    }
}
