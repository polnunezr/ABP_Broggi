<template>
    <!-- Contenedor padre: -->
    <div class="card container mt-5 mb-3 w-100 rounded" style="background-color: #F2A0A0; box-shadow: rgba(0, 0, 0, 0.2) 0px 20px 30px; outline: none; border: none;">
        <!-- 'Card' en la que mostramos los filtros: -->
        <div class="card-body">
            <h5 class="card-title mb-4">Filtres</h5>
            <div class="d-flex flex-row justify-content-between align-items-center w-100">
                <div class="col-1 d-flex justify-content-start align-items-center">
                    <label class="form-check-label" for="selectPerfil">Perfil</label>
                </div>
                <!-- Filtro de perfil de usuario: -->
                <div class="col-8 d-flex justify-content-start align-items-center">
                    <select id="selectPerfil" class="form-select" name="selectPerfil" @change="changePerfilBuscar($event)" style="box-shadow: none;">
                        <option value="0" :selected="datosUsuario.selectPerfil === 0">Tots els perfils</option>
                        <option v-for="perfilBuscar in perfiles" :key="perfilBuscar.id" :value="perfilBuscar.id" :selected="datosUsuario.selectPerfil == perfilBuscar.id">
                            {{  perfilBuscar.nom  }}
                        </option>
                    </select>
                </div>
                <!-- Filtro de 'actiu': -->
                <div class="col-2 d-flex justify-content-center align-items-center">
                    <input type="checkbox" class="form-check-input float-end m-2 p-0" id="activoBuscar" name="activoBuscar"
                    ref="activoBuscar1" @change="changeActivoBuscar()" :checked="datosUsuario.activoBuscar" style="box-shadow: none;">
                    <label class="form-check-label" for="activoBuscar">Actiu</label>
                </div>
                <!-- Botón para enviar los filtros al componente padre 'UsuarisComponent' -->
                <div class="col-1 d-flex justify-content-center align-items-center float-end">
                    <input type="button" class="btn btn-danger" value="Cerca"
                    style="background-color: #636AF2; outline: none; border: none; box-shadow: none;" @click="search()">
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
            }
        },
        // Declaramos las variables:
        data() {
            return {
                datosUsuario: {
                    selectPerfil: 0,
                    activoBuscar: false
                },
            }
        },
        // Declaramos los métodos:
        methods: {
            // Método para detectar cualquier cambio en el input
            // de perfil de usuario:
            changeActivoBuscar()
            {
                if(this.datosUsuario.activoBuscar)
                {
                    this.datosUsuario.activoBuscar = false;
                }
                else
                {
                    this.datosUsuario.activoBuscar = true;
                }
            },
            // Método para detectar cualquier cambio en el input
            // de 'actiu':
            changePerfilBuscar(event)
            {
                this.datosUsuario.selectPerfil = event.target.value;
            },
            // Método para enviar los filtros al componente padre 'UsuarisComponent'
            search()
            {
                this.$emit("enviarBusqueda", this.datosUsuario);
            }
        },
        created() { },
        mounted() { }
    }
</script>
