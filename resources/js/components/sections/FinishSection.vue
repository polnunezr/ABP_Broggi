<template>
    <div id="finishSection">
        <button type="button" class="button">Cancelar</button>
        <button type="button" class="button" style="margin-left: 10px" v-on:click="clickFinish">Finalitzar</button>
    </div>
</template>

<script>
    export default {
        data() {
            return {
                finalDates: {
                    telefono: null
                }
            }
        },
        methods: {
            clickFinish() {
                this.$eventFinal.$emit("obtener-telefono","telefono");
            }
        },
        mounted() {
            this.$eventFinal.$on("recojer-telefono", telefono => {
                if(telefono != "" && telefono != null) {
                    this.finalDates.telefono = telefono
                }
                else {
                    this.finalDates.telefono = null
                }


            })
        }
    }
</script>
