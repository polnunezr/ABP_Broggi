<template>
    <div class="row d-flex justify-content-center">
        <div class="col colSection colLocation"
        v-bind:class="colReturn"
        :style="{'margin-top': marginTopLocation + 'px'}">
            <div class="row">
                <div class="col colTitle">
                    <h4 v-text="title"></h4>
                </div>
            </div>

            <data-check :name="this.$checkCatalonia" :idCheck="this.$checkCatalunya"
            :show="show" :tipusLocalitzacioSelect="tipusLocalitzacioSelect" :disabledCheck="disabledCheck" checked></data-check>

            <div class="row" v-if="checkedCataluna">
                <div class="col">
                    <data-select :name="this.$provincia" :idSelect="this.$provinciaLocation"
                    :arrayElements = "provincies"
                     :show="show" small></data-select>
                </div>
                <div class="col">
                    <data-select :name="this.$comarca" :idSelect="this.$comarcaLocation"
                    :arrayElements = "comarques"
                     :show="show" small></data-select>
                </div>
                <div class="col">
                    <data-select :name="this.$municipi" :idSelect="this.$municipiLocation"
                    :arrayElements = "municipis"
                     :show="show" small></data-select>
                </div>
            </div>

            <!--<data-input name="Direccio" idInput="inputDireccio"></data-input>-->

            <data-select :name="this.$tipusLocalitzacio" :idSelect="this.$tipusLocalitzacioId"
            :arrayElements = "tipusLocalitzacio" style="margin-top: 30px; marginBottom: 20px;"
             :show="show"></data-select>

            <div v-bind:style="checkedCataluna == false ? 'display: block;' : 'display: none;'" >
                <data-select :name="this.$provincia" :idSelect="this.$provinciaSelectProvincia"
                :arrayElements="otrasProvincias" :show="show"></data-select>
                <data-input name="Municipi" :idInput="this.$inputProvinciaMunicipi"
                :valor="municipiNomShow" :show="show" small></data-input>
            </div>

            <div v-bind:style="tipusLocalitzacioSelect == 1 ? 'display: block;' : 'display: none;'">
                <data-input name="Tipus de via" :idInput="this.$inputTipusDeVia"
                 :valor="tipusDeViaShow" :show="show" small></data-input>
                <data-input name="Nom" :idInput="this.$inputNom"
                :valor="nomShow" :show="show" small></data-input>
                <data-input name="Número" :idInput="this.$inputNumero"
                :valor="numeroShow" :show="show" small number></data-input>
                <data-input name="Escala" :idInput="this.$inputEscala"
                :valor="escalaShow" :show="show" small number></data-input>
                <data-input name="Pis" :idInput="this.$inputPis"
                :valor="pisShow" :show="show" small number></data-input>
                <data-input name="Porta" :idInput="this.$inputPorta"
                :valor="portaShow" :show="show" small number></data-input>
            </div>

            <div v-bind:style="tipusLocalitzacioSelect == 4 ? 'display: block;' : 'display: none;'">
                <data-input name="Nom carretera" :idInput="this.$inputNomCarretera"
                :valor="nomCarreteraShow" :show="show" small></data-input>
                <data-input name="Punt kilomètric " :idInput="this.$inputPuntKilometric"
                :valor="puntKilometricShow" :show="show" small number></data-input>
                <data-input name="Sentit" :idInput="this.$inputSentit"
                :valor="sentitShow" :show="show" small></data-input>
            </div>

            <div v-bind:style="tipusLocalitzacioSelect == 2 ? 'display: block;' : 'display: none;'">
                <data-input name="Nom" :idInput="this.$inputNomPuntSingular"
                :valor="nomPuntSingular" :show="show" small></data-input>
            </div>

            <div class="row" style="margin-top: 40px">
                <div class="col">
                    <div class="form-floating">
                        <textarea class="form-control" :id="this.$textAreaDetalls"
                        style="height: 130px; resize: none" v-on:click="startTime"
                        v-model="detalls" :disabled="disabledDetalls"></textarea>
                        <label :for="this.$textAreaDetalls">Detalls</label>
                    </div>
                </div>
            </div>

        </div>
    </div>

</template>

<script>
    export default {
        props: {
            marginTopLocation: {
                type: [Number],
                require: true
            },
            cartaTrucadaShow: {
                type: [Object],
                require: true
            },
            localitzacioShow: {
                type: [Object],
                require: true
            },
            tipusLocalitzacioShow: {
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
                title: "Localització",
                provincies: [],
                comarques: [],
                municipis: [],
                otrasProvincias: [],
                provinciesSelect : 0,
                comarcaSelect: 0,
                checkedCataluna: true,
                tipusLocalitzacioSelect: 1,
                tipusLocalitzacio: [],
                detalls: null,
                disabledCheck: true,
                //Show
                tipusDeViaShow: null,
                nomShow: null,
                numeroShow: null,
                escalaShow: null,
                pisShow: null,
                portaShow: null,

                nomPuntSingular: null,

                nomCarreteraShow: null,
                puntKilometricShow: null,
                sentitShow: null,

                municipiNomShow: null,

                disabledDetalls: false
            }
        },
        created() {
            if(!this.show) {
                let meThis = this

                axios
                .get("/provincies")
                .then(response => {
                    for(let i = 0; i < response.data.length; i++) {
                        if(response.data[i].id >= 1 && response.data[i].id <=4) {
                            meThis.provincies.push(response.data[i])
                        }
                        else {
                            meThis.otrasProvincias.push(response.data[i])
                        }
                    }
                    meThis.comarques = meThis.provincies[this.provinciesSelect].comarques
                    meThis.municipis = meThis.provincies[this.provinciesSelect].comarques[this.comarcaSelect].municipis
                })
                .catch(error => {
                    console.log(error)
                })
                .finally(() => this.loading = false)

                axios
                .get("/tipus_localitzacions")
                .then(response => {
                    meThis.disabledCheck = false
                    meThis.tipusLocalitzacio = response.data
                })
                .catch(error => {
                    console.log(error)
                })
                .finally(() => this.loading = false)
            }
            else {
                if(this.localitzacioShow.provincia != null) {
                    let provincia = {
                        id: 1,
                        nom: this.localitzacioShow.provincia
                    }
                    this.provincies.push(provincia)
                    if(this.localitzacioShow.municipi != null) {
                        let municipi = {
                            id: 1,
                            nom: this.localitzacioShow.municipi
                        }
                        this.municipis.push(municipi);
                        let comarca = {
                            id: 1,
                            nom: this.localitzacioShow.comarca
                        }
                        this.comarques.push(comarca);
                    }
                }

                let tipus = {
                    id: 1,
                    tipus: this.tipusLocalitzacioShow.nomTipus
                }

                this.tipusLocalitzacio.push(tipus);

                this.tipusLocalitzacioSelect = this.tipusLocalitzacioShow.id

                switch(this.tipusLocalitzacioShow.id) {
                    case 1: //Carrers
                        this.tipusDeViaShow = this.tipusLocalitzacioShow.tipusDeVia
                        this.nomShow = this.tipusLocalitzacioShow.nom
                        this.numeroShow = this.tipusLocalitzacioShow.numero
                        this.escalaShow = this.tipusLocalitzacioShow.escala
                        this.pisShow = this.tipusLocalitzacioShow.pis
                        this.portaShow = this.tipusLocalitzacioShow.porta
                    break;
                    case 2: //Punt Singular
                        this.nomPuntSingular = this.tipusLocalitzacioShow.nomPuntSingular
                    break;
                    case 4: //Carretera
                        this.nomCarreteraShow= this.tipusLocalitzacioShow.nomCarretera
                        this.puntKilometricShow= this.tipusLocalitzacioShow.puntKilometric
                        this.sentitShow= this.tipusLocalitzacioShow.sentit

                    break;
                    case 5: //Provincia
                        this.checkedCataluna = false;
                        let otrasProvincia = {
                            id: 1,
                            nom: this.tipusLocalitzacioShow.provinciaNom
                        }
                        this.otrasProvincias.push(otrasProvincia)
                        this.municipiNomShow = this.tipusLocalitzacioShow.municipiNom
                    break;
                }

                this.disabledDetalls = true;
                this.detalls = this.cartaTrucadaShow.altres_ref_localitzacio;

            }


        },
        methods: {
            startTime() {
                this.$eventTime.$emit("start-time","message");
            },
            changeSelectProvincia() {
                console.log(2)
                this.provinciesSelect = 2;
            },
            resetLoction() {
                this.provinciesSelect = 0
                this.comarcaSelect = 0

                for(let i = 0; i < this.provincies.length; i++) {
                    if(this.provincies[i].id == 1) {
                        this.comarques = this.provincies[i].comarques
                        this.municipis = this.comarques[0].municipis
                    }

                }

                this.$eventClear.$emit("clear-select-id-location","clear");
            }
        },
        computed: {
            colReturn() {
                return this.$locateCol
            }
        },
        mounted() {
            this.$eventSelect.$on("change-select-provincia-location", idSelect => {

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


                this.$eventSelect.$emit("change-select-option-comarca-location",idComarcaSelect);
                this.$eventSelect.$emit("change-select-option-municipi-location",idMunicipiSelect);


            })

            this.$eventSelect.$on("change-select-comarca-location", idSelect => {
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
                if(idSelect != 0) {
                    this.$eventSelect.$emit("change-select-option-provincia-location",idProvincia);
                }
                this.$eventSelect.$emit("change-select-option-municipi-location",idMunicipiSelect);


            })

            this.$eventSelect.$on("change-select-municipi-location", idSelect => {
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

                if(idSelect != 0) {
                    this.$eventSelect.$emit("change-select-option-comarca-location",idComarcaSelect);
                    this.$eventSelect.$emit("change-select-option-provincia-location",idProvincia);
                }

            })

            this.$eventSelect.$on("change-select-localitzacio", idSelect => {

                this.tipusLocalitzacioSelect = idSelect

                if(idSelect == 5) {
                    this.checkedCataluna = false
                    this.$eventCheck.$emit("change-check-box-catalonia-false",false)
                    this.$eventSelect.$emit("change-select-localitzacio-provincia",5)
                }

            })

            this.$eventCheck.$on("change-check-box-catalonia", checkValor => {
                this.checkedCataluna = checkValor
                if(!this.checkedCataluna) {
                    this.$eventSelect.$emit("change-select-localitzacio-provincia",5)
                    this.tipusLocalitzacioSelect = 5
                }
                else {
                    this.$eventSelect.$emit("change-select-localitzacio-provincia",1)
                    this.tipusLocalitzacioSelect = 1
                }
            })

            this.$eventFinal.$on("obtener-detalls-location", message => {
                this.$eventFinal.$emit("recojer-detalls-location",this.detalls);
            })

            this.$eventClear.$on("clear-select-location", message => {
                this.resetLoction();
            })

            this.$eventClear.$on("clear-detalls", message => {
                this.detalls = null
            })

            this.$eventShow.$on("change-select-disabled", valor => {
                this.disabledCheck = valor
            })

            this.$eventExpedient.$on("obtener-id-tipus-location", message => {
                this.$eventExpedient.$emit("recojer-id-tipus-location",this.tipusLocalitzacioSelect);
            })

        }
    }
</script>
