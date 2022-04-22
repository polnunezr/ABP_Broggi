<template>
    <div class="row">
        <div class="col colAlert"
            v-bind:class="colReturn">
            <div class="alert alert-dismissible fade show"
            v-bind:class="classAlert"
            role="alert" :style="{'margin-left': marginLeftAlert + 'px','margin-right': marginRightAlert + 'px'}">
                <p v-for="mensajesAlert in mensajeAlert" :key="mensajesAlert.id">
                    {{mensajesAlert.text}}
                </p>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"
                v-on:click="clickAlert"></button>
            </div>

        </div>
    </div>
</template>

<script>
    export default {
        props: {
            mensajeAlert: {
                type: [Array],
                require: true
            },
            alertDanger: {
                type: [Boolean],
                require: true
            },
            selectSectionCreate: {
                type: [String],
                require: true
            }
        },
        created() {
            this.changeMargin(this.selectSectionCreate)
        },
        data() {
            return {
                selectSection: this.$dadesPersonals,
                marginLeftAlert: 0,
                marginRightAlert: 0,
                change: false
            }
        },
        methods: {
            clickAlert() {
                this.$eventAlert.$emit("close-alert","closeAlert");
            },
            changeMargin(section) {
                switch(section) {
                    case this.$dadesPersonals:
                        this.marginLeftAlert = 0
                        this.marginRightAlert = 0
                        break;
                    case this.$locate:
                        this.marginLeftAlert = 6
                        this.marginRightAlert = 0
                        this.$eventAlert.$emit("change-margin-top-locate",0);
                        break;
                    case this.$agency:
                        this.marginLeftAlert = 150
                        this.marginRightAlert = 0
                        break;
                    case this.$emergency:
                        this.marginLeftAlert = 140
                        this.marginRightAlert = 0
                        break;
                    case this.$communeNote:
                        this.marginLeftAlert = 90
                        this.marginRightAlert = 0
                        break;
                    case this.$relationExpedient:
                        this.marginLeftAlert = 140
                        this.marginRightAlert = 0
                        break;
                }
            }
        },
        mounted() {
            // this.$eventAlert.$on("set-section-selected", section => {
            //     debugger;
            //     this.changeMargin(section)
            //     this.selectSection = section
            // })

            this.$eventAlert.$on("change-section", section => {
                // debugger;
                this.change = true
                this.changeMargin(section)
                this.selectSection = section

            })


        },
        computed: {
            classAlert() {
                let response
                if(this.alertDanger == true) {
                    response = "alert-danger"
                }
                else {
                    response = "alert-success"
                }

                return response;

            },
            colReturn() {
                let response = ""
                let section = ""
                if(!this.change) {
                    section = this.selectSectionCreate
                }
                else {
                    section = this.selectSection
                }
                switch(section) {
                    case this.$dadesPersonals:
                        response= this.$dadesPersonalsCol
                        break;
                    case this.$locate:
                        response= this.$locateCol
                        break;
                    case this.$agency:
                        response= this.$agencyCol
                        break;
                    case this.$emergency:
                        response= this.$emergencyCol
                        break;
                    case this.$communeNote:
                        response= this.$communeNoteCol
                        break;
                    case this.$relationExpedient:
                        response= this.$relationExpedientCol
                        break;
                }

                return response;
            }
        }

    }
</script>
