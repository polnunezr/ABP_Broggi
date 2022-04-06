<template>
    <div class="row">
        <div class="col col-4">
        </div>
        <div class="col col-6 colHelpBoxIcon p-0 d-flex align-items-center justify-content-start">
            <div id="divHelpBoxIcon" class="d-flex align-items-center justify-content-center" v-on:click="clickHelpBoxIcon">
                <i class="fa fa-info"></i>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        data() {
            return {
                openHelpBox: false
            }
        },
        methods: {
            clickHelpBoxIcon() {
                if(!this.openHelpBox) {
                    this.openHelpBox = true;
                    this.$eventHelpBox.$emit("open-help-box",true);
                }
                else {
                    this.openHelpBox = false;
                    this.$eventHelpBox.$emit("close-help-box",false);
                }

            }
        }

    }
</script>
