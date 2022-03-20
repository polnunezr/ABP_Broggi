<template>
    <div class="row d-flex justify-content-center">
        <div class="col col-11 colSection colLocation">
            <div class="row">
                <div class="col colTitle">
                    <h4 v-text="title"></h4>
                </div>
            </div>

            <data-check :name="this.$checkCatalonia" id_check="checkCatalunya" checked></data-check>

            <div class="row" v-if="checkedCataluna">
                <div class="col">
                    <data-select :name="this.$provincia" id_select="provinciaSelect" :arrayElements = "provincies" small></data-select>
                </div>
                <div class="col">
                    <data-select :name="this.$comarca" id_select="comarcaSelect" :arrayElements = "comarques" small></data-select>
                </div>
                <div class="col">
                    <data-select :name="this.$municipi" id_select="municipiSelect" :arrayElements = "municipis" small></data-select>
                </div>
            </div>

            <!--<data-input name="Direccio" id_input="inputDireccio"></data-input>-->

            <data-select :name="this.$tipusLocalitzacio" id_select="tipusLocalitzacioSelect"
            :arrayElements = "tipusLocalitzacio" style="margin-top: 30px; marginBottom: 20px;"></data-select>

            <div v-if="checkedCataluna == false">
                <data-input name="Provincia" id_input="inputProvincia" small></data-input>
                <data-input name="Municipi" id_input="inputMunicipi" small></data-input>
            </div>

            <div v-if="tipusLocalitzacioSelect == 1">
                <data-input name="Tipus de via" id_input="inputTipusDeVia" small></data-input>
                <data-input name="Nom" id_input="inputNom" small></data-input>
                <data-input name="Número" id_input="inputNumero" small></data-input>
                <data-input name="Escala" id_input="inputEscala" small></data-input>
                <data-input name="Pis" id_input="inputPis" small></data-input>
                <data-input name="Porta" id_input="inputPorta" small></data-input>
            </div>

            <div v-else-if="tipusLocalitzacioSelect == 4">
                <data-input name="Nom carretera" id_input="inputNomCarretera" small></data-input>
                <data-input name="Punt kilomètric " id_input="inputPuntKilometric" small></data-input>
                <data-input name="Sentit" id_input="inputSentit" small></data-input>
            </div>

            <div v-else-if="tipusLocalitzacioSelect == 2">
                <data-input name="Nom" id_input="inputNomPuntSingular" small></data-input>
            </div>

            <div class="row" style="margin-top: 40px">
                <div class="col">
                    <div class="form-floating">
                        <textarea class="form-control" id="textAreaDetalls"
                        style="height: 130px; resize: none" v-on:click="startTime"></textarea>
                        <label for="textAreaDetalls">Detalls</label>
                    </div>
                </div>
            </div>

        </div>
    </div>

</template>

<script>
    export default {
        data() {
            return {
                title: "Localització",
                provincies: [],
                comarques: [],
                municipis: [],
                provinciesSelect : 0,
                comarcaSelect: 0,
                checkedCataluna: true,
                tipusLocalitzacioSelect: 1,
                tipusLocalitzacio: []
            }
        },
        created() {
            let meThis = this

            axios
                .get("/provincies")
                .then(response => {
                    meThis.provincies = response.data
                    meThis.comarques = response.data[this.provinciesSelect].comarques
                    meThis.municipis = response.data[this.provinciesSelect].comarques[this.comarcaSelect].municipis
                })
                .catch(error => {
                    console.log(error)
                })
                .finally(() => this.loading = false)

            axios
                .get("/tipus_localitzacions")
                .then(response => {
                    meThis.tipusLocalitzacio = response.data
                })
                .catch(error => {
                    console.log(error)
                })
                .finally(() => this.loading = false)

        },
        methods: {
            startTime() {
                this.$eventTime.$emit("start-time","message");
            },
            changeSelectProvincia() {
                console.log(2)
                this.provinciesSelect = 2;
            }
        },
        mounted() {
            this.$eventSelect.$on("change-select-provincia", idSelect => {

                this.provinciesSelect = idSelect;

                for(let i = 0; i < this.provincies.length; i++) {
                    if(this.provincies[i].id == this.provinciesSelect) {
                        this.comarques = this.provincies[i].comarques
                        this.municipis = this.provincies[i].comarques[0].municipis
                    }
                }
                // this.provinciesSelect = idSelect - 1;
                // this.comarques = this.provincies[this.provinciesSelect].comarques
                // this.municipis = this.provincies[this.provinciesSelect].comarques[this.comarcaSelect].municipis


            })

            this.$eventSelect.$on("change-select-comarca", idSelect => {
                this.comarcaSelect = idSelect;

                for(let i = 0; i < this.comarques.length; i++) {
                    if(this.comarques[i].id == this.comarcaSelect) {
                        this.municipis = this.comarques[i].municipis
                    }

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
        }
    }
</script>
