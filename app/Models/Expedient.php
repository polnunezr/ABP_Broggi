<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Expedient extends Model
{
    use HasFactory;
    protected $table = "expedients";
    // protected $primaryKey = "id";
    // public $incremneting = false;
    // protected $keyType = "string"
    public $timestamps = false;

    public function cartesTrucada(){
        return $this->hasMany(CartaTrucada::class, 'expedients_id');
    }

    public function estatExpedient() {
        return $this->belongsTo(EstatExpedient::class, "estats_expedients_id");
    }
}
