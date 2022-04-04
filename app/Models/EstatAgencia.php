<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class EstatAgencia extends Model
{
    use HasFactory;
    public function estatAgencia()
    {
        return $this->belongsTo(EstatAgencia::class, "estats_agencies_id");
    }
}