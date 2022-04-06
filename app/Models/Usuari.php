<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Auth\User as Authenticatable;

class Usuari extends Authenticatable
{
    use HasFactory;

    // Indicamos a qué tabla de la Base de Datos corresponde el modelo:
    protected $table = "usuaris";

    // Indicamos la clave primaria (Esta línea la podriamos comentar porque Eloquent, por defecto, coge como clave
    // primaria un campo que se llame 'id', solo deberiamos poner la siguiente línea si la clave primaria no se llama 'id'):
    // protected $primaryKey = "id";

    // Indicamos que la clave primaria es 'auto_increment' (Por defecto ya es true y como nuestra clave primaria es
    // 'auto_increment', esta línea la podriamos comentar):
    // public $incrementing = false;

    // Eloquent da por supuesto que las tablas tendrán las columnas 'created_at' y 'updated_at', como nosotros no hemos
    // puesto estas columnas tenemos que poner la siguiente línea:
    public $timestamps = false;

    // Relación 1:N con cartes_trucades:
    public function cartesTrucada() {
        return $this->hasMany(CartaTrucada::class, "perfils_id");
    }

    // Relación 1:N con perfils:
    public function perfil() {
        return $this->belongsTo(Perfil::class, "perfils_id");
    }
}
