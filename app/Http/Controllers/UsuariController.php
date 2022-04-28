<?php

namespace App\Http\Controllers;

use App\Models\Perfil;
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
        // Creamos un nuevo curso:
        /*
        $usuario = new Usuari();

        // Recogemos los valores que introducimos en el POSTMAN
        // (IMPORTANTE SIEMPRE PONER BIEN LOS NOMBRE DE LOS INPUTS):
        $usuario->codi = 'admin';
        $usuario->contrassenya = \bcrypt('admin');
        $usuario->nom = 's';
        $usuario->cognoms = 's';
        $usuario->perfils_id = 3;
        $usuario->actiu = true;

        $usuario->save();
        */

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
        if ($usuari !=null && Hash::check($passwd, $usuari->contrassenya) && $usuari->actiu)
        {
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
                $response = redirect('/menu');
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
    public function index(Request $request)
    {
        // Recogemos del formulario de búsqueda el checkbox 'activo'
        // y la opción de la 'select':
        // $activo = $request->input('activoBuscar');
        // $selectPerfil = $request->input('selectPerfil');

        // if($activo != null || $selectPerfil != null)
        // {
        //     // Si la select tiene como opción 'Tots els usuaris':
        //     if($selectPerfil == 0)
        //     {
        //         // Si se marca la checkbox:
        //         if($activo == "activo")
        //         {
        //             // Buscaremos todos los cursos activos:
        //             $usuarios = Usuari::where('actiu', '=', true)
        //                             ->orderBy('nom', 'asc')
        //                             ->paginate(6)
        //                             ->withQueryString();
        //         }
        //         // Si no se marca la checkbox:
        //         else
        //         {
        //             // Buscaremos todos los cursos:
        //             $usuarios = Usuari::orderBy('nom', 'asc')
        //                             ->paginate(6);
        //         }
        //     }
        //     // Si en la 'select' se elige un ciclo:
        //     else
        //     {
        //         // Si se marca la checkbox:
        //         if($activo == "activo")
        //         {
        //             // Buscaremos todos los cursos del ciclo seleccionado
        //             // que sean activos:
        //             $usuarios = Usuari::where('actiu', '=', true)
        //                             ->where('perfils_id', $selectPerfil)
        //                             ->orderBy('nom', 'asc')
        //                             ->paginate(6)
        //                             ->withQueryString();
        //         }
        //         // Si no se marca la checkbox:
        //         else
        //         {
        //             // Buscaremos todos los cursos del ciclo seleccionado:
        //             $usuarios = Usuari::where('perfils_id', $selectPerfil)
        //                             ->orderBy('nom', 'asc')
        //                             ->paginate(6)
        //                             ->withQueryString();
        //         }
        //     }

        //     $response = view('administrador.usuaris_vue', compact('perfiles', 'usuarios'));
        // }
        // else
        // {
        //     $response = view('administrador.usuaris_vue', compact('perfiles'), );
        // }

        // Buscamos todos los perfiles para añadirlos como opciones
        // en la 'select' del formulario de búsqueda:
        $perfiles = Perfil::orderBy('nom', 'asc')
        ->get();

        $user = Auth::user();

        $userAuthId = $user->id;

        // Para que al usar el buscador los valores que introducimos o seleccionamos se queden
        // en el input:
        $request->flash();

        return view('administrador.usuaris_vue', compact('perfiles', 'userAuthId'));
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
