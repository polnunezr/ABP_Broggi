<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Accident extends Model
{
    use HasFactory;
    protected $table = 'tipus_incidents';
    public $timestamps = false;
    public function accident()
    {
        return $this->belongsTo(AccidentTipus::class, 'classes_incidents_id');
    }
}