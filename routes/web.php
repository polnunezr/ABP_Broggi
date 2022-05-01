<?php

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CartaController;
use App\Http\Controllers\CartaTrucadaController;
use App\Http\Controllers\ExpedientController;
use App\Http\Controllers\GraficaController;
use App\Http\Controllers\UsuariController;

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

// Ruta para la raíz de la aplicación que nos redirecciona a la ruta llamada 'login':
Route::get('/', function () {
    return redirect()->route('login');
});

// Ruta 'get' que llama el método 'showLogin' del controlador 'UsuariController':
Route::get('/login', [UsuariController::class, 'showLogin'])->name('login');

// Ruta 'post' que llama el método 'login' del controlador 'UsuariController':
Route::post('/login', [UsuariController::class, 'login']);

// Cualquier ruta que pongamos aquí solo se podrá acceder si estamos conectados a la aplicación,
// es decir, solo se podrá acceder si nos hemos logeado:
Route::middleware(['auth'])->group(function () {

    // Ruta 'get' para ir al menú del usuario administrador:
    Route::get('/menu', function () {
        $usuari = Auth::user();

        return view('administrador.menu', compact('usuari'));
    })->name('menu');

    // Ruta 'resource' para el controlador 'ExpedientController':
    Route::resource('expedients_controller', ExpedientController::class);

    // Ruta 'resource' para el controlador 'CartaTrucadaController':
    Route::resource('cartes_trucades_controller', CartaTrucadaController::class);

    Route::resource('carta', CartaController::class);
    // Route::resource('expedient', ExpedientController::class);
    Route::resource('grafica', GraficaController::class);

    // Ruta 'resource' para el controlador 'UsuariController':
    Route::resource('/usuaris_controller', UsuariController::class);

    // Ruta 'get' para el controlador 'UsuariController::class' para salir de la cuenta:
    Route::get('/logout', [UsuariController::class, 'logout'])->name('sortir');
});



/*
//Pau Pol
Route::resource('cartes_trucades_controller', CartaTrucadaController::class);

Route::resource('carta', CartaController::class);
Route::resource('expedient', ExpedientController::class);
Route::resource('grafica', GraficaController::class);
*/
