<template>
    <div class="container-fluid w-100 h-100 d-flex flex-column justify-content-start">
        <search-component :perfiles="perfiles" @enviarBusqueda="selectUsuariosByParams($event)"></search-component>

        <div v-if="usuariosByParams.length" class="container p-0">
            <div class="card mb-5 rounded" style="background-color: #F2C49B; box-shadow: rgba(0, 0, 0, 0.2) 0px 20px 30px; outline: none; border: none;">
                <div class="card-body">
                    <!-- Creamos una tabla para mostrar los usuarios: -->
                    <table class="container table table-white">
                        <thead>
                            <tr>
                                <th scope="col">Codi</th>
                                <th scope="col">Nom</th>
                                <th scope="col">Cognoms</th>
                                <th scope="col">Actiu</th>
                                <th scope="col">Perfil</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Usamos un for para recorrer el array de cursos que enviamos: -->
                            <tr v-for="usuario in usuariosByParams" :key="usuario.id">
                                <td class="col-2">{{ usuario.codi }}</td>
                                <td class="col-3">{{ usuario.codi }}</td>
                                <td class="col-3">{{ usuario.codi }}</td>
                                <td class="col-1">
                                    <!-- Si un usuario está activo se mostrará una 'checkbox' marcada y si el usuario no está
                                    activo se mostrará una 'checkbox' desmarcada: -->
                                    <div class="form-check">
                                        <input type="checkbox" class="form-check-input" id="usuarioActivo" v-bind:checked="usuario.actiu" disabled>
                                    </div>
                                </td>
                                <!-- Accedemos la método 'perfil()' que hemos creado y a través de él
                                sacamos el nombre del perfil: -->
                                <td class="col-4">{{ usuario.perfil.nom }}</td>
                                <td class="col-2">
                                    <div class="d-flex flex-row justify-content-center align-items-center">
                                        <div class="float-end me-2">
                                            <button type="submit" class="btn btn-secondary d-flex justify-content-center align-items-center flex-row"
                                            @click="editUsuario(usuario)" style="background-color: #636AF2; outline: none; border: none;">
                                                <i class="fas fa-edit"></i>
                                            </button>
                                        </div>

                                        <!-- Botón para abrir el modal de confirmación para borrar: -->
                                        <div class="float-end">
                                            <button type="button" class="btn btn-danger d-flex justify-content-center align-items-center flex-row"
                                            @click="modalDesactivar(usuario)" style="background-color: #D962A3; outline: none; border: none;">
                                                <i class="fas fa-trash"></i>
                                            </button>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>

                    <!-- Para mostrar los botones de la paginación: -->
                    <!-- <div class="mt-4">
                        {{ $cursos->links() }}
                    </div> -->
                </div>
            </div>
        </div>
        <div v-else-if="!usuariosByParams.length && busqueda">
            <div class="card container rounded" style="background-color: #F2C49B; box-shadow: rgba(0, 0, 0, 0.2) 0px 20px 30px; outline: none; border: none;">
                <div class="card-body">
                    <div class="alert alert-light d-flex justify-content-center align-items-center p-4" style="color: white; background-color: #D755D9; outline: none; border: none;" role="alert">
                        No hi ha usuaris per la búsqueda especificada!
                    </div>
                </div>
            </div>
        </div>
        <div v-else-if="!usuariosByParams.length && !busqueda" class="container p-0">
            <!-- Si no se encuentran usuarios con la búsqueda realizada mostraremos una alerta para informar al usuario
            que no hay usuarios que coincidan con las características especificadas, pero si hay usuarios se mostrará
            una tabla con los usuarios:  -->
            <div v-if="!usuarios.length" class="card container rounded" style="background-color: #F2C49B; box-shadow: rgba(0, 0, 0, 0.2) 0px 20px 30px; outline: none; border: none;">
                <div class="card-body">
                    <div class="alert alert-light d-flex justify-content-center align-items-center p-4" style="color: white; background-color: #D755D9; outline: none; border: none;" role="alert">
                        No hi ha usuaris per la búsqueda especificada!
                    </div>
                </div>
            </div>
            <div v-else class="card container mb-5 rounded" style="background-color: #F2C49B; box-shadow: rgba(0, 0, 0, 0.2) 0px 20px 30px; outline: none; border: none;">
                <div class="card-body background-color: #F2C49B;">
                    <!-- Creamos una tabla para mostrar los usuarios: -->
                    <table class="container table table-white">
                        <thead>
                            <tr>
                                <th scope="col">Codi</th>
                                <th scope="col">Nom</th>
                                <th scope="col">Cognoms</th>
                                <th scope="col">Actiu</th>
                                <th scope="col">Perfil</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Usamos un for para recorrer el array de cursos que enviamos: -->
                            <tr v-for="usuario in usuarios" :key="usuario.id">
                                <td class="col-2">{{ usuario.codi }}</td>
                                <td class="col-3">{{ usuario.nom }}</td>
                                <td class="col-3">{{ usuario.cognoms }}</td>
                                <td class="col-1">
                                    <!-- Si un usuario está activo se mostrará una 'checkbox' marcada y si el usuario no está
                                    activo se mostrará una 'checkbox' desmarcada: -->
                                    <div class="form-check">
                                        <input type="checkbox" class="form-check-input" id="usuarioActivo" v-bind:checked="usuario.actiu" disabled>
                                    </div>
                                </td>
                                <!-- Accedemos la método 'perfil()' que hemos creado y a través de él
                                sacamos el nombre del perfil: -->
                                <td class="col-4">{{ usuario.perfil.nom }}</td>
                                <td class="col-2">
                                    <div class="d-flex flex-row justify-content-center align-items-center">
                                        <div class="float-end me-2">
                                            <button type="submit" class="btn btn-secondary d-flex justify-content-center align-items-center flex-row"
                                            @click="editUsuario(usuario)" style="background-color: #636AF2; outline: none; border: none;">
                                                <i class="fas fa-edit"></i>
                                            </button>
                                        </div>

                                        <!-- Botón para abrir el modal de confirmación para borrar: -->
                                        <div class="float-end">
                                            <button v-if="userauthid != usuario.id" type="button" class="btn btn-danger d-flex justify-content-center align-items-center flex-row"

                                            @click="modalDesactivar(usuario)" style="background-color: #D962A3; outline: none; border: none;">
                                                <i class="fas fa-trash"></i>
                                            </button>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>

                    <!-- Para mostrar los botones de la paginación: -->
                    <!-- <div class="mt-4">
                        {{ $cursos->links() }}
                    </div> -->
                </div>
            </div>
        </div>

        <modalIM-component :perfiles="perfiles" :selectUsers="selectUsuarios()"></modalIM-component>

        <!-- Modal de confirmación para desactivar: -->
        <div class="modal fade" id="modalDestroy" tabindex="-1">
            <div class="modal-dialog modal-dialog-centered" style="background-color: transparent; outline: none; border: none;">
                <div class="modal-content" style="background-color: transparent; outline: none; border: none;">
                    <div class="modal-header" style="background-color: #f28787; none; border: none;">
                        <h5 class="modal-title">Desactivar usuari</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body" style="background-color: #F2A0A0; none; border: none;">
                        Estás segur que vols desactivar l'usuari {{ usuario.codi }}?
                    </div>
                    <div class="modal-footer" style="background-color: #f28787; none; border: none;">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"
                        style="outline: none; border: none;">
                            <i class="fa fa-times me-1" aria-hidden="true"></i>
                            Tancar
                        </button>
                        <button class="btn" @click="deleteUsuario()"
                        style="color: white; background-color: #636AF2; outline: none; border: none;">
                            <i class="fas fa-trash me-1"></i>
                            Desactivar
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        props: ['perfiles', 'userauthid'],
        data() {
            return {
                usuarios: [],
                usuariosByParams: [],
                usuario: {
                    id: "",
                    codi: "",
                    contrassenya: "",
                    nom: "",
                    cognoms: "",
                    perfils_id: "",
                    actiu: false,
                    perfil: null
                },
                usuarioD: {
                    id: "",
                    codi: "",
                    contrassenya: "",
                    nom: "",
                    cognoms: "",
                    perfils_id: "",
                    actiu: false,
                    perfil: null
                },
                datosUsuario: {
                    selectPerfil: 0,
                    activoBuscar: false,
                },
                id_perfil: "",
                insert: true,
                busqueda: false
            }
        },
        methods: {
            // Método para seleccionar todos los usuarios:
            selectUsuarios(page) {
                // Cuando nosotros hacemos referencia a las variables que tenemos en el 'data' dentro de nuestro
                // Vue haremos referencia con 'this' pero cuando estamos en el 'axios' es como si estuvieramos en otro sitio
                // y el 'this' no funciona de la misma manera y por eso tenemos que guardarnos el 'this' en una variable:
                let x = this;
                // axios nos va a ayudar a llamar a las APIs:
                axios
                    // Esta es la API que teniamos hecha para llamar a todos los usuarios:
                    .get("/usuaris/" + x.userauthid)
                    .then(response => {
                        x.usuarios = response.data;
                    })
                    .catch(error => {
                        console.log(error)
                    })
                    .finally(() => this.loading = false)
            },
            selectUsuariosByParams(datosUsuario)
            {
                if(!this.busqueda)
                {
                    this.busqueda = true;
                }

                this.datosUsuario.activoBuscar = datosUsuario.activoBuscar;
                this.datosUsuario.selectPerfil = datosUsuario.selectPerfil;

                console.log(datosUsuario)

                this.usuariosByParams = [];

                for(const usuario of this.usuarios)
                {
                    if(this.datosUsuario.selectPerfil == 0)
                    {
                        if(this.datosUsuario.activoBuscar)
                        {
                            if(usuario.actiu)
                            {
                                this.usuariosByParams.push(usuario);
                            }
                        }
                        else
                        {
                            this.usuariosByParams.push(usuario);
                        }
                    }
                    else if(this.datosUsuario.selectPerfil == usuario.perfils_id)
                    {
                        if(this.datosUsuario.activoBuscar == usuario.actiu ||(!this.datosUsuario.activoBuscar && usuario.actiu))
                        {
                            this.usuariosByParams.push(usuario);
                        }
                        else
                        {
                            this.usuariosByParams = [];
                        }
                    }
                }
            },
            // Método para mostrar el modal al pulsar el botón de abrir el modal, también recibimos el usuario que
            // se quiere borrar y lo guardamos:
            modalDesactivar(usuario) {
                this.usuario = usuario;

                if(this.usuario.actiu)
                {
                    $('#modalDestroy').modal('show')
                }
                else
                {
                    alert("Este usuario ya está desactivado!");
                }
            },
            // Método para desactivar un usuario:
            deleteUsuario()
            {
                this.usuario.actiu = false;

                // Cuando nosotros hacemos referencia a las variables que tenemos en el 'data' dentro de nuestro
                // Vue haremos referencia con 'this' pero cuando estamos en el 'axios' es como si estuvieramos en otro sitio
                // y el 'this' no funciona de la misma manera y por eso tenemos que guardarnos el 'this' en una variable:
                let x = this;
                // axios nos va a ayudar a llamar a las APIs:
                axios
                    // Esta es la API que teniamos hecha para modificar un usuario específico según el 'id' que enviemos y
                    // el usuario:
                    .put("/usuaris/" + x.usuario.id, x.usuario)
                    .then(function(response) {
                        console.log(response);
                        alert("Usuari desactivat!");
                        x.selectUsuarios();
                        $('#modalDestroy').modal('hide');
                    })
                    .catch(function(error) {
                        console.log(error.response.status);
                        console.log(error.response.data);
                        alert("Error al desactivar l'usuari!");
                        $('#modalDestroy').modal('hide');
                    })
            },

            editUsuario(usuarioEdit) {
                this.$eventUsuari.$emit("editar-usuario",usuarioEdit);
            }
        },
        // Al crearse recogemos todos los usuarios para mostrarlos en la tabla:
        created() {
            this.selectUsuarios();
        },
        // Para detectar cualquier cambio:
        watch: {
            // Si la select se modifica cambiaremos 'perfils_id' con el valor de la opción seleccionada
            // y tabién con ese valor buscaremos el perfil para guardarlo en 'perfil':
            id_perfil: function(val)
            {
                this.usuario.perfil = this.perfiles.find(cb => cb.id == val);
                this.usuario.perfils_id = val;
            },
            idPerfilBuscar: function(val)
            {
                this.idPerfil = val;
            }
        },
        mounted() {
        }
    }
</script>
