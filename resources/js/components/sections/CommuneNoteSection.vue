<template>
    <div class="row d-flex justify-content-center">
        <div class="col colSection colCommuneNote"
        v-bind:class="colReturn">
            <div class="row">
                <div class="col">
                    <h4 v-text="title"></h4>
                </div>
            </div>
            <div class="row" style="margin-top: 20px">
                <div class="col">
                    <div class="form-floating">
                        <textarea v-on:click="startTime" class="form-control" id="textAreaCommuneNote"
                        style="height: 200px; resize:none" v-model="notaComuna" :disabled="disabledNotaComuna"></textarea>
                    </div>
                </div>
            </div>

        </div>
    </div>
</template>

<script>
    export default {
        props: {
            cartaTrucadaShow: {
                type: [Object],
                require: true
            },
            show: {
                type: [Boolean],
                require: true
            }
        },
        created() {
            if(this.show) {
                this.notaComuna = this.cartaTrucadaShow.nota_comuna;
                this.disabledNotaComuna = true;
            }
        },
        data() {
            return {
                title: "Nota comuna",
                notaComuna: null,
                disabledNotaComuna: false
            }
        },
        methods: {
            startTime() {
                this.$eventTime.$emit("start-time","message");
            }
        },
        computed: {
            colReturn() {
                return this.$communeNoteCol
            }
        },
        mounted() {
            this.$eventFinal.$on("obtener-nota-comuna", message => {
                this.$eventFinal.$emit("recojer-nota-comuna",this.notaComuna);
            })

            this.$eventClear.$on("clear-nota-comuna", message => {
                this.notaComuna = null
            })

        }
    }
</script>
