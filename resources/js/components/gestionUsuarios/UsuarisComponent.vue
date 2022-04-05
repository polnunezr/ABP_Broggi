<template>
    <div class="container-fluid w-100 h-100 d-flex flex-column justify-content-start">
        <div class="card container mt-5 mb-5 w-100 rounded" style="background-color: #F2A0A0; box-shadow: rgba(0, 0, 0, 0.2) 0px 20px 30px; outline: none; border: none;">
            <div class="card-body">
                <h5 class="card-title mb-4">Cerca per filtres</h5>
                <form>
                    <div class="d-flex flex-row justify-content-between align-items-center w-100">
                        <div class="col-1 d-flex justify-content-start align-items-center">
                            <label class="form-check-label" for="selectPerfil">Perfil</label>
                        </div>
                        <div class="col-8 d-flex justify-content-start align-items-center">
                            <select id="selectPerfil" class="form-select" name="selectPerfil"
                            @change="updateForm('selectPerfil', $event.target.value)">
                                <option value="0" :selected="datosUsuario.selectPerfil === 0">Tots els perfils</option>
                                <option v-for="perfilBuscar in perfiles" :key="perfilBuscar.id" :value="perfilBuscar.id" :selected="datosUsuario.selectPerfil == perfilBuscar.id">
                                    {{  perfilBuscar.nom  }}
                                </option>
                            </select>
                        </div>
                        <div class="col-2 d-flex justify-content-center align-items-center">
                            <input type="checkbox" class="form-check-input float-end m-2 p-0" id="activoBuscar" name="activoBuscar" :checked="datosUsuario.activoBuscar"
                            @change="updateForm('activoBuscar', $event.target.checked)">
                            <label class="form-check-label" for="activoBuscar">Actiu</label>
                        </div>

                        <div class="col-1 d-flex justify-content-center align-items-center float-end">
                            <button type="submit" class="btn btn-secondary" @click="selectUsuariosByParams()"
                            style="background-color: #636AF2; outline: none; border: none;">
                                <i class="fa fa-search" aria-hidden="true"></i>
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>

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
                                            @click="modalDeleteUsuario(usuario)" style="background-color: #D962A3; outline: none; border: none;">
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
        <div v-else-if="!usuariosByParams.length && filtros">
            <div class="card container rounded" style="background-color: #F2C49B; box-shadow: rgba(0, 0, 0, 0.2) 0px 20px 30px; outline: none; border: none;">
                <div class="card-body">
                    <div class="alert alert-light d-flex justify-content-center align-items-center p-4" style="color: white; background-color: #D755D9; outline: none; border: none;" role="alert">
                        No hi ha usuaris per la búsqueda especificada!
                    </div>
                </div>
            </div>
        </div>
        <div v-else-if="!usuariosByParams.length && !filtros" class="container p-0">
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
                                            <button type="button" class="btn btn-danger d-flex justify-content-center align-items-center flex-row"
                                            @click="modalDeleteUsuario(usuario)" style="background-color: #D962A3; outline: none; border: none;">
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

        <!-- Botón para abrir el modal de insertar/modificar: -->
        <button class="plus2 btn btn-primary position-absolute end-0 bottom-0 m-5" @click="createUsuario()"
        style="background-color: #636AF2; box-shadow: rgba(0, 0, 0, 0.2) 0px 20px 30px; outline: none; border: none;">
            <i class="fa fa-plus-circle me-1" aria-hidden="true"></i>
            Crear Usuari
        </button>

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

        <!-- Modal para insertar/modificar: -->
        <div class="modal fade" id="modalIM" tabindex="-1">
            <div class="modal-dialog modal-xl modal-dialog-centered" style="background-color: transparent; outline: none; border: none;">
                <div class="modal-content" style="background-color: transparent; outline: none; border: none;">
                    <div class="modal-header" style="background-color: #f28787; outline: none; border: none;">
                        <h5 class="modal-title">Usuari</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body" style="background-color: #F2A0A0; outline: none; border: none;">
                        <form>
                            <div class="form-group row mt-3 mb-3">
                                <label for="codi" class="col-sm-1 col-form-label">Codi</label>
                                <div class="col-sm-11">
                                    <input type="text" class="form-control" id="codi" name="codi" autofocus required
                                    v-model="usuario.codi">
                                </div>
                            </div>
                            <div v-show="insert" class="form-group row mt-3 mb-3">
                                <label for="contrassenya" class="col-sm-1 col-form-label">Contrassenya</label>
                                <div class="col-sm-11">
                                    <input type="text" class="form-control" id="contrassenya" name="contrassenya" v-model="usuario.contrassenya">
                                </div>
                            </div>
                            <div class="form-group row mt-3 mb-3">
                                <label for="nom" class="col-sm-1 col-form-label">Nom</label>
                                <div class="col-sm-11">
                                    <input type="text" class="form-control" id="nom" name="nom" v-model="usuario.nom">
                                </div>
                            </div>
                            <div class="form-group row mt-3 mb-3">
                                <label for="cognoms" class="col-sm-1 col-form-label">Cognoms</label>
                                <div class="col-sm-11">
                                    <input type="text" class="form-control" id="cognoms" name="cognoms" v-model="usuario.cognoms">
                                </div>
                            </div>
                            <div class="form-group row mt-3 mb-3">
                                <label for="perfil" class="col-sm-1 col-form-label">Perfil</label>
                                <div class="col-sm-11">
                                    <select id="perfil" class="form-select" name="perfil" v-model="id_perfil">
                                        <option v-for="perfil in perfiles" :key="perfil.id" :value="perfil.id">
                                            {{  perfil.nom  }}
                                        </option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group row mt-3 mb-3">
                                <label class="col-sm-1 col-form-label" for="activoInsertar">Activo</label>
                                <div class="col-sm-11 d-flex align-items-center">
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="form-check-input" id="activoInsertar" name="activoInsertar" v-model="usuario.actiu">
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer" style="background-color: #f28787; outline: none; border: none;">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                            <i class="fa fa-times me-1" aria-hidden="true"></i>
                            Tancar
                        </button>
                        <button v-if="insert" type="submit" class="btn btn-danger" @click="insertUsuario()"
                        style="background-color: #636AF2; outline: none; border: none;">
                            <i class="fa fa-check" aria-hidden="true"></i>
                            Afegir
                        </button>
                        <button v-else type="submit" class="btn btn-danger" @click="updateUsuario()"
                        style="background-color: #636AF2; outline: none; border: none;">
                            <i class="fa fa-check" aria-hidden="true"></i>
                            Modificar
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        props: ['perfiles'],
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
                datosUsuario: {
                    selectPerfil: 0,
                    activoBuscar: false,
                },
                id_perfil: "",
                insert: true,
                filtros: false
            }
        },
        methods: {
            // Método para seleccionar todos los usuarios:
            selectUsuarios() {
                // Cuando nosotros hacemos referencia a las variables que tenemos en el 'data' dentro de nuestro
                // Vue haremos referencia con 'this' pero cuando estamos en el 'axios' es como si estuvieramos en otro sitio
                // y el 'this' no funciona de la misma manera y por eso tenemos que guardarnos el 'this' en una variable:
                let x = this;
                // axios nos va a ayudar a llamar a las APIs:
                axios
                    // Esta es la API que teniamos hecha para llamar a todos los usuarios:
                    .get("/usuaris")
                    .then(response => {
                        x.usuarios = response.data;
                    })
                    .catch(error => {
                        console.log(error)
                    })
                    .finally(() => this.loading = false)
            },
            // Método para mostrar el modal al pulsar el botón de abrir el modal, también recibimos el usuario que
            // se quiere borrar y lo guardamos:
            modalDeleteUsuario(usuario) {
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
            // Método para mostrar el modal para insertar o modificar un curso:
            createUsuario()
            {
                this.insert = true;
                $('#modalIM').modal('show')
            },
            // Método para insertar un usuario:
            insertUsuario()
            {
                // Controlamos que no se deje ningún input vacío:
                if (this.usuario.codi == "" || this.usuario.contrassenya == ""
                || this.usuario.nom == "" || this.usuario.cognoms == "" || this.usuario.perfils_id == "")
                {
                    alert("Please complete all fields!");
                }
                else
                {
                    // Cuando nosotros hacemos referencia a las variables que tenemos en el 'data' dentro de nuestro
                    // Vue haremos referencia con 'this' pero cuando estamos en el 'axios' es como si estuvieramos en otro sitio
                    // y el 'this' no funciona de la misma manera y por eso tenemos que guardarnos el 'this' en una variable:
                    let x = this;

                    // axios nos va a ayudar a llamar a las APIs:
                    axios
                        // Esta es la API que teniamos hecha para insertar un usuario, enviando el usuario que queremos insertar:
                        .post("/usuaris", x.usuario)
                        .then(function(response) {
                            console.log(response);
                            alert("Usuari insertat!");
                            x.selectUsuarios();
                            $('#modalIM').modal('hide');

                            this.usuario.id = ""
                            this.usuario.codi = "";
                            this.usuario.contrassenya = "";
                            this.usuario.nom = "";
                            this.usuario.cognoms = "";
                            this.usuario.perfils_id = "";
                            this.usuario.actiu = false;
                            this.usuario.perfil = null;
                        })
                        .catch(function(error) {
                            console.log(error.response.status);
                            console.log(error.response.data);
                            alert("Error al insertar l'usuari!");
                            $('#modalIM').modal('hide');

                            // this.usuario.id = ""
                            // this.usuario.codi = "";
                            // this.usuario.contrassenya = "";
                            // this.usuario.nom = "";
                            // this.usuario.cognoms = "";
                            // this.usuario.perfils_id = "";
                            // this.usuario.actiu = false;
                            // this.usuario.perfil = null;
                        })
                }
            },
            // Método para mostrar el modal para insertar o modificar un usuario, también recibimos el usuario que
            // se quiere modificar y lo guardamos:
            editUsuario(usuario)
            {
                this.insert = false;
                this.usuario = usuario;
                this.id_perfil = usuario.perfils_id;
                $('#modalIM').modal('show')
            },
            // Método para modificar un usuario:
            updateUsuario()
            {
                // Controlamos que no se deje ningún input vacío:
                if (this.usuario.codi == "" || this.usuario.nom == ""
                || this.usuario.cognoms == "" || this.usuario.perfils_id == "")
                {
                    alert("Please complete all fields!");
                }
                else
                {
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
                            alert("Usuari modificat!");
                            x.selectUsuarios();
                            $('#modalIM').modal('hide');
                        })
                        .catch(function(error) {
                            console.log(error.response.status);
                            console.log(error.response.data);
                            alert("Error al modificar l'usuari!");
                            $('#modalIM').modal('hide');
                        })
                }
            },
            selectUsuariosByParams()
            {
                this.usuariosByParams = [];

                this.usuarios.forEach(usuario => {
                    if(this.datosUsuario.selectPerfil == 0)
                    {
                        if(this.datosUsuario.activoBuscar)
                        {
                            if(usuario.actiu)
                            {
                                this.usuariosByParams.push(usuario);
                                this.filtros = true;
                            }
                        }
                        else
                        {
                            this.usuariosByParams = [];
                            this.filtros = false;
                        }
                    }
                    else if(this.datosUsuario.selectPerfil == usuario.perfils_id)
                    {
                        if(this.datosUsuario.activoBuscar == usuario.actiu ||(!this.datosUsuario.activoBuscar && usuario.actiu))
                        {
                            this.usuariosByParams.push(usuario);
                            this.filtros = true;
                        }
                        else
                        {
                            this.usuariosByParams = [];
                            this.filtros = true;
                        }

                        // if(this.datosUsuario.activoBuscar)
                        // {
                        //     if(usuario.actiu && usuario.perfils_id == this.datosUsuario.selectPerfil)
                        //     {
                        //         this.usuariosByParams.push(usuario);
                        //         this.filtros = true;
                        //     }
                        //     else
                        //     {
                        //         this.usuariosByParams = [];
                        //         this.filtros = true;
                        //     }
                        // }
                        // else
                        // {
                        //     if(usuario.perfils_id == this.datosUsuario.selectPerfil)
                        //     {
                        //         this.usuariosByParams.push(usuario);
                        //         this.filtros = true;
                        //     }
                        // }
                    }
                });

                localStorage.setItem("users", JSON.stringify(this.usuariosByParams));
                localStorage.setItem("filtros", JSON.stringify(this.filtros));

                // for (const usuario of this.usuarios)
                // {
                //     if(this.datosUsuario.selectPerfil == 0)
                //     {
                //         if(this.datosUsuario.activoBuscar)
                //         {
                //             if(usuario.actiu)
                //             {
                //                 this.usuariosByParams.push(usuario);
                //                 this.filtros = true;
                //             }
                //         }
                //         else
                //         {
                //             this.usuariosByParams = [];
                //             this.filtros = false;
                //         }
                //     }
                //     else
                //     {
                //         if(this.datosUsuario.activoBuscar)
                //         {
                //             if(usuario.actiu && usuario.perfils_id == this.datosUsuario.selectPerfil)
                //             {
                //                 this.usuariosByParams.push(usuario);
                //                 this.filtros = true;
                //             }
                //             else
                //             {
                //                 this.usuariosByParams = [];
                //                 this.filtros = true;
                //             }
                //         }
                //         else
                //         {
                //             if(usuario.perfils_id == this.datosUsuario.selectPerfil)
                //             {
                //                 this.usuariosByParams.push(usuario);
                //                 this.filtros = true;
                //             }
                //         }
                //     }

                //     localStorage.setItem("users", JSON.stringify(this.usuariosByParams));
                //     localStorage.setItem("filtros", JSON.stringify(this.filtros));
                // }
            },
            openStorage ()
            {
                return JSON.parse(localStorage.getItem('datosUsuario'))
            },
            saveStorage (datosUsuario)
            {
                localStorage.setItem('datosUsuario', JSON.stringify(datosUsuario))
            },
            updateForm (input, value)
            {
                this.datosUsuario[input] = value

                let storedForm = this.openStorage() // extract stored form
                if (!storedForm) storedForm = {} // if none exists, default to empty object

                storedForm[input] = value // store new value
                this.saveStorage(storedForm) // save changes into localStorage
            }
        },
        components: {

        },
        // Al crearse recogemos todos los usuarios para mostrarlos en la tabla:
        created() {
            this.selectUsuarios();

            const storedForm = this.openStorage();
            if (storedForm) {
                this.datosUsuario = {
                    ...this.datosUsuario,
                    ...storedForm
                }
            }

            const users = localStorage.getItem("users");
            if(users)
            {
                this.usuariosByParams = JSON.parse(users);
            }

            const filtros = localStorage.getItem("filtros");
            if(filtros)
            {
                this.filtros = JSON.parse(filtros);
            }
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
