<template>
    <div class="row d-flex justify-content-center">
        <div class="col col-8 colSection colPersonalDates">
            <div class="row">
                <div class="col">
                    <h4 v-text="title"></h4>
                </div>
            </div>

            <data-input name="Telefon" id_input="inputTelefon" ></data-input>

            <data-input name="Direcció" id_input="inputDireccion" ></data-input>

            <div class="row" style="margin-top: 20px">
                <div class="col">
                    <div class="form-floating">
                        <textarea class="form-control" id="textAreaAntecedents"
                        style="height: 130px; resize: none" v-on:click="startTime"></textarea>
                        <label for="textAreaAntecedents">Antecedents</label>
                    </div>
                </div>
            </div>


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
