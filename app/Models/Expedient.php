<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Expedient extends Model
{
    use HasFactory;
    protected $table = 'expedients';
    public $timestamps = false;

    public function expedientCarta()
    {
        return $this->hasMany(Carta::class, 'expedients_id');
    }
    public function expedientEstatus()
    {
        return $this->belongsTo(EstatExpedient::class, 'estats_expedients_id');
    }
}