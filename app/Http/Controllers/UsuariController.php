<?php

namespace App\Http\Controllers;

use App\Models\Usuari;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use App\Http\Controllers\ExpedientController;
use App\Http\Controllers\CartaTrucadaController;

class UsuariController extends Controller
{

    public function showLogin()
    {
        return view('auth.login');
    }

    public function login(Request $request)
    {
        // Recogemos el valor del input 'codigo' y del input 'passwd':
        $codi = $request->input('codigo');
        $passwd = $request->input('passwd');

        // Recogemos la primera coincidencia en la base de datos, con el codigo que nos llega:
        $usuari = Usuari::where('codi', $codi)->first();

        // Si se ha encontrado un usuario y la contraseña coincide con la encriptada de la base de datos:
        if ($usuari !=null && Hash::check($passwd, $usuari->contrassenya)) {
            // Al iniciar sesión se guarda el usuario en una sesión, usaremos la clase 'Auth' para acceder a
            // los datos del usuario guardado en la sesión:
            Auth::login($usuari);

            // Si el usuario es 'operador' redireccionaremos al método index del
            // 'CartaTrucadaController' para que se abra la carta de llamada:
            if($usuari->perfils_id == 1)
            {
                $response = redirect()->action([CartaTrucadaController::class, 'index']);
            }
            // Si el usuario es 'supervisor' redireccionaremos al método index del
            // 'ExpedienteController' para que se muestren los expedientes:
            elseif($usuari->perfils_id == 2)
            {
                $response = redirect()->action([ExpedientController::class, 'index']);
            }
            // Si el usuario es 'administrador' redireccionaremos a la ruta /menu'
            // donde se mostrará un menú con todas las acciones que puede realizar un administrador:
            else
            {
                $response = redirect('/menu');
            }
        }
        else
        {
            // Si no se encuentra ningún usuario con el código y contraseña introducidos,
            // devolvemos un error y volvemos a la página de login:
            $request->session()->flash('error', 'Usuari o contrasenya incorrectes!');
            $response = redirect('/login')->withInput();
        }

        // Dependiendo del tipo de usuario devolvemos una respuesta o otra:
        return $response;
    }

    public function logout()
    {
        Auth::logout();
        return redirect('/');
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('administrador.usuaris');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Usuari  $usuari
     * @return \Illuminate\Http\Response
     */
    public function show(Usuari $usuari)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Usuari  $usuari
     * @return \Illuminate\Http\Response
     */
    public function edit(Usuari $usuari)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Usuari  $usuari
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Usuari $usuari)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Usuari  $usuari
     * @return \Illuminate\Http\Response
     */
    public function destroy(Usuari $usuari)
    {
        //
    }
}
