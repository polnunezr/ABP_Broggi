<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CartaController;
use App\Http\Controllers\CartaTrucadaController;
use App\Http\Controllers\ExpedientController;
use App\Http\Controllers\GraficaController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Route::get('/', function () {
//     return view("index");
// });

Route::get('/', function () {
    return view("cartaTrucada.index");
});

Route::resource('cartes_trucades_controller', CartaTrucadaController::class);

Route::resource('carta', CartaController::class);
Route::resource('expedient', ExpedientController::class);
Route::resource('grafica', GraficaController::class);
