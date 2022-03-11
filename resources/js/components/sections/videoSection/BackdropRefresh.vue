<template>
    <div class="backdrop" v-bind:style="showBackdropRefresh ? 'display: block;' : 'display: none;'">
        <div class="container-fluid">
            <div class="row">
                <div class="col d-flex align-items-center justify-content-center" style="height: 600px;">
                    <div v-on:click="refreshButtonGeneral">
                        <i class="fa fa-refresh fa-7x"></i>
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
                showBackdropRefresh: false
            }
        },
        methods: {
            refreshButtonGeneral() {
                this.showBackdropRefresh = false
                this.$eventVideo.$emit("new-video",this.$refreshGeneral)
            }
        },
        mounted() {
            this.$eventVideo.$on("change-backdrop-refresh", valor => {
                this.showBackdropRefresh = valor
            })
        }

    }
</script>
