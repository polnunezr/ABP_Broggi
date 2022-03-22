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
        }
    }
</script>
