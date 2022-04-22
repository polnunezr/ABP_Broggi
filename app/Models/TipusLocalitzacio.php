<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TipusLocalitzacio extends Model
{
    use HasFactory;

    protected $table = "tipus_localitzacions";
    // protected $primaryKey = "id";
    // public $incremneting = false;
    // protected $keyType = "string"
    public $timestamps = false;


    public function cartesTrucada()
    {
        return $this->hasMany(CartaTrucada::class, "tipus_localitzacions_id");
    }
}
