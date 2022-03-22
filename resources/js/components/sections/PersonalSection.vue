<template>
    <div class="row d-flex justify-content-center">
        <div class="col col-11 colSection colPersonalDates">
            <div class="row">
                <div class="col colTitle">
                    <h4 v-text="title"></h4>
                </div>
            </div>

            <data-input name="Telefon" :idInput="this.$inputTelefon" small number></data-input>

            <data-input name="Procedencia" idInput="inputProcedencia" small></data-input>



            <div class="row">
                <div class="col">
                   <data-select :name="this.$provincia" :idSelect="this.$provinciaPersonal" :arrayElements = "provincies"></data-select>
                </div>
                <div class="col">
                    <data-select :name="this.$comarca" :idSelect="this.$comarcaPersonal" :arrayElements = "comarques"></data-select>
                </div>
                <div class="col">
                   <data-select :name="this.$municipi" :idSelect="this.$municipiPersonal" :arrayElements = "municipis"></data-select>
                </div>
            </div>


            <data-input name="Adreça" idInput="inputAdresa" small></data-input>

            <div class="row" style="margin-top: 40px">
                <div class="col">
                    <div class="form-floating">
                        <textarea class="form-control" id="textAreaAntecedents"
                        style="height: 130px; resize: none" v-on:click="startTime"></textarea>
                        <label for="textAreaAntecedents">Antecedents</label>
                    </div>
                </div>
            </div>

            <data-check name="Guardar informació" id_check="checkSaveInformation"></data-check>


        </div>
    </div>
</template>

<script>
    export default {
        data() {
            return {
                title: "Dades personals",
                provincies: [],
                comarques: [],
                municipis: [],
                provinciesSelect : 0,
                comarcaSelect: 0
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

                    // meThis.firstProvincia = meThis.provincies[0]
                    // meThis.firstComarques = meThis.comarques[0]
                    // meThis.firstMunicipis = meThis.municipis[0]

                    // meThis.provincies.shift();
                    // meThis.comarques.shift();
                    // meThis.municipis.shift();

                })
                .catch(error => {
                    console.log(error)
                })
                .finally(() => this.loading = false)
        },
        methods: {
            startTime() {
                this.$eventTime.$emit("start-time","message");
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

        }
    }
</script>
