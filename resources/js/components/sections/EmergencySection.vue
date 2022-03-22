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
                    :idSelect="this.$tipusEmergenciaId" :arrayElements="tipusEmergencia"
                   ></data-select>
                </div>
            </div>
            <div class="row" style="margin-bottom: 50px">
                <div class="col">
                    <data-select :name="this.$incidents"
                    :idSelect="this.$incidentsId" :arrayElements="incidents"
                    ></data-select>
                </div>
            </div>
            <data-emergency firstText="Codi" :secondText="incident.codi"></data-emergency>
            <data-emergency firstText="Descripcio" :secondText="incident.descripcio"></data-emergency>
            <data-emergency firstText="Definicio" :secondText="incident.definicio"></data-emergency>
            <data-emergency firstText="Instrucions" :secondText="incident.instrucions"></data-emergency>
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
                incidentSelect: 0,
                incident: {}
            }
        },
        created() {
            let meThis = this
            axios
            .get("/tipus_incidents")
            .then(response => {
                meThis.tipusEmergencia = response.data
                meThis.incidents = response.data[this.incidentSelect].incidents
                meThis.incident = response.data[this.incidentSelect].incidents[0]
            })
            .catch(error => {
                    console.log(error)
            })
            .finally(() => this.loading = false)
        },
        mounted() {
            this.$eventSelect.$on("change-select-emergencia", idSelect => {
                for(let i = 0; i < this.tipusEmergencia.length; i++) {
                    if(this.tipusEmergencia[i].id == idSelect) {
                      this.incidents = this.tipusEmergencia[i].incidents
                      this.incident = this.tipusEmergencia[i].incidents[0]
                    }
                }
            })

            this.$eventSelect.$on("change-select-incident", idSelect => {
                for(let i = 0; i < this.incidents.length; i++) {
                    if(this.incidents[i].id == idSelect) {
                      this.incident = this.incidents[i]
                    }
                }
            })
        }
    }
</script>
