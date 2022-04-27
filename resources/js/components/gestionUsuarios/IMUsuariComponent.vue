<template>
    <div>
        <!-- Botón para abrir el modal de insertar/modificar: -->
        <button class="plus2 btn btn-primary position-absolute end-0 bottom-0 m-5" @click="createUsuario()"
        style="background-color: #636AF2; box-shadow: rgba(0, 0, 0, 0.2) 0px 20px 30px; outline: none; border: none;">
            <i class="fa fa-plus-circle me-1" aria-hidden="true"></i>
            Crear Usuari
        </button>

        <!-- Modal para insertar/modificar: -->
        <div class="modal fade" id="modalIM" tabindex="-1">
            <div class="modal-dialog modal-xl modal-dialog-centered" style="background-color: transparent; outline: none; border: none;">
                <div class="modal-content" style="background-color: transparent; outline: none; border: none;">
                    <div class="modal-header" style="background-color: #f28787; outline: none; border: none;">
                        <h5 class="modal-title">Usuari</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body" style="background-color: #F2A0A0; outline: none; border: none;">
                        <div class="form-group row mt-3 mb-3">
                            <label for="codi" class="col-sm-1 col-form-label">Codi</label>
                            <div class="col-sm-11">
                                <input type="text" class="form-control" id="codi" name="codi" autofocus required
                                :value="usuario.codi" @change="changeCodi($event)">
                            </div>
                        </div>
                        <div v-show="insert" class="form-group row mt-3 mb-3">
                            <label for="contrassenya" class="col-sm-1 col-form-label">Contrassenya</label>
                            <div class="col-sm-11">
                                <input type="text" class="form-control" id="contrassenya" name="contrassenya" :value="usuario.contrassenya"
                                @change="changeContrassenya($event)">
                            </div>
                        </div>
                        <div class="form-group row mt-3 mb-3">
                            <label for="nom" class="col-sm-1 col-form-label">Nom</label>
                            <div class="col-sm-11">
                                <input type="text" class="form-control" id="nom" name="nom" :value="usuario.nom"
                                @change="changeNom($event)">
                            </div>
                        </div>
                        <div class="form-group row mt-3 mb-3">
                            <label for="cognoms" class="col-sm-1 col-form-label">Cognoms</label>
                            <div class="col-sm-11">
                                <input type="text" class="form-control" id="cognoms" name="cognoms" :value="usuario.cognoms"
                                @change="changeCognoms($event)">
                            </div>
                        </div>
                        <div class="form-group row mt-3 mb-3">
                            <label for="perfil" class="col-sm-1 col-form-label">Perfil</label>
                            <div class="col-sm-11">
                                <select id="perfil" class="form-select" name="perfil" @change="changePerfil($event)" :value="usuario.perfils_id">
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
                                    <input type="checkbox" class="form-check-input" id="activoInsertar" name="activoInsertar"
                                    :value="usuario.actiu" @change="changeActiu()" :checked="usuario.actiu">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer" style="background-color: #f28787; outline: none; border: none;">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                            <i class="fa fa-times me-1" aria-hidden="true"></i>
                            Tancar
                        </button>
                        <button v-if="insert" type="button" class="btn btn-danger" @click="insertUsuario()"
                        style="background-color: #636AF2; outline: none; border: none;">
                            <i class="fa fa-check" aria-hidden="true"></i>
                            Afegir
                        </button>
                        <button v-else type="button" class="btn btn-danger" @click="updateUsuario"
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
        props: {
            perfiles: {
                type: Array,
                required: true
            },
            selectUsers: {
                type: Function
            }
        },
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
                insert: false
            }
        },
        methods: {
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
                            $('#modalIM').modal('hide');

                            x.usuario.id = ""
                            x.usuario.codi = "";
                            x.usuario.contrassenya = "";
                            x.usuario.nom = "";
                            x.usuario.cognoms = "";
                            x.usuario.perfils_id = "";
                            x.usuario.actiu = false;
                            x.usuario.perfil = null;
                        })
                        .catch(function(error) {
                            // console.log(error.response.status);
                            // console.log(error.response.data);
                            alert("Error al insertar l'usuari");
                            $('#modalIM').modal('hide');
                        })
                }
            },
            changeCodi(event)
            {
                this.usuario.codi = event.target.value;
            },
            changeContrassenya(event)
            {
                this.usuario.contrassenya = event.target.value;
            },
            changeNom(event)
            {
                this.usuario.nom = event.target.value;
            },
            changeCognoms(event)
            {
                this.usuario.cognoms = event.target.value;
            },
            changePerfil(event)
            {
                this.usuario.perfils_id = event.target.value;
            },
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
                            $('#modalIM').modal('hide');
                            // x.selectUsers();
                    })
                    .catch(function(error) {
                        // console.log(error.response.status);
                        // console.log(error.response.data);
                        alert("Error al modificar l'usuari!");
                        $('#modalIM').modal('hide');
                    })
            }
            }
        },




        // Al crearse recogemos todos los usuarios para mostrarlos en la tabla:
        created() {
        },
        // Para detectar cualquier cambio:
        watch: {

        },
        mounted() {
            this.$eventUsuari.$on("editar-usuario", usuario => {
                // debugger;
                this.editUsuario(usuario);
            })
        }
    }
</script>
