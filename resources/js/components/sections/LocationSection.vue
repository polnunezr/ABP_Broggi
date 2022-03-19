<template>
    <div class="row d-flex justify-content-center">
        <div class="col col-10 colSection colLocation">
            <div class="row">
                <div class="col">
                    <h4 v-text="title"></h4>
                </div>
            </div>

            <data-check name="Catalunya" id_check="checkCatalunya"></data-check>

            <div class="row">
                <div class="col">
                    <data-select name="Provincia" id_select="provinciaSelect" :arrayElements = "provincies" small></data-select>
                </div>
                <div class="col">
                    <data-select name="Comarca" id_select="comarcaSelect" :arrayElements = "comarques" small></data-select>
                </div>
                <div class="col">
                    <data-select name="Municipi" id_select="municipiSelect" :arrayElements = "municipis" small></data-select>
                </div>
            </div>

            <data-input name="Direccio" id_input="inputDireccio"></data-input>

            <div class="row" style="margin-top: 20px">
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
                title: "Localitzacióa",
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
                })
                .catch(error => {
                    console.log(error)
                })
                .finally(() => this.loading = false)

            // axios
            //     .get("/comarques/" + meThis.provinciesSelect)
            //     .then(response => {
            //         meThis.comarques = response.data
            //     })
            //     .catch(error => {
            //         console.log(error)
            //     })
            //     .finally(() => this.loading = false)






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
        }
    }
</script>
