<template>
    <div class="row d-flex justify-content-center">
        <div class="col col-8 colSection colEmergency">
            <div class="row">
                <div class="col">
                    <h4 v-text="title"></h4>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <data-select name="Tipus d'emergencia general" id_select="selectEmergencyGeneral"></data-select>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <data-select name="Tipus d'emergencia específica" id_select="selectEmergencySpecific"></data-select>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        data() {
            return {
                title: "Tipus d'emergencia"
            }
        }
    }
</script>
