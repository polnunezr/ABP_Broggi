<template>
    <div class="row form-row" style="margin-top: 20px">

        <div class="col d-flex align-items-center"
            v-bind:class="colSmall">
            <label :for="idInput">{{ name }}</label>
        </div>
        <div class="col"
            v-bind:class="colBig">
            <input v-if="number == false" type="text" class="form-control" :id="idInput" v-on:click="startTime" v-model="text"
            v-on:change="changeInput" :disabled="disabledInput">
            <input v-else maxlength="12" type="number" class="form-control noFlechaNumber" :id="idInput" v-on:click="startTime"
            v-model="text" v-on:change="changeInput" :disabled="disabledInput">
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
            show: {
                type:[Boolean],
                require: true
            },
            valor: {
                type:[String],
                require: true
            },
            small: Boolean,
            number: Boolean
        },
        data() {
            return {
                text: null,
                disabledInput: false

            }
        },
        created() {
            if(this.show) {
                this.disabledInput = true
                this.text = this.valor
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
            },
            changeInput() {
                switch(this.idInput) {
                    case this.$inputTelefon:
                        this.$eventPersonal.$emit("change-input-telefono",this.text);
                    break;
                    case this.$inputTipusDeVia:
                    case this.$inputNom:
                    case this.$inputNumero:
                    case this.$inputEscala:
                    case this.$inputPis:
                    case this.$inputPorta:
                    case this.$inputNomCarretera:
                    case this.$inputPuntKilometric:
                    case this.$inputSentit:
                    case this.$inputNomPuntSingular:
                    case this.$inputProvinciaMunicipi:

                        if(!this.number) {
                            let finish = false;
                            do {
                                if(this.text.includes(",")) {
                                    this.text = this.text.replace(",","")
                                }
                                else {
                                    finish = true
                                }
                            } while(!finish);
                        }
                        else {
                            if(parseInt(this.text)) {
                                let number = parseInt(this.text)
                                number = Math.round(number)
                                this.text = number.toString()
                            }
                        }


                    break;
                }

            }
        },
        mounted() {
            this.$eventFinal.$on("obtener-telefono", message => {
                if(this.idInput == this.$inputTelefon) {
                    this.$eventFinal.$emit("recojer-telefono",this.text);
                }

            })

            this.$eventExpedient.$on("obtener-telefono", message => {
                if(this.idInput == this.$inputTelefon) {
                    this.$eventExpedient.$emit("recojer-telefono",this.text);
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

            this.$eventPersonal.$on("disabled-input-adreca", disabled => {
                if(this.idInput == this.$inputAdreca) {
                    this.disabledInput = disabled
                }
            })


            this.$eventFinal.$on("obtener-origen-llamada", message => {
                if(this.idInput == this.$inputOrigen) {
                    this.$eventFinal.$emit("recojer-origen-llamada",this.text);
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

            this.$eventFinal.$on("obtener-carretera-punt-kilometric", message => {
                if(this.idInput == this.$inputPuntKilometric) {
                    this.$eventFinal.$emit("recojer-carretera-punt-kilometric",this.text);
                }
            })

            this.$eventFinal.$on("obtener-carretera-sentit", message => {
                if(this.idInput == this.$inputSentit) {
                    this.$eventFinal.$emit("recojer-carretera-sentit",this.text);
                }
            })

            this.$eventFinal.$on("obtener-provincia-municipi", message => {
                if(this.idInput == this.$inputProvinciaMunicipi) {
                    this.$eventFinal.$emit("recojer-provincia-municipi",this.text);
                }
            })

            this.$eventClear.$on("clear-input-text", message => {
                this.text = null
            })


            this.$eventPersonal.$on("set-adreca", adreca => {
                if(this.idInput == this.$inputAdreca) {
                    this.text = adreca
                }
            })


        }
    }
</script>
