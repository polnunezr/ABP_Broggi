<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AccidentTipus extends Model
{
    use HasFactory;
    protected $table = 'incidents';
    public $timestamps = false;

    public function accident()
    {
        return $this->hasMany(Accident::class, 'classes_incidents_id');
    }
}