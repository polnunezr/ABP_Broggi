<template>
    <div class="row form-row" style="margin-top: 20px">
        <div class="col d-flex"
            v-bind:class="colSmall">
            <label :for="idSelect">{{ name }}</label>
        </div>
        <div class="col d-flex justify-content-center align-items-center"
            v-bind:class="colBig">

            <select v-if="name == this.$comarca || name == this.$provincia || name == this.$municipi"
                ref="select" v-on:change="changeSelect" v-on:click="startTime" class="form-select" :id="idSelect"
                v-model="selectSelected">

                <option value="0"></option>

                <option v-for="arrayElement in arrayElements" :key="arrayElement.id" :value="arrayElement.id">
                {{arrayElement.nom}}</option>


            </select>

            <select v-else-if="name == this.$tipusLocalitzacio"
                ref="select" v-on:change="changeSelect" v-on:click="startTime" class="form-select" :id="idSelect"
                v-model="selectSelectedTipusLocation">
                <option v-for="arrayElement in arrayElements" :key="arrayElement.id" :value="arrayElement.id">
                {{arrayElement.tipus}}</option>
            </select>

            <select v-else
                ref="select" v-on:change="changeSelect" v-on:click="startTime" class="form-select" :id="idSelect">
                <option v-for="arrayElement in arrayElements" :key="arrayElement.id" :value="arrayElement.id">
                {{arrayElement.descripcio}}</option>
            </select>
        </div>
    </div>
</template>

<script>
    export default {
        props: {
            name: {
                type: [String],
                require: true
            },
            idSelect: {
                type:[String],
                require: true
            },
            arrayElements: {
                type:[Array],
                require: true
            },
            small: Boolean
        },
        data() {
            return {
                selectSelected: 0,
                selectSelectedTipusLocation: 1,
            }
        },
        computed: {
            colSmall() {
                let response = "";
                if(this.small == true) {
                    response = "col-3 justify-content-center align-items-center"
                }
                else {
                    if(this.name == this.$tipusLocalitzacio) {
                        response = "col-2 align-items-center"
                    }
                    else {
                        response = "col-5 align-items-center"
                    }

                }
                return response;
            },
            colBig() {
                let response = "";
                if(this.small == true) {
                    response = "col-9"
                }
                else {
                    if(this.name == this.$tipusLocalitzacio) {
                        response = "col-10"
                    }
                    else {
                         response = "col-7"
                    }

                }
                return response;
            }
        },
        methods: {
            startTime() {
                this.$eventTime.$emit("start-time","message");
            },
            changeSelect() {

                switch(this.idSelect) {
                    case this.$provinciaPersonal:
                        this.$eventSelect.$emit("change-select-provincia-personal",parseInt(this.$refs.select.value))
                        break;
                    case this.$comarcaPersonal:
                        this.$eventSelect.$emit("change-select-comarca-personal",parseInt(this.$refs.select.value))
                    break;
                    case this.$municipiPersonal:
                        this.$eventSelect.$emit("change-select-municipi-personal",parseInt(this.$refs.select.value))
                        break;

                    case this.$provinciaLocation:
                        this.$eventSelect.$emit("change-select-provincia-location",parseInt(this.$refs.select.value))
                        break;
                    case this.$comarcaLocation:
                        this.$eventSelect.$emit("change-select-comarca-location",parseInt(this.$refs.select.value))
                        break;
                    case this.$municipiLocation:
                        this.$eventSelect.$emit("change-select-municipi-location",parseInt(this.$refs.select.value))
                        break;

                    case this.$tipusLocalitzacioId:
                        this.$eventSelect.$emit("change-select-localitzacio",parseInt(this.$refs.select.value))
                    break;

                    case this.$tipusEmergenciaId:
                        this.$eventSelect.$emit("change-select-emergencia",parseInt(this.$refs.select.value))
                    break;
                    case this.$incidentsId:
                        this.$eventSelect.$emit("change-select-incident",parseInt(this.$refs.select.value))
                    break;
                }


            }
        },
        mounted() {
            this.$eventSelect.$on("change-select-localitzacio-provincia", selectValor => {
                if(this.name == this.$tipusLocalitzacio) {
                    this.$refs.select.value = selectValor;
                    if(selectValor != 1) {
                        this.$refs.select.disabled = true;
                    }
                    else {
                        this.$refs.select.disabled = false;
                    }
                }
            })

            this.$eventSelect.$on("change-select-option-provincia-personal", option => {
                if(this.idSelect == this.$provinciaPersonal) {
                    this.selectSelected = option
                }
            })

            this.$eventSelect.$on("change-select-option-comarca-personal", option => {
                if(this.idSelect == this.$comarcaPersonal) {
                    this.selectSelected = option
                }
            })

            this.$eventSelect.$on("change-select-option-municipi-personal", option => {
                if(this.idSelect == this.$municipiPersonal) {
                    this.selectSelected = option
                }
            })

            this.$eventSelect.$on("change-select-option-provincia-location", option => {
                if(this.idSelect == this.$provinciaLocation) {
                    this.selectSelected = option
                }
            })

            this.$eventSelect.$on("change-select-option-comarca-location", option => {
                if(this.idSelect == this.$comarcaLocation) {
                    this.selectSelected = option
                }
            })

            this.$eventSelect.$on("change-select-option-municipi-location", option => {
                if(this.idSelect == this.$municipiLocation) {
                    this.selectSelected = option
                }
            })


            this.$eventFinal.$on("obtener-id-municipi-trucada", message => {
                if(this.idSelect == this.$municipiPersonal) {
                    this.$eventFinal.$emit("recojer-id-municipi-trucada",this.selectSelected);
                }
            })

            this.$eventFinal.$on("obtener-id-tipus-location", message => {
                if(this.idSelect == this.$tipusLocalitzacioId) {
                    this.$eventFinal.$emit("recojer-id-tipus-location",this.selectSelectedTipusLocation);
                }
            })

            this.$eventFinal.$on("obtener-id-provincia-location", message => {
                if(this.idSelect == this.$provinciaLocation) {
                    this.$eventFinal.$emit("recojer-id-provincia-location",this.selectSelected);
                }
            })

            this.$eventFinal.$on("obtener-id-comarca-location", message => {
                if(this.idSelect == this.$comarcaLocation) {
                    this.$eventFinal.$emit("recojer-id-comarca-location",this.selectSelected);
                }
            })

            this.$eventFinal.$on("obtener-id-municipi-location", message => {
                if(this.idSelect == this.$municipiLocation) {
                    this.$eventFinal.$emit("recojer-id-municipi-location",this.selectSelected);
                }
            })


        }
    }
</script>
