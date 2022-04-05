<template>
    <div class="row">
        <div class="col col-4">
        </div>
        <div class="col col-6 col colHelpBox p-0 d-flex">
            <div class="container-fluid" id="containerHelpBox">
                <help-box-question v-for="audio in audios" :key="audio.id"
                :url="audio.url" :text="audio.text">
                </help-box-question>
                <div id="divSpinnerHelpBox">
                    <div v-if="loaded == false" class="spinner-border spinner" role="status">
                        <span class="sr-only">Loading...</span>
                    </div>
                </div>

            </div>
        </div>
    </div>
</template>

<script>
    export default {
        props: {
            selectTab: {
                type: [Number],
                require: true
            }
        },
        data() {
            return {
                audios: null,
                loaded: false,
                selectTabActual: null,
                cartes_trucades_partes: null
            }
        },
        created() {
            let vueThis = this
            axios
            .get("/cartes_trucades_partes")
            .then(response => {
                vueThis.cartes_trucades_partes = response.data
                for(let i = 0; i < response.data.length; i++) {
                    if(response.data[i].id == vueThis.selectTab) {
                        vueThis.audios = response.data[i].audios
                        vueThis.loaded = true
                    }
                }
            })
            .catch(error => {
                    console.log(error)
            })
            .finally(() => this.loading = false)
        },
        mounted() {
            this.$eventHelpBox.$on("change-section-in-help-box", selectTabActual => {
                this.selectTabActual = selectTabActual
                for(let i = 0; i < this.cartes_trucades_partes.length; i++) {
                    if(this.cartes_trucades_partes[i].id == selectTabActual) {
                        this.audios = this.cartes_trucades_partes[i].audios
                    }
                }
            })
        }

    }
</script>
