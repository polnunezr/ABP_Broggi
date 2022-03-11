<template>
    <div class="row d-flex justify-content-center">
        <div class="col col-10 colSection colLocation">
            <div class="row">
                <div class="col">
                    <h4 v-text="title"></h4>
                </div>
            </div>

            <data-check name="Catalunya" id_check="checkCatalunya"></data-check>

            <div class="row">
                <div class="col">
                    <data-select name="Provincia" id_select="provinciaSelect" small></data-select>
                </div>
                <div class="col">
                    <data-select name="Comarca" id_select="comarcaSelect" small></data-select>
                </div>
                <div class="col">
                    <data-select name="Municipi" id_select="municipiSelect" small></data-select>
                </div>
            </div>

            <data-input name="Direccio" id_input="inputDireccio"></data-input>

            <div class="row" style="margin-top: 20px">
                <div class="col">
                    <div class="form-floating">
                        <textarea class="form-control" id="textAreaDetalls"
                        style="height: 130px; resize: none" v-on:click="startTime"></textarea>
                        <label for="textAreaDetalls">Detalls</label>
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
                title: "Localització"
            }
        },
        methods: {
            startTime() {
                this.$eventTime.$emit("start-time","message");
            }
        }
    }
</script>
