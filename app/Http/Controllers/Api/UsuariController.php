<?php

namespace App\Http\Controllers\Api;

use App\Models\Usuari;
use App\Clases\Utilitat;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use App\Http\Resources\UsuariResource;
use Illuminate\Database\QueryException;

class UsuariController extends Controller
{
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
    // public function show(Usuari $usuario)
    // {
    //     // Permite poder mostrar solamente un usuario introduciendo al final
    //     // de la URL el 'id' del usuario:
    //     return new UsuariResource($usuario);
    // }

    public function show($usuarioId)
    {
        // Recogemos todos los usuarios de la base de datos menos el
        // usuario con el que hemos iniciado sesión:
        $usuarios = Usuari::where("id", "!=", $usuarioId)->get();

        // Devolvemos un json con los cursos:
        return UsuariResource::collection($usuarios);
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
