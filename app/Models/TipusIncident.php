<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TipusIncident extends Model
{
    use HasFactory;

    protected $table = "tipus_incidents";
    // protected $primaryKey = "id";
    // public $incremneting = false;
    // protected $keyType = "string"
    public $timestamps = false;

    public function incidents() {
        return $this->hasMany(Incident::class, "classes_incidents_id");
    }
}
