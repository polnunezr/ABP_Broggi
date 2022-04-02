<template>
    <div>
       <!--<map-section v-bind:style="mapOpen == true ? 'display: block;' : 'display: none;'"
       ></map-section>-->
       <map-section v-if="mapOpen" :selectMarks="selectMarks"
       ></map-section>
       <div id="backdropRelation" v-if="backdropRelationOpen"></div>
        <relation-modal v-bind:style="modalOpen == true ? 'display: block;' : 'display: none;'" :expedients="expedients"></relation-modal>
        <finish-section  v-if="selectSection != interactiveVideo"></finish-section>
        <div class="container-fluid">
            <div class="row">

                <div class="col col-2 colCard colNavBarHorizontal">
                    <tab-apart></tab-apart>


                </div>
                <div v-bind:class = "selectSection != interactiveVideo ? 'col col-7 colCard' : 'col col-10 colCard'">

                    <div v-if="selectSection != interactiveVideo && alertShow == true">
                        <alert-section :mensajeAlert="mensajeAlert" :alertDanger="alertDanger"
                        :selectSectionCreate="selectSection"></alert-section>
                    </div>

                    <div v-bind:style="selectSection == personalData ? 'display: block;' : 'display: none;'">
                        <personal-section></personal-section>
                    </div>
                    <div v-bind:style="selectSection == locate ? 'display: block;' : 'display: none;'">
                        <location-section :marginTopLocation="marginTopLocation"></location-section>
                    </div>
                    <div v-bind:style="selectSection == agency ? 'display: block;' : 'display: none;'">
                        <agency-section :selectMarks = "selectMarks" :agencies="agencies"></agency-section>
                    </div>
                    <div v-bind:style="selectSection == emergency ? 'display: block;' : 'display: none;'">
                        <emergency-section></emergency-section>
                    </div>
                    <div v-bind:style="selectSection == communeNote ? 'display: block;' : 'display: none;'">
                        <commune-note-section></commune-note-section>
                    </div>
                    <div v-bind:style="selectSection == relationExpedient ? 'display: block;' : 'display: none;'">
                        <relation-section></relation-section>
                    </div>
                    <div v-bind:style="selectSection == interactiveVideo ? 'display: block;' : 'display: none;'">
                        <video-section></video-section>
                    </div>


                </div>

                <time-section v-if="selectSection != interactiveVideo"></time-section>


            </div>
        </div>
    </div>
</template>

<script>
    export default {
        data() {
            return {
                selectSection: this.$dadesPersonals,
                personalData: this.$dadesPersonals,
                locate: this.$locate,
                agency: this.$agency,
                emergency: this.$emergency,
                communeNote:this.$communeNote,
                relationExpedient: this.$relationExpedient,
                interactiveVideo: this.$interactiveVideo,
                modalOpen: false,
                expedients: [],
                alertShow: false,
                alertDanger: true,
                mensajeAlert: [],
                marginTopLocation: 30,
                telefon: null,
                municipiLocation: null,
                incident: null,
                mapOpen: false,
                selectMarks: [],
                agencies: [],
                backdropRelationOpen: false
            }
        },
        created() {

        },
        mounted() {
            this.$eventTime.$on("change-section", section => {
                this.selectSection = section
                if(section == this.$locate && this.alertShow == false) {

                    this.marginTopLocation = 30
                }
            })

            this.$eventRelation.$on("open-valor-modal", message => {

                this.backdropRelationOpen = true

                let vueThis = this;

                this.expedients = []

                //telefon
                this.$eventExpedient.$emit("obtener-telefono","telefono");
                //municipi locate
                this.$eventExpedient.$emit("obtener-id-municipi-location","municipilocation");
                //emergency
                this.$eventExpedient.$emit("obtener-id-incident","incident");

                let expedientCheck = false;

                axios
                .get("/expedients")
                .then(response => {
                    for(let i = 0; i < response.data.length; i++) {
                        for(let j = 0; j < response.data[i].cartesTrucada.length; j++) {
                            if(((response.data[i].cartesTrucada[j].telefon == vueThis.telefon &&
                            response.data[i].cartesTrucada[j].telefon != null) ||
                            (response.data[i].cartesTrucada[j].municipis_id == vueThis.municipiLocation &&
                            response.data[i].cartesTrucada[j].municipis_id != null) ||
                            (response.data[i].cartesTrucada[j].incidents_id == vueThis.incident &&
                            response.data[i].cartesTrucada[j].incidents_id != null)) &&
                            (vueThis.expedientCheck == false)) {
                                vueThis.expedients.push(response.data[i])
                                vueThis.expedientCheck = true;
                            }
                        }
                        vueThis.expedientCheck = false
                    }
                    // vueThis.$eventRelation.$emit("get-expedients-in-section",response.data);
                    vueThis.modalOpen = true
                    vueThis.$eventRelation.$emit("edit-view-modal","modal");
                })
                .catch(error => {
                    console.log(error)
                })
                .finally(() => this.loading = false)


            })

            this.$eventRelation.$on("close-modal", message => {
                this.backdropRelationOpen = false
                this.modalOpen = false
            })

            this.$eventAlert.$on("open-alert", mensajeAlert => {
                // this.$selectSection = this.selectSection
                this.alertDanger = true
                this.mensajeAlert = mensajeAlert
                this.alertShow = true

            })

            this.$eventAlert.$on("close-alert", message => {
                this.alertDanger = true
                this.mensajeAlert = []
                this.alertShow = false
                this.marginTopLocation = 30
            })

            this.$eventAlert.$on("change-margin-top-locate", marginTop => {
                this.marginTopLocation = marginTop
            })

            this.$eventAlert.$on("open-alert-carta-insert", mensajeAlert => {
                this.alertDanger = false
                this.mensajeAlert = mensajeAlert
                this.alertShow = true

            })

            this.$eventExpedient.$on("recojer-telefono", telefono => {
                if(telefono != "" && telefono != null) {
                    this.telefon = telefono
                }
                else {
                    this.telefon = null
                }
            })

            this.$eventExpedient.$on("recojer-id-municipi-location", municipiLocation => {
                if(municipiLocation == 0) {
                    this.municipiLocation = null
                }
                else {
                    this.municipiLocation = municipiLocation
                }
            })

            this.$eventExpedient.$on("recojer-id-incident", incident => {
                if(incident == 0) {
                    this.incident = null
                }
                else {
                    this.incident = incident
                }
            })

            this.$eventMap.$on("open-map", mapOpen => {
                this.mapOpen = mapOpen
            })

            this.$eventMap.$on("close-map", selectMarks => {
                this.mapOpen = false;
                this.selectMarks = selectMarks
            })

            this.$eventMap.$on("send-agencies", agencies => {
                this.agencies = agencies;
            })

            this.$eventMap.$on("delete-select-mark", idAgency => {
                let positionDelete = null
                for(let i = 0; i < this.selectMarks.length; i++) {
                    if(this.selectMarks[i] == idAgency) {
                        positionDelete = i;
                    }
                }
                this.selectMarks.splice(positionDelete,1);
            })

            this.$eventClear.$on("clear-select-mark", message => {
                this.selectMarks = [];
            })

            this.$eventFinal.$on("obtener-id-agencies", message => {
                this.$eventFinal.$emit("recojer-id-agencies",this.selectMarks);
            })

            // this.$eventAlert.$on("get-section-selected", message => {
            //     debugger;
            //     let a = 4
            //     if(a == 4) {

            //     }


            // })
        }
    }
</script>
