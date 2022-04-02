<template>
    <div class="backdrop" v-bind:style="showBackdrop ? 'display: block;' : 'display: none;'">
        <div class="container-fluid">
            <div class="row">
                <div class="col d-flex justify-content-center align-items-center" style="height: 150px;">
                    <p id="titleVideo">{{ title }}</p>
                </div>
            </div>
            <div class="row">

                <backdrop-video-button answerText="SI" v-on:click.native="yesButton" ></backdrop-video-button>

                <backdrop-video-button answerText="NO" v-on:click.native="noButton"></backdrop-video-button>


            </div>
            <div class="row">
                <backdrop-video-refresh-button v-on:click.native="refreshButton"></backdrop-video-refresh-button>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        data() {
            return {
                showBackdrop: false,
                title: "Broggi"
            }
        },
        methods: {
            yesButton() {
                this.showBackdrop = false
                this.$eventVideo.$emit("new-video",this.$yesVideo)
            },
            noButton() {
                this.showBackdrop = false
                this.$eventVideo.$emit("new-video",this.$noVideo)
            },
            refreshButton() {
                this.showBackdrop = false
                this.$eventVideo.$emit("new-video",this.$refreshVideo)
            }
        },
        mounted() {
            this.$eventVideo.$on("change-backdrop-video", title => {
                this.title = title
                this.showBackdrop = true
            })
        }

    }
</script>
