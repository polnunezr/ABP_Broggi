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
                v-model="selectSelected" :disabled="disabledSelect">

                <!--<option v-if="show" :value="valor">{{valor}}</option>-->

                <option value="0" v-if="show == false"></option>

                <option v-for="arrayElement in arrayElements" :key="arrayElement.id" :value="arrayElement.id">
                {{arrayElement.nom}}</option>


            </select>

            <select v-else-if="name == this.$tipusLocalitzacio"
                ref="select" v-on:change="changeSelect" v-on:click="startTime" class="form-select" :id="idSelect"
                v-model="selectSelectedTipusLocation"
                :disabled="disabledSelect">
                <option v-for="arrayElement in arrayElements" :key="arrayElement.id" :value="arrayElement.id">
                {{arrayElement.tipus}}</option>
            </select>

            <select v-else-if="idSelect == this.$tipusEmergenciaId"
                ref="select" v-on:change="changeSelect" v-on:click="startTime" class="form-select" :id="idSelect"
                v-model="selectSelectedTipusIncident"
                :disabled="disabledSelect">
                <option v-for="arrayElement in arrayElements" :key="arrayElement.id" :value="arrayElement.id">
                {{arrayElement.descripcio}}</option>
            </select>

            <select v-else
                ref="select" v-on:change="changeSelect" v-on:click="startTime" class="form-select" :id="idSelect"
                v-model="selectSelectedIncident"
                :disabled="disabledSelect">
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
            show: {
                type:[Boolean],
                require: true
            },
            small: Boolean
        },
        data() {
            return {
                selectSelected: 0,
                selectSelectedTipusLocation: 1,
                selectSelectedTipusIncident: 1,
                selectSelectedIncident: 1,
                disabledSelect: false
            }
        },
        created() {
            if(this.show) {
                this.selectSelected = 1;
                this.selectSelectedTipusLocation = 1;
                this.selectSelectedTipusIncident = 1;
                this.selectSelectedIncident = 1;
                this.disabledSelect = true;
            }
        },
        computed: {
            colSmall() {
                let response = "";
                if(this.small == true) {
                    response = "col-3 justify-content-center align-items-center"
                }
                else {
                    if(this.name == this.$tipusLocalitzacio || this.idSelect == this.$provinciaSelectProvincia) {
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
                    if(this.name == this.$tipusLocalitzacio || this.idSelect == this.$provinciaSelectProvincia) {
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
                        this.$eventSelect.$emit("change-select-emergencia",this.selectSelectedTipusIncident)
                    break;
                    case this.$incidentsId:
                        this.$eventSelect.$emit("change-select-incident",this.selectSelectedIncident)
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

            this.$eventSelect.$on("change-select-id-emergencia", id => {
                if(this.idSelect == this.$tipusEmergenciaId) {
                    this.selectSelectedTipusIncident = id
                }
            })

            this.$eventSelect.$on("change-select-id-incident", id => {
                if(this.idSelect == this.$incidentsId) {
                    this.selectSelectedIncident = id
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



            this.$eventExpedient.$on("obtener-id-municipi-location", message => {
                if(this.idSelect == this.$municipiLocation) {
                    this.$eventExpedient.$emit("recojer-id-municipi-location",this.selectSelected);
                }
            })




            this.$eventFinal.$on("obtener-id-otra-provincia", message => {
                if(this.idSelect == this.$provinciaSelectProvincia) {
                    this.$eventFinal.$emit("recojer-id-otra-provincia",this.selectSelected);
                }
            })

            this.$eventFinal.$on("obtener-id-tipo-incident", message => {
                if(this.idSelect == this.$tipusEmergenciaId) {
                    this.$eventFinal.$emit("recojer-id-tipo-incident",this.selectSelectedTipusIncident);
                }
            })

            this.$eventFinal.$on("obtener-id-incident", message => {
                if(this.idSelect == this.$incidentsId) {
                    this.$eventFinal.$emit("recojer-id-incident",this.selectSelectedIncident);
                }
            })


            this.$eventExpedient.$on("obtener-id-incident", message => {
                if(this.idSelect == this.$incidentsId) {
                    this.$eventExpedient.$emit("recojer-id-incident",this.selectSelectedIncident);
                }
            })



            this.$eventClear.$on("clear-select-id-location", message => {
                if(this.idSelect == this.$provinciaLocation || this.idSelect == this.$comarcaLocation
                    || this.idSelect == this.$municipiLocation) {
                        this.selectSelected = 0;
                }
            })

            this.$eventClear.$on("clear-select-id-personal", message => {
                if(this.idSelect == this.$provinciaPersonal || this.idSelect == this.$comarcaPersonal
                    || this.idSelect == this.$municipiPersonal) {
                        this.selectSelected = 0;
                }
            })

            this.$eventClear.$on("clear-select-tipus-location", message => {
                if(this.idSelect == this.$tipusLocalitzacioId) {
                    this.selectSelectedTipusLocation = 1;
                    this.$eventSelect.$emit("change-select-localitzacio",1)
                }
            })

            this.$eventClear.$on("clear-select-other-provincies", message => {
                if(this.idSelect == this.$provinciaSelectProvincia) {
                    this.selectSelected = 0;
                }
            })

            //Clear

            // this.$eventClear.$on("clear-select", message => {
            //     if(this.name == this.$comarca || this.name == this.$provincia
            //     || this.name == this.$municipi) {
            //         this.selectSelected = 0
            //     }
            //     else if(this.name == this.$tipusLocalitzacio) {
            //         this.selectSelectedTipusLocation = 1
            //     }
            //     else if(this.idSelect == this.$tipusEmergenciaId) {
            //         this.selectSelectedTipusIncident = 1
            //     }
            //     else {
            //         this.selectSelectedIncident = 1
            //     }

            // })
        }
    }
</script>
