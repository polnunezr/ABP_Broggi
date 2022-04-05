<template>
    <div class="row d-flex justify-content-center">
        <div class="col colSection colPersonalDates"
        v-bind:class="colReturn">
            <div class="row">
                <div class="col colTitle">
                    <h4 v-text="title"></h4>
                </div>
            </div>

            <data-input name="Telefon" :idInput="this.$inputTelefon" :show="show" :valor="telefonShow"
            small number></data-input>

            <data-input name="Procedencia" :idInput="this.$inputProcedencia" :show="show" :valor="this.procedenciaShow"
            small></data-input>



            <div class="row">
                <div class="col">
                   <data-select :name="this.$provincia" :idSelect="this.$provinciaPersonal" :arrayElements = "provincies"
                   :show="show"></data-select>
                </div>
                <div class="col">
                    <data-select :name="this.$comarca" :idSelect="this.$comarcaPersonal" :arrayElements = "comarques"
                    :show="show"></data-select>
                </div>
                <div class="col">
                   <data-select :name="this.$municipi" :idSelect="this.$municipiPersonal" :arrayElements = "municipis"
                    :show="show"></data-select>
                </div>
            </div>


            <data-input name="Adreça" :idInput="this.$inputAdreca" :show="show" :valor="adrecaShow" small></data-input>

            <data-input name="Origen llamada" :idInput="this.$inputOrigen" :show="show" :valor="origenShow" small></data-input>

            <div class="row" style="margin-top: 40px">
                <div class="col">
                    <div class="form-floating">
                        <textarea class="form-control" id="textAreaAntecedents"
                        style="height: 130px; resize: none" v-on:click="startTime"
                        v-model="antecedentes" :disabled="disabledAntecedents"></textarea>
                        <label for="textAreaAntecedents">Antecedents</label>
                    </div>
                </div>
            </div>

            <data-check v-bind:style="(showCheckSaveInformation == true && show == false) ? 'display: block;' : 'display: none;'"
            name="Guardar informació" :idCheck="this.$checkSaveInformation" checked></data-check>


        </div>
    </div>
</template>

<script>
    export default {
        props: {
            cartaTrucadaShow: {
                type: [Object],
                require: true
            },
            dadaPersonalShow: {
                type: [Object],
                require: true
            },
            localitzacioTrucadaShow: {
                type: [Object],
                require: true
            },
            show: {
                type: [Boolean],
                require: true
            }
        },
        data() {
            return {
                title: "Dades personals",
                provincies: [],
                comarques: [],
                municipis: [],
                provinciesSelect : 0,
                comarcaSelect: 0,
                antecedentes: null,
                dadesPersonals: [],
                telefono: null,
                disabledAntecedents: false,
                dadesPersonalsId: null,
                showCheckSaveInformation: true,
                //Show
                telefonShow: null,
                procedenciaShow: null,
                adrecaShow: null,
                origenShow: null,
                municipiShow: null
            }
        },
        created() {

            if(this.show == false) {

                let meThis = this

                axios
                .get("/provincies")
                .then(response => {
                    for(let i = 0; i < response.data.length; i++) {
                        if(response.data[i].id >= 1 && response.data[i].id <=4) {
                            meThis.provincies.push(response.data[i])
                        }
                    }
                    meThis.comarques = meThis.provincies[this.provinciesSelect].comarques
                    meThis.municipis = meThis.provincies[this.provinciesSelect].comarques[this.comarcaSelect].municipis

                    meThis.updateDatosPersonals();
                })
                .catch(error => {
                    console.log(error)
                })
                .finally(() => this.loading = false)

            }
            else {
                this.telefonShow = this.cartaTrucadaShow.telefon
                this.procedenciaShow = this.cartaTrucadaShow.procedencia_trucada
                this.adrecaShow = this.cartaTrucadaShow.adreca_trucada
                this.origenShow = this.cartaTrucadaShow.origen_trucada
                if(this.dadaPersonalShow != null) {
                    this.antecedentes = this.dadaPersonalShow.antecedents
                    this.disabledAntecedents = true
                }
                if(this.localitzacioTrucadaShow != null) {
                    let municipi = {
                        id: 1,
                        nom: this.localitzacioTrucadaShow.municipi
                    }
                    this.municipis.push(municipi);
                    let comarca = {
                        id: 1,
                        nom: this.localitzacioTrucadaShow.comarca
                    }
                    this.comarques.push(comarca);
                    let provincia = {
                        id: 1,
                        nom: this.localitzacioTrucadaShow.provincia
                    }
                    this.provincies.push(provincia);
                }


            }



        },
        methods: {
            startTime() {
                this.$eventTime.$emit("start-time","message");
            },
            resetSelectPersonal() {
                this.provinciesSelect = 0
                this.comarcaSelect = 0

                for(let i = 0; i < this.provincies.length; i++) {
                    if(this.provincies[i].id == 1) {
                        this.comarques = this.provincies[i].comarques
                        this.municipis = this.comarques[0].municipis
                    }

                }

                this.$eventClear.$emit("clear-select-id-personal","clear");
            },
            updateDatosPersonals() {
                let meThis = this
                this.dadesPersonals = []
                axios
                    .get("/dades_personals")
                    .then(response => {
                        meThis.dadesPersonals = response.data
                    })
                    .catch(error => {
                        console.log(error)
                    })
                    .finally(() => this.loading = false)
            },
            changeInputTelefon() {
                let relation = false;
                for(let i = 0; i < this.dadesPersonals.length; i++) {
                    if(this.dadesPersonals[i].telefon == this.telefono) {
                        this.dadesPersonalsId = this.dadesPersonals[i].id
                        this.$eventPersonal.$emit("set-adreca",this.dadesPersonals[i].adreca);
                        this.antecedentes = this.dadesPersonals[i].antecedents
                        this.disabledAntecedents = true
                        this.$eventPersonal.$emit("disabled-input-adreca",true);
                        this.showCheckSaveInformation = false
                        relation = true;
                    }
                }
                if(!relation && this.dadesPersonalsId != null) {
                    this.resetDadesPersonals();
                }
            },
            resetDadesPersonals() {
                this.$eventPersonal.$emit("set-adreca",null);
                this.antecedentes = null
                this.disabledAntecedents = false
                this.$eventPersonal.$emit("disabled-input-adreca",false);
                this.dadesPersonalsId = null
                this.showCheckSaveInformation = true
            }
        },
        computed: {
            colReturn() {
                return this.$dadesPersonalsCol
            }
        },
        mounted() {
            this.$eventSelect.$on("change-select-provincia-personal", idSelect => {

                let idComarcaSelect = 0;
                let idMunicipiSelect = 0;

                this.provinciesSelect = idSelect;


                for(let i = 0; i < this.provincies.length; i++) {
                    if(this.provincies[i].id == this.provinciesSelect) {
                        this.comarques = this.provincies[i].comarques
                        idComarcaSelect = this.provincies[i].comarques[0].id
                        this.municipis = this.provincies[i].comarques[0].municipis
                        idMunicipiSelect = this.provincies[i].comarques[0].municipis[0].id
                    }
                }
                this.$eventSelect.$emit("change-select-option-comarca-personal",idComarcaSelect);

                this.$eventSelect.$emit("change-select-option-municipi-personal",idMunicipiSelect);

            })

            this.$eventSelect.$on("change-select-comarca-personal", idSelect => {

               let idProvincia = 0;
               let idMunicipiSelect = 0;

               this.comarcaSelect = idSelect;

                for(let i = 0; i < this.comarques.length; i++) {
                    if(this.comarques[i].id == this.comarcaSelect) {
                        this.municipis = this.comarques[i].municipis
                        idMunicipiSelect = this.comarques[i].municipis[0].id
                        idProvincia = this.comarques[i].provincies_id
                    }

                }

                this.$eventSelect.$emit("change-select-option-municipi-personal",idMunicipiSelect);

                this.$eventSelect.$emit("change-select-option-provincia-personal",idProvincia);


            })

            this.$eventSelect.$on("change-select-municipi-personal", idSelect => {
                let idProvincia = 0;
                let idComarcaSelect = 0;

                // console.log(idSelect)

                for(let i = 0; i < this.municipis.length; i++) {
                    if(this.municipis[i].id == idSelect) {
                        idComarcaSelect = this.municipis[i].comarques_id
                    }
                }

                for(let i = 0; i < this.comarques.length; i++) {
                    if(this.comarques[i].id == idComarcaSelect) {
                        idProvincia = this.comarques[i].provincies_id
                    }
                }


                this.$eventSelect.$emit("change-select-option-comarca-personal",idComarcaSelect);
                this.$eventSelect.$emit("change-select-option-provincia-personal",idProvincia);
            })

            this.$eventFinal.$on("obtener-antecedentes", message => {
                this.$eventFinal.$emit("recojer-antecedentes",this.antecedentes);
            })

            this.$eventClear.$on("clear-select-personal", message => {
                this.resetSelectPersonal();
            })

            this.$eventClear.$on("clear-antecedents", message => {
                this.antecedentes = null
            })

            this.$eventPersonal.$on("update-personal-dates", message => {
                this.updateDatosPersonals();
            })

            this.$eventPersonal.$on("change-input-telefono", telefono => {
                if(telefono != "" && telefono != null) {
                    this.telefono = telefono
                }
                else {
                    this.telefono = null
                }

                this.changeInputTelefon();

            })

            this.$eventFinal.$on("obtener-id-dada-personal", message => {
                this.$eventFinal.$emit("recojer-id-dada-personal",this.dadesPersonalsId);
            })

            this.$eventClear.$on("clear-dades-personals", message => {
                this.resetDadesPersonals();
            })

        }
    }
</script>
