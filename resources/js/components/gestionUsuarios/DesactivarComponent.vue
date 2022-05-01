<template>
    <!-- Contenedor padre: -->
    <div>
        <!-- Modal de confirmación para desactivar un usuario: -->
        <div class="modal fade" id="modalDestroy" tabindex="-1">
            <div class="modal-dialog modal-dialog-centered" style="background-color: transparent; outline: none; border: none;">
                <div class="modal-content" style="background-color: transparent; outline: none; border: none;">
                    <div class="modal-header" style="background-color: #f28787; none; border: none;">
                        <h5 class="modal-title">Desactivar usuari</h5>
                    </div>
                    <div class="modal-body" style="background-color: #F2A0A0; none; border: none;">
                        Estás segur que vols desactivar l'usuari <b>{{ usuario.codi }}</b>?
                    </div>
                    <div class="modal-footer" style="background-color: #f28787; none; border: none; box-shadow: none;">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"
                        style="outline: none; border: none;">
                            <i class="fa fa-times me-1" aria-hidden="true"></i>
                            Tancar
                        </button>
                        <button class="btn" @click="deleteUsuario()"
                        style="color: white; background-color: #636AF2; outline: none; border: none; box-shadow: none;">
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
        // Declaramos 'props' que recibimos del componente padre 'UsuarisComponent':
        props: {
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
                load: false,
                mensaje: "mensaje",
                error: "error",
                isModal: true
            }
        },
        // Declaramos los métodos:
        methods: {
            // Método para desactivar un usuario, lo hacemos asíncrono para que así se espere a que acabe la petición
            // a la api antes de seguir con las siguientes instrucciones:
            async deleteUsuario()
            {
                // Informamos que se está cargando para mostrar la animación de carga y se lo enviamos
                // al componente padre 'UsuarisComponent':
                if(!this.load)
                {
                    this.load = true;
                    this.$eventUsuariMostrarLoadDelete.$emit("ocultar-usuario-delete", this.load);
                }

                // Informamos al componente padre 'UsuarisComponent' de que estamos en un modal:
                if(!this.isModal)
                {
                    this.isModal = true;
                    this.$eventUsuariIsModal.$emit("modal-usuario", this.isModal);
                }

                // Desactivamos el usuario que nos ha llegado:
                this.usuario.actiu = false;

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
                        x.mensaje = "Usuari desactivat!";

                        // Cerramos el modal:
                        $('#modalDestroy').modal('hide');

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
                    })
                    .catch(function(error) {
                        // En caso de error guardamos el error:
                        x.error = "Error al desactivar l'usuari!";

                        // Refrescamos la lista de usuarios:
                        x.selectUsuariosModal();

                        // Cerramos el modal:
                        $('#modalDestroy').modal('hide');
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
            },
            // Método para mostrar el modal al pulsar el botón de abrir el modal, también recibimos el usuario que
            // se quiere borrar y lo guardamos:
            modalDesactivar(usuarioDesactivar)
            {
                // Guradamos el usuario que nos llega:
                this.usuario = usuarioDesactivar;

                // Si el usuario está activo abriremos el modal:
                if(this.usuario.actiu)
                {
                    $('#modalDestroy').modal('show')
                }
                // Si el usuario ya está desactivado enviaremos un error a través de
                // 'eventBus' al componente padre 'UsuarisComponent':
                else
                {
                    this.error = "Aquest usuari ja está desactivat!";

                    this.$eventUsuariError.$emit("error-usuario", this.error);
                    this.$eventUsuariMensaje.$emit("mensaje-usuario", this.mensaje);
                    this.mensaje = "mensaje";
                    this.error = "error";
                }
            }
        },
        created() { },
        // Método que uso para recibir las emisiones de 'eventBus':
        mounted()
        {
            // Recibimos el usuario seleccionado que nos envia el componente padre 'UsuariComponent'
            // y ejecutamos el método para abrir el modal enviando el usuario que nos llega:
            this.$eventUsuariDelete.$on("desactivar-usuario", usuario => {
                this.modalDesactivar(usuario);
            })
        }
    }
</script>
