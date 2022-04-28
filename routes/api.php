<?php

use App\Http\Controllers\Api\ProvinciaController;
use App\Http\Controllers\Api\ComarcaController;
use App\Http\Controllers\Api\TipusIncidentController;
use App\Http\Controllers\Api\TipusLocalitzacioController;
use App\Http\Controllers\Api\ExpedientController;
use App\Http\Controllers\Api\DadaPersonalController;
use App\Http\Controllers\Api\CartaTrucadaController;
use App\Http\Controllers\Api\CartaTrucadaView;
use App\Http\Controllers\Api\AgenciaController;
use App\Http\Controllers\Api\CartesTrucadesPartesController;
use App\Http\Controllers\Api\UsuariController;
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

Route::apiResource("agencies", AgenciaController::class);

Route::apiResource("cartes_trucades_partes", CartesTrucadesPartesController::class);

Route::apiResource("cartes_trucades_view", CartaTrucadaView::class);

Route::apiResource("cartes_trucades", CartaTrucadaController::class);

Route::apiResource("dades_personals", DadaPersonalController::class);

Route::apiResource("expedients", ExpedientController::class);

Route::apiResource("tipus_localitzacions", TipusLocalitzacioController::class);

Route::apiResource("tipus_incidents", TipusIncidentController::class);

Route::apiResource("provincies", ProvinciaController::class);

Route::apiResource("comarques", ComarcaController::class);

//Sebas

// Ruta API 'resource' para el controlador 'UsuariController':
Route::apiResource('usuaris', UsuariController::class);
