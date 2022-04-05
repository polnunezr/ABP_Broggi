<?php

namespace App\Http\Controllers\Api;

use App\Models\Usuari;
use App\Clases\Utilitat;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Resources\UsuariResource;
use Illuminate\Database\QueryException;

class UsuariController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        // $activo = ($request->input('activoBuscar') == 1);
        // $selectPerfil = $request->input('selectPerfil');

        // // Si la select tiene como opción 'Tots els usuaris':
        // if($selectPerfil == 0)
        // {
        //     // Si se marca la checkbox:
        //     if($activo)
        //     {
        //         // Buscaremos todos los cursos activos:
        //         $usuarios = Usuari::where('actiu', '=', true)
        //                         ->orderBy('nom', 'asc')
        //                         ->paginate(6)
        //                         ->withQueryString();
        //     }
        //     // Si no se marca la checkbox:
        //     else
        //     {
        //         // Buscaremos todos los cursos:
        //         $usuarios = Usuari::orderBy('nom', 'asc')
        //                         ->paginate(6);
        //     }
        // }
        // // Si en la 'select' se elige un ciclo:
        // else
        // {
        //     // Si se marca la checkbox:
        //     if($activo)
        //     {
        //         // Buscaremos todos los cursos del ciclo seleccionado
        //         // que sean activos:
        //         $usuarios = Usuari::where('actiu', '=', true)
        //                         ->where('perfils_id', $selectPerfil)
        //                         ->orderBy('nom', 'asc')
        //                         ->paginate(6)
        //                         ->withQueryString();
        //     }
        //     // Si no se marca la checkbox:
        //     else
        //     {
        //         // Buscaremos todos los cursos del ciclo seleccionado:
        //         $usuarios = Usuari::where('perfils_id', $selectPerfil)
        //                         ->orderBy('nom', 'asc')
        //                         ->paginate(6)
        //                         ->withQueryString();
        //     }
        // }

        // // Recogemos todos los cursos de la base de datos:
        $usuarios = Usuari::all();

        // $request->flashInput('selectPerfil');

        // Devolvemos un json con los cursos:
        return UsuariResource::collection($usuarios);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // Creamos un nuevo curso:
        $usuario = new Usuari();

        // Recogemos los valores que introducimos en el POSTMAN
        // (IMPORTANTE SIEMPRE PONER BIEN LOS NOMBRE DE LOS INPUTS):
        $usuario->codi = $request->input('codi');
        $usuario->contrassenya = \bcrypt($request->input('contrassenya'));
        $usuario->nom = $request->input('nom');
        $usuario->cognoms = $request->input('cognoms');
        $usuario->perfils_id = $request->input('perfils_id');
        $usuario->actiu = ($request->input('actiu') == 1);

        // Probamos de guardar la modificación al usuario que nos ha llegado
        // y si nos sale bien el POSTMAN nos devolverá el usuario modificado
        // y el estado 201, en caso de que no salga bien el POSTMAN nos
        // devolverá el error:
        try
        {
            $usuario->save();
            $response = (new UsuariResource($usuario))
                        ->response()
                        ->setStatusCode(201);
        }
        catch(QueryException $ex)
        {
            $mensaje = Utilitat::errorMessage($ex);
            $response = \response()
                        ->json(['error' => $mensaje], 400);

        }

        // Devolvemos el mensaje o error que nos mostrará el POSTMAN:
        return $response;
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Usuari $usuario)
    {
        // Permite poder mostrar solamente un usuario introduciendo al final
        // de la URL el 'id' del usuario:
        return new UsuariResource($usuario);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $usuarioModificar = Usuari::find($id);

        // Recogemos los valores que introducimos en el POSTMAN
        // (IMPORTANTE SIEMPRE PONER BIEN LOS NOMBRE DE LOS INPUTS):
        $usuarioModificar->codi = $request->input('codi');
        $usuarioModificar->nom = $request->input('nom');
        $usuarioModificar->cognoms = $request->input('cognoms');
        $usuarioModificar->perfils_id = $request->input('perfils_id');
        $usuarioModificar->actiu = ($request->input('actiu') == 1);

        // Probamos de guardar la modificación al usuario que nos ha llegado
        // y si nos sale bien el POSTMAN nos devolverá el usuario modificado
        // y el estado 201, en caso de que no salga bien el POSTMAN nos
        // devolverá el error:
        try
        {
            $usuarioModificar->save();
            $response = (new UsuariResource($usuarioModificar))
                        ->response()
                        ->setStatusCode(201);
        }
        catch(QueryException $ex)
        {
            $mensaje = Utilitat::errorMessage($ex);
            $response = \response()
                        ->json(['error' => $mensaje], 400);

        }

        // Devolvemos el mensaje o error que nos mostrará el POSTMAN:
        return $response;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Usuari $usuario)
    {
        //
    }
}
