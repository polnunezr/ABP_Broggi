<template>
    <div class="row d-flex justify-content-center">
        <div class="col col-8 colSection colAgency">
            <div class="row">
                <div class="col">
                    <h4 v-text="title"></h4>
                </div>
            </div>

            <div class="row" style="margin-top: 20px">
                <div class="col col-10">
                    <input type="text" class="form-control">
                </div>
                <div class="col col-2 d-flex justify-content-center align-items-center">
                    <button type="button" class="button">Afegir</button>
                </div>
            </div>
            <div class="row" style="margin-top: 20px">
                <div class="col col-10">
                    <textarea v-on:click="startTime" class="form-control" id="textAreaAgency"></textarea>
                </div>
                <div class="col col-2 d-flex justify-content-center align-items-end">
                    <button type="button" class="button">Mapa</button>
                </div>

            </div>

        </div>
    </div>
</template>

<script>
    export default {
        data() {
            return {
                title: "Agències"
            }
        },
        methods: {
            startTime() {
                this.$eventTime.$emit("start-time","message");
            }
        }
    }
</script>
