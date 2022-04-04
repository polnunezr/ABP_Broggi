<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class EstatExpedient extends Model
{
    protected $table = 'estats_expedients';
    public $timestamps = false;
    use HasFactory;

    public function expedientEstatus()
    {
        return $this->hasMany(Expedient::class, 'estats_expedients_id');
    }
}