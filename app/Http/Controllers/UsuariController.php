<?php

namespace App\Http\Controllers;

use App\Models\Usuari;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class UsuariController extends Controller
{

    public function showLogin()
    {
        // $user = new Usuari();

        // $user->correu = 'ffernandez@politecnics.barcelona';
        // $user->nom = 'Francisco';
        // $user->cognoms = 'Fernández Fernández';
        // $user->contrasenya = \bcrypt('pepe');
        // $user->actiu = true;
        // $user->rols_id = 1;

        // $user->save();

        return view('auth.login');
    }

    public function login(Request $request)
    {
        $codi = $request->input('codigo');
        $passwd = $request->input('passwd');

        // Recogemos la primera coincidencia con el correo en la base de datos:
        $usuari = Usuari::where('codi', $codi)->first();

        // Si se ha encontrado un usuario y la contraseña coincide con la encriptada de la base de datos:
        if ($usuari !=null && Hash::check($passwd, $usuari->contrassenya)) {
            // Guardamos el usuario en una sesión,
            // y usaremos la clase 'Auth' para acceder a los datos del usuario que gardamos en la sesión
            Auth::login($usuari);
            $response = redirect('/menu');
        }
        else {
            $request->session()->flash('error', 'Usuari o contrasenya incorrectes');
            $response = redirect('/login')->withInput();
        }

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
        //
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
