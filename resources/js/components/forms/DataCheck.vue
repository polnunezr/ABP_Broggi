<template>
    <div class="row" style="margin-top: 20px">
        <div class="col">
            <div class="form-check">
            <label class="form-check-label" :for="idCheck">
                {{ name }}
            </label>
            <input ref="checkBox" v-on:click="clickCheck" v-if="checked" class="form-check-input" type="checkbox" value=""
            :id="idCheck" checked v-model="checkValueChecked" :disabled="disabledCheck">
            <input v-else class="form-check-input" type="checkbox" value="" :id="idCheck" v-model="checkValue"
            :disabled="disabledCheck">
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
            show: {
                type:[Boolean],
                require: true
            },
            tipusLocalitzacioSelect: {
                type:[Number],
                require: true
            },
            disabledCheck: {
                type:[Boolean],
                require: true
            },
            checked: Boolean
        },
        created() {
            if(this.show) {
                // this.disabledCheck = true;
                this.$eventShow.$emit("change-select-disabled",true);
                if(this.tipusLocalitzacioSelect == 5) {
                    this.checked = false
                }
            }
        },
        data() {
            return {
                checkValue: false,
                checkValueChecked: true
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
                    this.$eventFinal.$emit("recojer-guardarInformacion",this.checkValueChecked)
                }
            })

            this.$eventFinal.$on("obtener-catalonia", message => {
                if(this.idCheck == this.$checkCatalunya) {
                    this.$eventFinal.$emit("recojer-catalonia",this.checkValueChecked)
                }
            })

            this.$eventClear.$on("clear-check-catalonia", message => {
                if(!this.$refs.checkBox.checked) {
                    this.$refs.checkBox.checked = true;
                    this.checkValueChecked = true
                    this.clickCheck();
                }
            })

            this.$eventClear.$on("clear-check-information-save", message => {
                if(this.idCheck == this.$checkSaveInformation) {
                    this.$refs.checkBox.checked = true;
                    this.checkValueChecked = true;
                }
            })
        }
    }
</script>
