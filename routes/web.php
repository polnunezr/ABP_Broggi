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

Route::get('/', function () {
    return view("index");
});

Route::resource('cartes_trucades_controller', CartaTrucadaController::class);

<<<<<<< HEAD
        return view('administrador.menu', compact('usuari'));
    });

    // Ruta 'resource' para el controlador 'ExpedientController':
    Route::resource('/expedients', ExpedientController::class);

    // Ruta 'resource' para el controlador 'CartaTrucadaController':
    Route::resource('cartes_trucades_controller', CartaTrucadaController::class);

    Route::resource('carta', CartaController::class);
    Route::resource('expedient', ExpedientController::class);
    Route::resource('grafica', GraficaController::class);

    // Ruta 'resource' para el controlador 'UsuariController':
    Route::resource('/usuaris', UsuariController::class);

    // Ruta 'get' para el controlador 'UsuariController::class' para salir de la cuenta:
    // Route::get('/logout', UsuariController::class);
});
=======
Route::resource('carta', CartaController::class);
Route::resource('expedient', ExpedientController::class);
Route::resource('grafica', GraficaController::class);
>>>>>>> e2baaf3b70cc3d165b4ec3147321dff6cc077d14
