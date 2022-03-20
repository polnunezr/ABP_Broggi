<template>
    <div class="row d-flex justify-content-center">
        <div class="col col-10 colSection colPersonalDates">
            <div class="row">
                <div class="col colTitle">
                    <h4 v-text="title"></h4>
                </div>
            </div>

            <data-input name="Telefon" id_input="inputTelefon" small></data-input>

            <data-input name="Procedencia" id_input="inputProcedencia" small></data-input>

            <data-input name="Municipi" id_input="inputMunicipi" small></data-input>

            <data-input name="Adreça" id_input="inputAdresa" small></data-input>

            <div class="row" style="margin-top: 40px">
                <div class="col">
                    <div class="form-floating">
                        <textarea class="form-control" id="textAreaAntecedents"
                        style="height: 130px; resize: none" v-on:click="startTime"></textarea>
                        <label for="textAreaAntecedents">Antecedents</label>
                    </div>
                </div>
            </div>

            <data-check name="Guardar informació" id_check="checkSaveInformation"></data-check>


        </div>
    </div>
</template>

<script>
    export default {
        data() {
            return {
                title: "Dades personals"
            }
        },
        methods: {
            startTime() {
                this.$eventTime.$emit("start-time","message");
            }
        }
    }
</script>
