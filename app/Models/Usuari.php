<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Usuari extends Model
{
    use HasFactory;
    protected $table = "usuaris";
    // protected $primaryKey = "id";
    // public $incremneting = false;
    // protected $keyType = "string"
    public $timestamps = false;

    public function cartesTrucada() {
        return $this->hasMany(CartaTrucada::class, "perfils_id");
    }

    public function perfil() {
        return $this->belongsTo(Perfil::class, "perfils_id");
    }

    
}
