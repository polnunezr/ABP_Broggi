<template>
    <div class="row d-flex justify-content-center">
        <div class="col colSection colEmergency"
        v-bind:class="colReturn">
            <div class="row">
                <div class="col">
                    <h4 v-text="title"></h4>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <data-select :name="this.$tipusEmergencia"
                    :idSelect="this.$tipusEmergenciaId" :arrayElements="tipusEmergencia"
                    :show="show"></data-select>
                </div>
            </div>
            <div class="row" style="margin-bottom: 50px">
                <div class="col">
                    <data-select :name="this.$incidents"
                    :idSelect="this.$incidentsId" :arrayElements="incidents"
                    :show="show"></data-select>
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
        props: {
            incidentShow: {
                type:[Object],
                require: true
            },
            show: {
                type:[Boolean],
                require: true
            }
        },
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
            if(!this.show) {
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
            }
            else {
                let emergencia = {
                    id: 1,
                    descripcio: this.incidentShow.tipusIncidentDescripcio
                }
                this.tipusEmergencia.push(emergencia)

                let incidentElement = {
                    id: 1,
                    descripcio: this.incidentShow.incident.descripcio
                }
                this.incidents.push(incidentElement);
                this.incident = this.incidentShow.incident;
            }



        },
        mounted() {

            let idEmergenciaSelect = 1;
            let idIncidentSelect = 1;

            this.$eventSelect.$on("change-select-emergencia", idSelect => {

                for(let i = 0; i < this.tipusEmergencia.length; i++) {
                    if(this.tipusEmergencia[i].id == idSelect) {
                        idEmergenciaSelect = this.tipusEmergencia[i].id
                        this.incidents = this.tipusEmergencia[i].incidents
                        idIncidentSelect = this.tipusEmergencia[i].incidents[0].id
                    }
                }

                for(let i = 0; i < this.incidents.length; i++) {
                    if(this.incidents[i].id == idIncidentSelect) {
                        this.incident = this.incidents[i]
                    }
                }

                this.$eventSelect.$emit("change-select-id-emergencia",idEmergenciaSelect)
                this.$eventSelect.$emit("change-select-id-incident",idIncidentSelect)
            })

            this.$eventSelect.$on("change-select-incident", idSelect => {

                let idIncidentSelect = 1;

                for(let i = 0; i < this.incidents.length; i++) {
                    if(this.incidents[i].id == idSelect) {
                      this.incident = this.incidents[i]
                      idIncidentSelect = this.incidents[i].id
                    }
                }

            })


            this.$eventClear.$on("clear-select-emergencia", message => {
                for(let i = 0; i < this.tipusEmergencia.length; i++) {
                    if(this.tipusEmergencia[i].id == 1) {
                        this.incidents = this.tipusEmergencia[i].incidents
                    }
                }

                this.incident = this.incidents[0]

                this.$eventSelect.$emit("change-select-id-emergencia",1)
                this.$eventSelect.$emit("change-select-id-incident",1)
            })
        },
        computed: {
            colReturn() {
                return this.$emergencyCol
            }
        },
    }
</script>
