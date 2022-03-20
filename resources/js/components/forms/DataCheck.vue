<template>
    <div class="row" style="margin-top: 20px">
        <div class="col">
            <div class="form-check">
            <label class="form-check-label" :for="id_check">
                {{ name }}
            </label>
            <input ref="checkBox" v-on:click="clickCheck" v-if="checked" class="form-check-input" type="checkbox" value="" :id="id_check" checked>
            <input v-else class="form-check-input" type="checkbox" value="" :id="id_check">
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
            id_check: {
                type:[String],
                require: true
            },
            checked: Boolean
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
                this.$refs.checkBox.checked = false
            })
        }
    }
</script>
