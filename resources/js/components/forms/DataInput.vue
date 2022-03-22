<template>
    <div class="row form-row" style="margin-top: 20px">

        <div class="col d-flex align-items-center"
            v-bind:class="colSmall">
            <label :for="idInput">{{ name }}</label>
        </div>
        <div class="col"
            v-bind:class="colBig">
            <input v-if="number == false" type="text" class="form-control" :id="idInput" v-on:click="startTime" v-model="text">
            <input v-else maxlength="12" type="number" class="form-control noFlechaNumber" :id="idInput" v-on:click="startTime" v-model="text" >
        </div>
    </div>
</template>

<script>
    export default {
        props: {
            name: {
                type:[String],
                require: true
            },
            idInput: {
                type:[String],
                require: true
            },
            small: Boolean,
            number: Boolean
        },
        data() {
            return {
                text: null
            }
        },
        computed: {
            colSmall() {
                let response = "";
                if(this.small == false) {
                    response = "col-1"
                }
                else {
                    response = "col-2"
                }
                return response;
            },
            colBig() {
                let response = "";
                if(this.small == false) {
                    response = "col-11"
                }
                else {
                    response = "col-10"
                }
                return response;
            }
        },
        methods: {
            startTime() {
                this.$eventTime.$emit("start-time","message");
            }
        },
        mounted() {
            this.$eventFinal.$on("obtener-telefono", message => {

                if(this.idInput == this.$inputTelefon) {
                    this.$eventFinal.$emit("recojer-telefono",this.text);
                }

            })

            this.$eventFinal.$on("obtener-procedencia", message => {

                if(this.idInput == this.$inputProcedencia) {
                    this.$eventFinal.$emit("recojer-procedencia",this.text);
                }
            })

            this.$eventFinal.$on("obtener-adreca", message => {
                if(this.idInput == this.$inputAdreca) {
                    this.$eventFinal.$emit("recojer-adreca",this.text);
                }
            })

            this.$eventFinal.$on("obtener-carrer-tipusDeVia", message => {
                if(this.idInput == this.$inputTipusDeVia) {
                    this.$eventFinal.$emit("recojer-carrer-tipusDeVia",this.text);
                }
            })

            this.$eventFinal.$on("obtener-carrer-nom", message => {
                if(this.idInput == this.$inputNom) {
                    this.$eventFinal.$emit("recojer-carrer-nom",this.text);
                }
            })

            this.$eventFinal.$on("obtener-carrer-numero", message => {
                if(this.idInput == this.$inputNumero) {
                    this.$eventFinal.$emit("recojer-carrer-numero",this.text);
                }
            })

            this.$eventFinal.$on("obtener-carrer-escala", message => {
                if(this.idInput == this.$inputEscala) {
                    this.$eventFinal.$emit("recojer-carrer-escala",this.text);
                }
            })

            this.$eventFinal.$on("obtener-carrer-pis", message => {
                if(this.idInput == this.$inputPis) {
                    this.$eventFinal.$emit("recojer-carrer-pis",this.text);
                }
            })

            this.$eventFinal.$on("obtener-carrer-porta", message => {
                if(this.idInput == this.$inputPorta) {
                    this.$eventFinal.$emit("recojer-carrer-porta",this.text);
                }
            })

            this.$eventFinal.$on("obtener-punt-singular-nom", message => {
                if(this.idInput == this.$inputNomPuntSingular) {
                    this.$eventFinal.$emit("recojer-punt-singular-nom",this.text);
                }
            })

            this.$eventFinal.$on("obtener-carretera-nom", message => {
                if(this.idInput == this.$inputNomCarretera) {
                    this.$eventFinal.$emit("recojer-carretera-nom",this.text);
                }
            })
        }
    }
</script>
