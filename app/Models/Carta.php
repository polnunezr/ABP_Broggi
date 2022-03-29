<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Carta extends Model
{
    use HasFactory;
    protected $table = 'cartes_trucades';
    public $timestamps = false;

    /**
     * Get all of the comments for the Carta
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function carta()
    {
        return $this->hasMany(Localitzacio::class, 'tipus_localitzacio_id');
    }
}