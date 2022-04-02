<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Provincia extends Model
{
    use HasFactory;

    protected $table = "provincies";
    // protected $primaryKey = "id";
    // public $incremneting = false;
    // protected $keyType = "string"
    public $timestamps = false;

    public function cartesTrucada() {
        return $this->hasMany(CartaTrucada::class, "provincies_id");
    }

    public function comarques() {
        return $this->hasMany(Comarca::class, "provincies_id");
    }
}
