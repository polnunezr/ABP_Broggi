<?php

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UsuariController;
use App\Http\Controllers\CartaTrucadaController;

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
    return redirect()->route('login');
});

Route::get('/login', [UsuariController::class, 'showLogin'])->name('login');
Route::post('/login', [UsuariController::class, 'login']);

// Route::resource('/login', UsuariController::class);

// Cualquier ruta que pongamos aquí solo se podrá acceder si estamos conectados a la aplicación,
// es decir, solo se podrá acceder si nos hemos logeado:
Route::middleware(['auth'])->group(function () {

    Route::get('/menu', function () {
        $usuari = Auth::user();

        return view('cartaTrucada.index', compact('usuari'));
    });

    // Ruta 'resource' para el controlador 'CartaTrucadaController':
    Route::resource('cartes_trucades', CartaTrucadaController::class);

    // Ruta 'get' para el controlador 'UsuariController::class' para salir de la cuenta:
    // Route::get('/logout', UsuariController::class);
});
