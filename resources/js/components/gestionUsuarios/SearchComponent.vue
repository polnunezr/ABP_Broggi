<template>
    <div class="card container mt-5 mb-5 w-100 rounded" style="background-color: #F2A0A0; box-shadow: rgba(0, 0, 0, 0.2) 0px 20px 30px; outline: none; border: none;">
        <div class="card-body">
            <h5 class="card-title mb-4">Cerca per filtres</h5>
            <div class="d-flex flex-row justify-content-between align-items-center w-100">
                <div class="col-1 d-flex justify-content-start align-items-center">
                    <label class="form-check-label" for="selectPerfil">Perfil</label>
                </div>
                <div class="col-8 d-flex justify-content-start align-items-center">
                    <select id="selectPerfil" class="form-select" name="selectPerfil" @change="changePerfilBuscar($event)">
                    <!-- @change="updateForm('selectPerfil', $event.target.value)"> -->
                        <option value="0" :selected="datosUsuario.selectPerfil === 0">Tots els perfils</option>
                        <option v-for="perfilBuscar in perfiles" :key="perfilBuscar.id" :value="perfilBuscar.id" :selected="datosUsuario.selectPerfil == perfilBuscar.id"
                        >
                            {{  perfilBuscar.nom  }}
                        </option>
                    </select>
                </div>
                <div class="col-2 d-flex justify-content-center align-items-center">
                    <input type="checkbox" class="form-check-input float-end m-2 p-0" id="activoBuscar" name="activoBuscar"
                    ref="activoBuscar1" @change="changeActivoBuscar()" :checked="datosUsuario.activoBuscar">
                    <!-- @change="updateForm('activoBuscar', $event.target.checked)"> -->
                    <label class="form-check-label" for="activoBuscar">Actiu</label>
                </div>

                <div class="col-1 d-flex justify-content-center align-items-center float-end">
                    <!-- <button class="btn btn-secondary" @click="selectUsuariosByParams()"
                    style="background-color: #636AF2; outline: none; border: none;">
                        <i class="fa fa-search" aria-hidden="true"></i>
                    </button> -->
                    <input type="button" class="btn btn-danger" value="Cerca"
                    style="background-color: #636AF2; outline: none; border: none;" @click="search()">
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
                datosUsuario: {
                    selectPerfil: 0,
                    activoBuscar: false,
                },
            }
        },
        methods: {
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
            changePerfilBuscar(event)
            {
                this.datosUsuario.selectPerfil = event.target.value;
            },
            search()
            {
                this.$emit("enviarBusqueda", this.datosUsuario);
            }
        },
        // Al crearse recogemos todos los usuarios para mostrarlos en la tabla:
        created() {
        },
        // Para detectar cualquier cambio:
        watch: {

        },
        mounted() {

        }
    }
</script>
