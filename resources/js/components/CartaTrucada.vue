<template>
    <div>
        <relation-modal v-bind:style="modalOpen == true ? 'display: block;' : 'display: none;'" :expedients="expedients"></relation-modal>
        <finish-section  v-if="selectSection != interactiveVideo"></finish-section>
        <div class="container-fluid">
            <div class="row">

                <div class="col col-2 colCard colNavBarHorizontal">
                    <tab-apart></tab-apart>


                </div>
                <div v-bind:class = "selectSection != interactiveVideo ? 'col col-7 colCard' : 'col col-10 colCard'">
                    <div v-bind:style="selectSection == personalData ? 'display: block;' : 'display: none;'">
                        <personal-section></personal-section>
                    </div>
                    <div v-bind:style="selectSection == locate ? 'display: block;' : 'display: none;'">
                        <location-section></location-section>
                    </div>
                    <div v-bind:style="selectSection == agency ? 'display: block;' : 'display: none;'">
                        <agency-section></agency-section>
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
                selectSection: "Dades Personals",
                personalData: "Dades Personals",
                locate: "Localitzacio",
                agency: "Agencies",
                emergency: "Emergencia",
                communeNote: "Nota comuna",
                relationExpedient: "Relacionar Expedient",
                interactiveVideo: "video",
                modalOpen: false,
                expedients: []
            }
        },
        mounted() {
            this.$eventTime.$on("change-section", section => {
                this.selectSection = section
            })

            this.$eventRelation.$on("open-valor-modal", message => {

                let vueThis = this;

                axios
                .get("/expedients")
                .then(response => {
                    vueThis.expedients = response.data
                    vueThis.$eventRelation.$emit("get-expedients-in-section",response.data);
                    vueThis.modalOpen = true
                })
                .catch(error => {
                    console.log(error)
                })
                .finally(() => this.loading = false)


            })

            this.$eventRelation.$on("close-modal", message => {
                this.modalOpen = false

            })
        }
    }
</script>
