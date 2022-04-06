<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Incident extends Model
{
    protected $table = "incidents";
    // protected $primaryKey = "id";
    // public $incremneting = false;
    // protected $keyType = "string"
    public $timestamps = false;

    public function cartesTrucada() {
        return $this->hasMany(CartaTrucada::class, "incidents_id");
    }

    public function tipusIncident() {
        return $this->belongsTo(TipusIncident::class, "incidents_id");
    }

}
