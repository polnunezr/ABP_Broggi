<template>
    <div class="row" style="margin-top: 20px">
        <div class="col">
            <div class="form-check">
            <label class="form-check-label" :for="idCheck">
                {{ name }}
            </label>
            <input ref="checkBox" v-on:click="clickCheck" v-if="checked" class="form-check-input" type="checkbox" value=""
            :id="idCheck" checked v-model="checkValueChecked">
            <input v-else class="form-check-input" type="checkbox" value="" :id="idCheck" v-model="checkValue">
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        props: {
            name: {
                type: [String],
                require: true
            },
            idCheck: {
                type:[String],
                require: true
            },
            checked: Boolean
        },
        data() {
            return {
                checkValue: false,
                checkValueChecked: true,
            }
        },
        methods: {
            clickCheck() {
                if(this.name == this.$checkCatalonia) {
                    this.$eventCheck.$emit("change-check-box-catalonia",Boolean(this.$refs.checkBox.checked))
                }
            }
        },
        mounted() {
            this.$eventCheck.$on("change-check-box-catalonia-false", checkValor => {
                // this.$refs.checkBox.checked = false
                this.checkValueChecked = false
            })

            this.$eventFinal.$on("obtener-guardarInformacion", message => {
                if(this.idCheck == this.$checkSaveInformation) {
                    // console.log(this.checkValue)
                    this.$eventFinal.$emit("recojer-guardarInformacion",this.checkValue)
                }
            })

            this.$eventFinal.$on("obtener-catalonia", message => {
                if(this.idCheck == this.$checkCatalunya) {
                    this.$eventFinal.$emit("recojer-catalonia",this.checkValueChecked)
                }
            })
        }
    }
</script>
