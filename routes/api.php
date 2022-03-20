<?php

use App\Http\Controllers\Api\ProvinciaController;
use App\Http\Controllers\Api\ComarcaController;
use App\Http\Controllers\Api\CartaTrucadaController;
use App\Http\Controllers\Api\TipusIncidentController;
use App\Http\Controllers\Api\TipusLocalitzacioController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::apiResource("tipus_localitzacions", TipusLocalitzacioController::class);

Route::apiResource("tipus_incidents", TipusIncidentController::class);

Route::apiResource("cartes_trucades", CartaTrucadaController::class);

// Route::apiResource("cartes_trucades", CartaTrucadaController::class);

Route::apiResource("provincies", ProvinciaController::class);

Route::apiResource("comarques", ComarcaController::class);
