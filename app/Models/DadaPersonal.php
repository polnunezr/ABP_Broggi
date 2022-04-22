<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DadaPersonal extends Model
{
    use HasFactory;

    protected $table = "dades_personals";
    // protected $primaryKey = "id";
    // public $incremneting = false;
    // protected $keyType = "string"
    public $timestamps = false;

    public function cartesTrucada()
    {
        return $this->hasMany(CartaTrucada::class, "dades_personals_id");
    }


}
