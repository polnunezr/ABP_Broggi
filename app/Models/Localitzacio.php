<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Localitzacio extends Model
{
    use HasFactory;
    protected $table = 'tipus_localitzacions';
    public $timestamps = false;

    /**
     * Get the user that owns the Localitzacio
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function carta()
    {
        return $this->belongsTo(Carta::class, 'tipus_localitzacio_id');
    }
}