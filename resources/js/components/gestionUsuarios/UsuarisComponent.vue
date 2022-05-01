<template>
    <!-- Contenedor padre: -->
    <div id="parent" class="container-fluid w-100 h-100 d-flex flex-column justify-content-start pt-4">

        <!-- Botón para voler atrás: -->
        <div class="position-fixed end-0 top-0 m-3">
            <!-- Botón para salir: -->
            <button class="plus2 btn btn-primary"
            style="z-index: 999; background-color: #636AF2; box-shadow: rgba(0, 0, 0, 0.2) 0px 20px 30px; outline: none; border: none; box-shadow: none;"
            @click="volverAtras">
                Tornar
            </button>
        </div>

        <!-- Componente que contiene los filtros para buscar usuarios por filtros. A este componente
        le enviamos un array con los perfiles de usuario y también recibiremos los parámetros
        de búsqueda que especifique el usuario: -->
        <buscar-component :perfiles="perfiles" @enviarBusqueda="selectFiltros($event)"></buscar-component>

        <!-- Si no nos llega ningún mensaje de error o de confirmación de algún componente hijo: -->
        <div v-if='(mensaje === "" && error === "") || (mensaje === "mensaje" && error === "error")'>
            <!-- Si se han especificado filtros de búsqueda y no se está realizanco ninguna petición a la api: -->
            <div v-if='usuariosByParams.length && !load' class="container p-0 h-50">
                <div class="card rounded" style="background-color: #F2C49B; box-shadow: rgba(0, 0, 0, 0.2) 0px 20px 30px; outline: none; border: none;">
                    <div class="card-body">
                        <!-- Para paginar las filas de una tabla tenemos que usar el componente 'paginate' de Vue que
                        previamente hemos installado por el terminal: -->
                        <paginate name="usuariosList" :list="usuariosByParams" :per="3" ref="paginator" tag="div">
                            <!-- Creamos una tabla para mostrar los usuarios: -->
                            <table class="container table mb-5 table-white">
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
                                    <tr v-for="usuario in paginated('usuariosList')" :key="usuario.id">
                                        <td class="col-2">{{ usuario.codi }}</td>
                                        <td class="col-3">{{ usuario.nom }}</td>
                                        <td class="col-3">{{ usuario.cognoms }}</td>
                                        <td class="col-1">
                                            <div class="form-check">
                                                <input type="checkbox" class="form-check-input" id="usuarioActivo" v-bind:checked="usuario.actiu" disabled>
                                            </div>
                                        </td>
                                        <td class="col-4">{{ usuario.perfil.nom  }}</td>
                                        <td class="col-2">
                                            <div class="d-flex flex-row justify-content-center align-items-center">
                                                <!-- Botón para llamar el componente que contiene el modal de editar: -->
                                                <div class="float-end me-2">
                                                    <button type="submit" class="btn btn-secondary d-flex justify-content-center align-items-center flex-row"
                                                    @click="editUsuario(usuario)" style="background-color: #636AF2; outline: none; border: none; box-shadow: none;">
                                                        <i class="fas fa-edit"></i>
                                                    </button>
                                                </div>

                                                <!-- Botón para llamar el componente que contiene el modal de borrar: -->
                                                <div class="float-end">
                                                    <button type="button" class="btn btn-danger d-flex justify-content-center align-items-center flex-row"
                                                    @click="deleteUsuario(usuario)" style="background-color: #D962A3; outline: none; border: none; box-shadow: none;">
                                                        <i class="fas fa-trash"></i>
                                                    </button>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </paginate>

                        <!-- Contenedor en el que tenemos los links de la paginación junto a la información sobre la
                        pagina en la que estamos: -->
                        <div class="d-flex flex-row justify-content-between align-items-center">
                            <div class="ms-4" style="width: 50%;">
                                <!-- Enlaces de la paginación: -->
                                <paginate-links for="usuariosList" :async="true" :hide-single-page="true"
                                :simple="{
                                    next: 'Següent',
                                    prev: 'Anterior'
                                }"
                                :classes="{
                                    '.next' : 'btn',
                                    '.prev' : 'btn'
                                }"></paginate-links>
                            </div>

                            <div class="d-flex justify-content-end me-4" style="width: 50%;">
                                <!-- Información sobre la página: -->
                                <span v-if="$refs.paginator">
                                    {{ ($refs.paginator.pageItemsCount).replace("of", "de") }}
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Si no se han especificado filtros de búsqueda y no se está realizanco ninguna petición a la api: -->
            <div v-else-if='!usuariosByParams.length && !busqueda && !load' class="container p-0 h-50">
                <!-- Si tampoco se han encontrado usuarios en la base de datos sin filtros y tampoco se está realizando
                ninguna petición de búsqueda por filtros o petición a la api mostraremos un 'alert' con mensaje de error: -->
                <div v-if='!usuarios.length && !load' class="card container rounded" style="background-color: #F2C49B; box-shadow: rgba(0, 0, 0, 0.2) 0px 20px 30px; outline: none; border: none;">
                    <div class="card-body">
                        <div class="alert alert-light d-flex justify-content-center align-items-center p-4" style="color: white; background-color: #D755D9; outline: none; border: none;" role="alert">
                            Cap usuari trobat!
                        </div>
                    </div>
                </div>
                <!-- Si se encuentras usuarios en la base de datos sin uso de filtros y no se está realizando
                ninguna petición de búsqueda por filtros o petición a la api: -->
                <div v-else-if='usuarios.length && !load' class="card container p-0" style="background-color: #F2C49B; box-shadow: rgba(0, 0, 0, 0.2) 0px 20px 30px; outline: none; border: none;">
                    <div class="card-body background-color: #F2C49B;">
                        <!-- Para paginar las filas de una tabla tenemos que usar el componente 'paginate' de Vue que
                        previamente hemos installado por el terminal: -->
                        <paginate name="usuariosList" :list="usuarios" :per="3" ref="paginator" tag="div">
                            <!-- Creamos una tabla para mostrar los usuarios: -->
                            <table class="container mb-5 table table-white">
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
                                    <tr v-for="usuario in paginated('usuariosList')" :key="usuario.id">
                                        <td class="col-2">{{ usuario.codi }}</td>
                                        <td class="col-3">{{ usuario.nom }}</td>
                                        <td class="col-3">{{ usuario.cognoms }}</td>
                                        <td class="col-1">
                                            <div class="form-check">
                                                <input type="checkbox" class="form-check-input" id="usuarioActivo" v-bind:checked="usuario.actiu" disabled>
                                            </div>
                                        </td>
                                        <td class="col-4">{{ usuario.perfil.nom }}</td>
                                        <td class="col-2">
                                            <div class="d-flex flex-row justify-content-center align-items-center">
                                                <!-- Botón para llamar el componente que contiene el modal de editar: -->
                                                <div class="float-end me-2">
                                                    <button type="submit" class="btn btn-secondary d-flex justify-content-center align-items-center flex-row"
                                                    @click="editUsuario(usuario)" style="background-color: #636AF2; outline: none; border: none; box-shadow: none;">
                                                        <i class="fas fa-edit"></i>
                                                    </button>
                                                </div>

                                                <!-- Botón para llamar el componente que contiene el modal de borrar: -->
                                                <div class="float-end">
                                                    <button type="button" class="btn btn-danger d-flex justify-content-center align-items-center flex-row"
                                                    @click="deleteUsuario(usuario)" style="background-color: #D962A3; outline: none; border: none; box-shadow: none;">
                                                        <i class="fas fa-trash"></i>
                                                    </button>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>

                                </tbody>
                            </table>
                        </paginate>

                        <!-- Contenedor en el que tenemos los links de la paginación junto a la información sobre la
                        pagina en la que estamos: -->
                        <div class="d-flex flex-row justify-content-between align-items-center">
                            <div class="ms-4" style="width: 50%;">
                                <!-- Enlaces de la paginación: -->
                                <paginate-links for="usuariosList" :async="true" :hide-single-page="true"
                                :simple="{
                                    next: 'Següent',
                                    prev: 'Anterior'
                                }"
                                :classes="{
                                    '.next' : 'btn',
                                    '.prev' : 'btn'
                                }"></paginate-links>
                            </div>

                            <div class="d-flex justify-content-end me-4" style="width: 50%;">
                                <!-- Información sobre la página: -->
                                <span v-if="$refs.paginator">
                                    {{ ($refs.paginator.pageItemsCount).replace("of", "de") }}
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Si se han especificado filtros de búsqueda pero no se han encontrado usuarios que cumplan las condiciones de los filtros
            y tampoco se está realizando ninguna petición de búsqueda por filtros o petición a la api mostraremos un 'alert' con mensaje de error: -->
            <div v-else-if='!usuariosByParams.length && busqueda && !load' class="card container rounded" style="background-color: #F2C49B; box-shadow: rgba(0, 0, 0, 0.2) 0px 20px 30px; outline: none; border: none;">
                <div class="card-body">
                    <div class="alert alert-light d-flex justify-content-center align-items-center p-4" style="color: white; background-color: #D755D9; outline: none; border: none;" role="alert">
                        No s'han trobat usuaris en la base de dades!
                    </div>
                </div>
            </div>
            <!-- Si se ha hecho una petición de búsqueda por filtros o una petición a la api mostraremos una animación de carga
            para informar al usuario de que se está refrescando la lista de usuarios: -->
            <div v-else-if="load" class="card container" style="background-color: #F2C49B; box-shadow: rgba(0, 0, 0, 0.2) 0px 20px 30px; outline: none; border: none;">
                <div class="card" style="background-color: #F2C49B; border: none; outline: none; box-shadow: none;">
                    <div class="w-100 h-100 d-flex justify-content-center align-items-center" style="background-color: #F2C49B; border: none; outline: none; box-shadow: none;">
                        <img src="http://daw.abp-politecnics.com/daw03/filesSVG/load.svg" width="100" height="100" style="background-color: #F2C49B; border: none; outline: none;">
                    </div>
                </div>
            </div>
        </div>
        <!-- Si nos llega un mensaje de error o de confirmación de algún componente hijo: -->
        <div v-else-if='(mensaje !== "" && mensaje !== "mensaje") || (error !== "" && error !== "error")' class="container p-0 h-50">
            <div class="card container rounded" style="background-color: #F2C49B; box-shadow: rgba(0, 0, 0, 0.2) 0px 20px 30px; outline: none; border: none; padding-bottom: 10px;">
                <div class="card-body">
                    <!-- 'Alert' para mostrar el mensaje de confirmación: -->
                    <div v-if='mensaje !== "" && mensaje !== "mensaje"' class="alert alert-light d-flex justify-content-center align-items-center p-4 mb-0 fade show"
                    style="color: white; background-color: #636AF2; outline: none; border: none;" role="alert">
                        {{ mensaje }}
                    </div>
                    <!-- O 'alert' para mostrar el error: -->
                    <div v-else-if='error !== "" && error !== "error"' class="alert alert-light d-flex justify-content-center align-items-center p-4 mb-0 fade show"
                    style="color: white; background-color: #D962A3; outline: none; border: none;" role="alert">
                        {{ error }}
                    </div>
                </div>
            </div>
        </div>

        <!-- Componente que contiene el modal con el formulario de insertar y modificar un usuario. A este componente le enviamos un array con los
        perfiles, una función para seleccionar los usuarios de la base de datos, un función para filtrar usuarios,  y un 'boolean'
        para sabes si se ha hecho una búsqueda por filtros o no: -->
        <manipular-component :perfiles="perfiles" :selectUsuariosModal="selectUsuarios"
        :selectUsuariosFiltrosModal="selectUsuariosFiltros" :busqueda="busqueda"></manipular-component>

        <!-- Componente que contiene el modal con el formulario de desactivar un usuario. A este componente le enviamos
        una función para seleccionar los usuarios de la base de datos, una función para filtrar usuarios y un 'boolean'
        para sabes si se ha hecho una búsqueda por filtros o no: -->
        <desactivar-component :selectUsuariosFiltrosModal="selectUsuariosFiltros"
        :selectUsuariosModal="selectUsuarios" :busqueda="busqueda"></desactivar-component>
    </div>
</template>

<script>
    export default {
        // Declaramos 'props' que recibimos de la vista 'usuaris_vue.blade':
        props: ['perfiles', 'authid', 'menu'],
        // Declaramos las variables:
        data() {
            return {
                usuarios: [],
                usuariosByParams: [],
                usuario: {
                    id: 0,
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
                    activoBuscar: false
                },
                insert: true,
                busqueda: false,
                paginate: ['usuariosList'],
                shown: false,
                load: true,
                error: "",
                mensaje: "",
                isModal: false
            }
        },
        // Declaramos los métodos:
        methods: {
            // Método para seleccionar todos los usuarios, lo hacemos asíncrono para que así se espere a que acabe la petición
            // a la api antes de seguir con las siguientes instrucciones:
            async selectUsuarios()
            {
                // Informamos que se está cargando para mostrar la animación de carga:
                if(!this.load)
                {
                    this.load = true;
                }

                // Cuando nosotros hacemos referencia a las variables que tenemos en el 'data' dentro de nuestro
                // Vue haremos referencia con 'this' pero cuando estamos en el 'axios' es como si estuvieramos en otro sitio
                // y el 'this' no funciona de la misma manera y por eso tenemos que guardarnos el 'this' en una variable:
                let x = this;
                // axios nos va a ayudar a llamar a las APIs:
                await axios
                    // Esta es la API que teniamos hecha para llamar a todos los usuarios:
                    .get("/usuaris/" + x.authid)
                    .then(response => {
                        // Guardamos los usuarios que nos llegan de la base de datos:
                        x.usuarios = [];
                        x.usuarios = response.data;
                    })
                    .catch(error => {
                        console.log(error);
                    })
                    .finally(() => this.loading = true)

                // Cuando pasen 3 segundos informamos que se ha acabado la filtración, por lo tanto volveremos
                // a mostrar la lista refrescada:
                if(this.isModal === false)
                {
                    setTimeout(() => {
                        this.load = false;
                    }, 1000);
                }
            },
            // Método para filtrar los usuarios:
            selectUsuariosFiltros()
            {
                // Informamos que se está cargando para mostrar la animación de carga:
                if(!this.load)
                {
                    this.load = true;
                }

                // Informamos que se está realizando o que se ha realizado una búsqueda de usuarios por filtros:
                if(!this.busqueda)
                {
                    this.busqueda = true;
                }

                // Refrescamos el array de usuarios por filtros porque sinó por cada búsqueda por filtros
                // se nos acumulan los usuarios de anteriores búsquedas:
                this.usuariosByParams = [];

                // Recorremos el array de usuarios con los usuarios que nos llegan de la base de datos:
                for(const usuario of this.usuarios)
                {
                    // Si en el filtro no se especifica ningún perfil de usuario:
                    if(this.datosUsuario.selectPerfil == 0)
                    {
                        // Si la 'checkbox' de 'actiu' está seleccionada:
                        if(this.datosUsuario.activoBuscar)
                        {
                            // Si el usuario también es activo lo guardamos en el array:
                            if(usuario.actiu)
                            {
                                this.usuariosByParams.push(usuario);
                            }
                        }
                        // Si la 'checkbox' de 'actiu' no está seleccionada guardamos todos los usuarios,
                        // tanto activos como inactivos:
                        else
                        {
                            this.usuariosByParams.push(usuario);
                        }
                    }
                    // Si en el filtro se especifica un perfil de usuario y el perfil del usuario
                    // coincide con el perfil seleccionado en el filtro de búsqueda:
                    else if(this.datosUsuario.selectPerfil == usuario.perfils_id)
                    {
                        // Si la 'checkbox' de 'actiu' está seleccionada:
                        if(this.datosUsuario.activoBuscar)
                        {
                            // Si el usuario también es activo lo guardamos en el array:
                            if(usuario.actiu)
                            {
                                this.usuariosByParams.push(usuario);
                            }
                        }
                        // Si la 'checkbox' de 'actiu' no está seleccionada guardamos todos los usuarios,
                        // tanto activos como inactivos:
                        else
                        {
                            this.usuariosByParams.push(usuario);
                        }
                    }
                }

                // Si con los filtros se han encontrado usuarios entonces retrocederemos a la
                // primera página del componente 'paginate':
                if(this.usuariosByParams != 0)
                {
                    if (this.$refs.paginator)
                    {
                        this.$refs.paginator.goToPage(1);
                    }
                }

                // Cuando pasen 3 segundos informamos que se ha acabado la filtración, por lo tanto volveremos
                // a mostrar la lista refrescada:
                if(this.isModal === false)
                {
                    setTimeout(() => {
                        this.load = false;
                    }, 1000);
                }
            },
            // En este método recibimos los filtros del componente 'BuscarComponent' y luego
            // realizamos la búsqueda de usuarios por filtros:
            selectFiltros(datosUsuarioFiltros)
            {
                this.datosUsuario = datosUsuarioFiltros;

                this.selectUsuariosFiltros();
            },
            // En este método usamos un 'eventBus', lo que hacemos con el 'emit' es enviar al componente
            // hijo 'ManipularComponent' el usuario que se quiere editar y abrir el modal para insertar/modificar:
            editUsuario(usuarioEdit)
            {
                this.$eventUsuariEdit.$emit("editar-usuario", usuarioEdit);
            },
            // En este método usamos un 'eventBus', lo que hacemos con el 'emit' es enviar al componente
            // hijo 'DesactivarComponent' el usuario que se quiere desactivar y abrir el modal para desacivar:
            deleteUsuario(usuarioDelete)
            {
                this.$eventUsuariDelete.$emit("desactivar-usuario", usuarioDelete);
            },
            // Método que sirve para que se borre cualquier mensaje de confirmación o error que nos
            // llegue de algún componente hijo:
            removeMensaje()
            {
                this.mensaje = "";
                this.error = "";
            },
            // Método para volver al menú:
            volverAtras()
            {
                window.location = this.menu;
            }
        },
        // Al crear este componente recogemos todos los usuarios de la base de datos, menos
        // el usuario con el que hemos iniciado sesión, para mostrarlos en la tabla:
        created()
        {
            this.selectUsuarios();
        },
        // Método que uso para recibir las emisiones de 'eventBus' de componentes hijos:
        mounted()
        {
            setTimeout(() => {
                this.shown = true;
            }, 1000);

            // Al insertar un usuario recibimos el estado de la variable 'load' para que se
            // muestre la animación de carga:
            this.$eventUsuariMostrarLoadInsert.$on("ocultar-usuario-insert", load => {
                this.load = load;
            })

            // Al insertar un usuario recibimos el estado de la variable 'load' para que se
            // oculte la animación de carga:
            this.$eventUsuariOcultarLoadInsert.$on("cargar-usuario-insert", load => {
                this.load = load;
            })

            // Al modificar un usuario recibimos el estado de la variable 'load' para que se
            // muestre la animación de carga:
            this.$eventUsuariMostrarLoadUpdate.$on("ocultar-usuario-update", load => {
                this.load = load;
            })

            // Al modificar un usuario recibimos el estado de la variable 'load' para que se
            // oculte la animación de carga:
            this.$eventUsuariOcultarLoadUpdate.$on("cargar-usuario-update", load => {
                this.load = load;
            })

            // Al desactivar un usuario recibimos el estado de la variable 'load' para que se
            // muestre la animación de carga:
            this.$eventUsuariMostrarLoadDelete.$on("ocultar-usuario-delete", load => {
                this.load = load;
            })

            // Al desactivar un usuario recibimos el estado de la variable 'load' para que se
            // oculte la animación de carga:
            this.$eventUsuariOcultarLoadDelete.$on("cargar-usuario-delete", load => {
                this.load = load;
            })

            // Al insertar, modificar o desactivar un usuario recibimos la variable 'error' para
            // detectar si ha habido algún error durante el proceso:
            this.$eventUsuariError.$on("error-usuario", error => {
                this.error = error;

                // A los 3 segundos reestablecemos el valor inicial de la variable 'error'
                // para que deje de mostrarse el error por pantalla:
                setTimeout(() => {
                    this.error = "";
                }, 3000);
            })

            // Al insertar, modificar o desactivar un usuario recibimos la variable 'mensaje' para
            // detectar si ha habido un mensaje de confirmación durante el proceso:
            this.$eventUsuariMensaje.$on("mensaje-usuario", mensaje => {
                this.mensaje = mensaje;

                // A los 3 segundos reestablecemos el valor inicial de la variable 'mensaje'
                // para que deje de mostrarse el mensaje por pantalla:
                setTimeout(() => {
                    this.mensaje = "";
                }, 3000);
            })

            // Recibimos de componentes hijos que nos encontramos en un modal:
            this.$eventUsuariIsModal.$on("modal-usuario", isModal => {
                this.isModal = isModal;
            })

            // Al cerrar el modal de modificación necesitamos refrescar la lista de usuarios
            // porque en los inputs del formulario tenemos puesta la función 'change' establecida
            // la cual nos supone un problema porque aunque no se haya pulsado el botón de modificar
            // la información de los inputs de guarda en local. Para evitar que está información
            // que no se guarda en la base de datos se muestre en la lista debemos refrescar la lista de usuarios:
            this.$eventUsuariRefrescar.$on("refrescar-usuario", vacio => {
                this.selectUsuarios();
                this.selectUsuariosFiltros();
            })
        }
    }
</script>
