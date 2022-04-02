<template>
    <div class="row d-flex justify-content-center">
        <div class="col colSection colAgency"
        v-bind:class="colReturn">
            <div class="row">
                <div class="col">
                    <h4 v-text="title"></h4>
                </div>
            </div>
            <!--
            <div class="row" style="margin-top: 20px">
                <div class="col col-10">
                    <input type="text" class="form-control">
                </div>
                <div class="col col-2 d-flex justify-content-center align-items-center">
                    <button type="button" class="button buttonNormal">Afegir</button>
                </div>
            </div>
            -->
            <div class="row" style="margin-top: 20px">
                <div class="col col-10">
                    <!--<textarea v-on:click="startTime" class="form-control" id="textAreaAgency"></textarea>-->
                    <div id="agenciaListDiv">
                        <div class="container-fluid" id="containerAgencia">
                            <list-agency-section v-for="selectMark in selectMarks" :key="selectMark"
                            :agencies="agencies" :idAgency="selectMark">

                            </list-agency-section>
                        </div>
                    </div>
                </div>
                <div class="col col-2 d-flex justify-content-center align-items-end">
                    <button type="button" class="button buttonNormal"
                    v-on:click="buttonClickMap">Mapa</button>
                </div>

            </div>

        </div>
    </div>
</template>

<script>
    export default {
        props: {
            selectMarks: {
                type: [Array],
                require: true
            },
            agencies: {
                type: [Array],
                require: true
            }
        },
        data() {
            return {
                title: "Agències"
            }
        },
        methods: {
            startTime() {
                this.$eventTime.$emit("start-time","message");
            },
            buttonClickMap() {
                this.$eventMap.$emit("open-map",true);
            }
        },
        computed: {
            colReturn() {
                return this.$agencyCol
            }
        },
    }
</script>
