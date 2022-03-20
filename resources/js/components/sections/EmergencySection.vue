<template>
    <div class="row d-flex justify-content-center">
        <div class="col col-8 colSection colEmergency">
            <div class="row">
                <div class="col">
                    <h4 v-text="title"></h4>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <data-select :name="this.$tipusEmergencia"
                    id_select="selectEmergencyGeneral" :arrayElements="tipusEmergencia"></data-select>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <data-select :name="this.$incidents"
                    id_select="selectEmergencySpecific" :arrayElements="incidents"></data-select>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        data() {
            return {
                title: "Tipus d'emergencia",
                tipusEmergencia: [],
                incidents: [],
                incidentSelect: 0
            }
        },
        created() {
            let meThis = this
            axios
            .get("/tipus_incidents")
            .then(response => {
                meThis.tipusEmergencia = response.data
                meThis.incidents = response.data[this.incidentSelect].incidents
            })
            .catch(error => {
                    console.log(error)
            })
            .finally(() => this.loading = false)
        },
        mounted() {
            this.$eventSelect.$on("change-select-incident", idSelect => {
                for(let i = 0; i < this.tipusEmergencia.length; i++) {
                    if(this.tipusEmergencia[i].id == idSelect) {
                      this.incidents =   this.tipusEmergencia[i].incidents
                    }
                }
            })
        }
    }
</script>
