<template>
    <!-- Componente padre: -->
    <div>
        <!-- Botón para abrir el modal de insertar/modificar: -->
        <button class="plus2 btn btn-primary position-fixed end-0 bottom-0 m-3" @click="createUsuario()"
        style="background-color: #636AF2; box-shadow: rgba(0, 0, 0, 0.2) 0px 20px 30px; outline: none; border: none; box-shadow: none;">
            <i class="fa fa-plus-circle me-1" aria-hidden="true"></i>
            Crear Usuari
        </button>

        <!-- Modal para insertar/modificar un usuario: -->
        <div class="modal fade" id="modalIM" tabindex="-1">
            <div class="modal-dialog modal-xl modal-dialog-centered" style="background-color: transparent; outline: none; border: none;">
                <div class="modal-content" style="background-color: transparent; outline: none; border: none;">
                    <div class="modal-header" style="background-color: #f28787; outline: none; border: none;">
                        <h5 class="modal-title">Usuari</h5>
                    </div>
                    <div class="modal-body" style="background-color: #F2A0A0; outline: none; border: none;">
                        <!-- Input para el código: -->
                        <div class="form-group row mt-3 mb-3">
                            <label for="codi" class="col-sm-2 col-form-label">Codi</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="codi" name="codi" autofocus required
                                :value="usuario.codi" @change="changeCodi($event)" style="box-shadow: none;">
                            </div>
                        </div>
                        <!-- Input para la contrasenya que solo se muestra si el modal es para insertar: -->
                        <div v-show="insert" class="form-group row mt-3 mb-3">
                            <label for="contrassenya" class="col-sm-2 col-form-label">Contrassenya</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="contrassenya" name="contrassenya" :value="usuario.contrassenya"
                                @change="changeContrassenya($event)" style="box-shadow: none;">
                            </div>
                        </div>
                        <!-- Input para el nombre: -->
                        <div class="form-group row mt-3 mb-3">
                            <label for="nom" class="col-sm-2 col-form-label">Nom</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="nom" name="nom" :value="usuario.nom"
                                @change="changeNom($event)" style="box-shadow: none;">
                            </div>
                        </div>
                        <!-- Input para el apellido: -->
                        <div class="form-group row mt-3 mb-3">
                            <label for="cognoms" class="col-sm-2 col-form-label">Cognoms</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="cognoms" name="cognoms" :value="usuario.cognoms"
                                @change="changeCognoms($event)" style="box-shadow: none;">
                            </div>
                        </div>
                        <!-- Input para el perfil del usuario: -->
                        <div class="form-group row mt-3 mb-3">
                            <label for="perfil" class="col-sm-2 col-form-label">Perfil</label>
                            <div class="col-sm-10">
                                <select id="perfil" class="form-select" name="perfil" @change="changePerfil($event)" :value="usuario.perfils_id" style="box-shadow: none;">
                                    <option v-for="perfil in perfiles" :key="perfil.id" :value="perfil.id">
                                        {{  perfil.nom  }}
                                    </option>
                                </select>
                            </div>
                        </div>
                        <!-- Input para 'actiu': -->
                        <div class="form-group row mt-3 mb-3">
                            <label class="col-sm-2 col-form-label" for="activoInsertar">Activo</label>
                            <div class="col-sm-10 d-flex align-items-center">
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="form-check-input" id="activoInsertar" name="activoInsertar"
                                    :value="usuario.actiu" @change="changeActiu()" :checked="usuario.actiu" style="box-shadow: none;">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer" style="background-color: #f28787; outline: none; border: none;">
                        <!-- Botón para cerrar el modal: -->
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" @click="refreshUsuarios" style="box-shadow: none;">
                            <i class="fa fa-times me-1" aria-hidden="true"></i>
                            Tancar
                        </button>
                        <!-- Si este modal se abre para insertar mostraremos este botón: -->
                        <button v-if="insert" type="button" class="btn btn-danger" @click="insertUsuario"
                        style="background-color: #636AF2; outline: none; border: none; box-shadow: none;">
                            <i class="fa fa-check" aria-hidden="true"></i>
                            Afegir
                        </button>
                        <!-- Si este modal se abre para modificar mostraremos este botón: -->
                        <button v-else type="button" class="btn btn-danger" @click="updateUsuario"
                        style="background-color: #636AF2; outline: none; border: none; box-shadow: none;">
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
        // Declaramos 'props' que recibimos del componente padre 'UsuarisComponent':
        props: {
            perfiles: {
                type: Array,
                required: true
            },
            selectUsuariosFiltrosModal: {
                type: Function,
                required: true
            },
            selectUsuariosModal: {
                type: Function,
                required: true
            },
            busqueda: {
                type: Boolean,
                required: true
            }
        },
        // Declaramos las variables:
        data() {
            return {
                usuarios: [],
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
                insert: false,
                load: true,
                send: false,
                mensaje: "mensaje",
                error: "error",
                isModal: true,
                vacio: "vacio"
            }
        },
        // Declaramos los métodos:
        methods: {
            // Método para mostrar el modal para insertar/modificar un usuario y para
            // refrescar los input del modal:
            createUsuario()
            {
                this.insert = true;
                $('#modalIM').modal('show')

                this.usuario.id = ""
                this.usuario.codi = "";
                this.usuario.contrassenya = "";
                this.usuario.nom = "";
                this.usuario.cognoms = "";
                this.usuario.perfils_id = "";
                this.usuario.actiu = false;
                this.usuario.perfil = null;
            },
            // Método para insertar un usuario, lo acemos asíncrono para que así se espere a que acabe la petición
            // a la api antes de seguir con las siguientes instrucciones:
            async insertUsuario()
            {
                // Controlamos que el usuario no se deje ningún input vacío:
                if (this.usuario.codi == "" || this.usuario.contrassenya == ""
                || this.usuario.nom == "" || this.usuario.cognoms == "" || this.usuario.perfils_id == "")
                {
                    alert("Please complete all fields!");
                }
                // Si todos los input están rellenados:
                else
                {
                    // Informamos que se está cargando para mostrar la animación de carga y se lo enviamos
                    // al componente padre 'UsuarisComponent':
                    if(!this.load)
                    {
                        this.load = true;
                        this.$eventUsuariMostrarLoadInsert.$emit("ocultar-usuario-insert", this.load);
                    }

                    // Informamos al componente padre 'UsuarisComponent' de que estamos en un modal:
                    if(!this.isModal)
                    {
                        this.isModal = true;
                    }

                    // Informamos al componente padre 'UsuarisComponent' de que estamos en un modal:
                    this.$eventUsuariIsModal.$emit("modal-usuario", this.isModal);

                    // Cuando nosotros hacemos referencia a las variables que tenemos en el 'data' dentro de nuestro
                    // Vue haremos referencia con 'this' pero cuando estamos en el 'axios' es como si estuvieramos en otro sitio
                    // y el 'this' no funciona de la misma manera y por eso tenemos que guardarnos el 'this' en una variable:
                    let x = this;

                    // axios nos va a ayudar a llamar a las APIs:
                    await axios
                        // Esta es la API que teniamos hecha para insertar un usuario, enviando el usuario que queremos insertar:
                        .post("/usuaris", x.usuario)
                        .then(function(response) {
                            // Guardamos el mensaje de confirmación en caso de que
                            // el usuario se haya insertado correctamente:
                            x.mensaje = "Usuari insertat!";

                            // Refrescamos la lista de usuarios ejecutando métodos
                            // que se nos han enviado desde el componente padre 'UsuarisComponent'
                            // por 'props':
                            if(x.busqueda)
                            {
                                x.selectUsuariosModal();
                                setTimeout(() => {
                                    x.selectUsuariosFiltrosModal();
                                }, 3000);
                            }
                            else
                            {
                                x.selectUsuariosModal();
                            }

                            // Cerramos el modal:
                            $('#modalIM').modal('hide');
                        })
                        .catch(function(error) {
                            // En caso de error guardamos el error:
                            x.error = "Error al insertar l'usuari!";

                            // Cerramos el modal:
                            $('#modalIM').modal('hide');
                        })

                    // Al finalizar la petición de la api informamos que se ha acabado la petición y que salimos del modal,
                    // y se lo enviamos al componente padre 'UsuarisComponent' para mostrar la lista refrescada:
                    setTimeout(() => {
                        this.load = false;
                        this.$eventUsuariOcultarLoadDelete.$emit("cargar-usuario-delete", this.load);

                        this.isModal = false;
                        this.$eventUsuariIsModal.$emit("modal-usuario", this.isModal);
                    }, 3000);

                    // Enviamos al componente padre 'UsuarisComponent' los errores y los mensajes
                    // que hayan surgido durante el proceso de petición de la api:
                    if(this.mensaje !== "mensaje" && this.error === "error")
                    {
                        this.$eventUsuariMensaje.$emit("mensaje-usuario", this.mensaje);
                        this.$eventUsuariError.$emit("error-usuario", this.error);
                        this.mensaje = "mensaje";
                        this.error = "error";
                    }
                    else if(this.error !== "error" && this.mensaje === "mensaje")
                    {
                        this.$eventUsuariError.$emit("error-usuario", this.error);
                        this.$eventUsuariMensaje.$emit("mensaje-usuario", this.mensaje);
                        this.mensaje = "mensaje";
                        this.error = "error";
                    }
                }
            },
            // Método para detectar cualquier cambio en el input
            // de codigo:
            changeCodi(event)
            {
                this.usuario.codi = event.target.value.toString();
            },
            // Método para detectar cualquier cambio en el input
            // de contrasenya:
            changeContrassenya(event)
            {
                this.usuario.contrassenya = event.target.value.toString();
            },
            // Método para detectar cualquier cambio en el input
            // de nombre:
            changeNom(event)
            {
                this.usuario.nom = event.target.value.toString();
            },
            // Método para detectar cualquier cambio en el input
            // de apellidos:
            changeCognoms(event)
            {
                this.usuario.cognoms = event.target.value.toString();
            },
            // Método para detectar cualquier cambio en el input
            // de perfil de usuario:
            changePerfil(event)
            {
                this.usuario.perfils_id = event.target.value;

                // También guardamos toda la información del perfil seleccionado
                // en una variable:
                var numPerfil = parseInt(event.target.value);

                for (const perfil of this.perfiles)
                {
                    if(numPerfil == perfil.id)
                    {
                        this.usuario.perfil = perfil;
                    }
                }
            },
            // Método para detectar cualquier cambio en el input
            // de 'actiu':
            changeActiu()
            {
                if(this.usuario.actiu)
                {
                    this.usuario.actiu = false;
                }
                else
                {
                    this.usuario.actiu = true;
                }
            },
            // Método para mostrar el modal para insertar o modificar un usuario, también recibimos el usuario que
            // se quiere modificar y lo guardamos:
            editUsuario(usuario)
            {
                this.insert = false;
                this.usuario = usuario;
                this.id_perfil = usuario.perfils_id;

                // Mostramos el modal:
                $('#modalIM').modal('show')
            },
            // Método para modificar un usuario, lo hacemos asíncrono para que así se espere a que acabe la petición
            // a la api antes de seguir con las siguientes instrucciones:
            async updateUsuario()
            {
                // Controlamos que el usuario no se deje ningún input vacío:
                if (this.usuario.codi == "" || this.usuario.nom == ""
                || this.usuario.cognoms == "" || this.usuario.perfils_id == "")
                {
                    alert("Please complete all fields!");
                }
                // Si todos los input están rellenados:
                else
                {
                    // Informamos que se está cargando para mostrar la animación de carga y se lo enviamos
                    // al componente padre 'UsuarisComponent':
                    if(!this.load)
                    {
                        this.load = true;
                        this.$eventUsuariMostrarLoadUpdate.$emit("ocultar-usuario-update", this.load);
                    }

                    // Informamos al componente padre 'UsuarisComponent' de que estamos en un modal:
                    if(!this.isModal)
                    {
                        this.isModal = true;
                    }

                    // Informamos al componente padre 'UsuarisComponent' de que estamos en un modal:
                    this.$eventUsuariIsModal.$emit("modal-usuario", this.isModal);

                    // Cuando nosotros hacemos referencia a las variables que tenemos en el 'data' dentro de nuestro
                    // Vue haremos referencia con 'this' pero cuando estamos en el 'axios' es como si estuvieramos en otro sitio
                    // y el 'this' no funciona de la misma manera y por eso tenemos que guardarnos el 'this' en una variable:
                    let x = this;

                    // axios nos va a ayudar a llamar a las APIs:
                    await axios
                        // Esta es la API que teniamos hecha para modificar un usuario específico según el 'id' que enviemos y
                        // el usuario:
                        .put("/usuaris/" + x.usuario.id, x.usuario)
                        .then(function(response) {
                            // Guardamos el mensaje de confirmación en caso de que
                            // el usuario se haya modificado correctamente:
                            x.mensaje = "Usuari modificat!";

                            // Refrescamos la lista de usuarios ejecutando métodos
                            // que se nos han enviado desde el componente padre 'UsuarisComponent'
                            // por 'props':
                            if(x.busqueda)
                            {
                                x.selectUsuariosModal();
                                setTimeout(() => {
                                    x.selectUsuariosFiltrosModal();
                                }, 3000);
                            }
                            else
                            {
                                x.selectUsuariosModal();
                            }

                            // Cerramos el modal:
                            $('#modalIM').modal('hide');
                        })
                        .catch(function(error) {
                            // En caso de error guardamos el error:
                            x.error = "Error al modificar l'usuari!"

                            // Refrescamos la lista de usuarios:
                            x.selectUsuariosModal();

                            // Cerramos el modal:
                            $('#modalIM').modal('hide');
                        })

                    // Al finalizar la petición de la api informamos que se ha acabado la petición y que salimos del modal,
                    // y se lo enviamos al componente padre 'UsuarisComponent' para mostrar la lista refrescada:
                    setTimeout(() => {
                        this.load = false;
                        this.$eventUsuariOcultarLoadDelete.$emit("cargar-usuario-delete", this.load);

                        this.isModal = false;
                        this.$eventUsuariIsModal.$emit("modal-usuario", this.isModal);
                    }, 3000);

                    // Enviamos al componente padre 'UsuarisComponent' los errores y los mensajes
                    // que hayan surgido durante el proceso de petición de la api:
                    if(this.mensaje !== "mensaje" && this.error === "error")
                    {
                        this.$eventUsuariMensaje.$emit("mensaje-usuario", this.mensaje);
                        this.$eventUsuariError.$emit("error-usuario", this.error);
                        this.mensaje = "mensaje";
                        this.error = "error";
                    }
                    else if(this.error !== "error" && this.mensaje === "mensaje")
                    {
                        this.$eventUsuariError.$emit("error-usuario", this.error);
                        this.$eventUsuariMensaje.$emit("mensaje-usuario", this.mensaje);
                        this.mensaje = "mensaje";
                        this.error = "error";
                    }
                }
            },
            // Método para refrescar la lista de usuarios en el componente padre
            // 'UsuarisComponent':
            refreshUsuarios()
            {
                this.$eventUsuariRefrescar.$emit("refrescar-usuario", this.vacio);
            }
        },
        created() { },
        // Método que uso para recibir las emisiones de 'eventBus':
        mounted()
        {
            // Recibimos el usuario seleccionado que nos envia el componente padre 'UsuariComponent'
            // y ejecutamos el método para abrir el modal enviando el usuario que nos llega:
            this.$eventUsuariEdit.$on("editar-usuario", usuario => {
                this.editUsuario(usuario);
            })
        }
    }
</script>
