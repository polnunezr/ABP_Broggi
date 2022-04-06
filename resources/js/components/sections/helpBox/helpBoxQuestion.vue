<template>
    <div class="row">
        <div class="col col-10 d-flex align-items-center justify-content-start colQuestionHelpBox">
            <p class="pQuestionHelpBox"> {{text}}</p>
        </div>
        <div class="col col-2 d-flex align-items-center justify-content-center colAudioHelpBox">
            <div v-on:click="clickAudio" class="divAudio">
                <i class="fas fa-volume-up fa-lg"></i>
            </div>

        </div>
        <!--<div class="col col-12 d-flex align-items-start">
            <hr class="hrHelpBox">
        </div>-->
    </div>
</template>

<script>
    export default {
        props: {
            url: {
                type: [String],
                require: true
            },
            text: {
                type: [String],
                require: true
            }
        },
        data() {
            return {
                audio: null
            }
        },
        created() {
            this.audio =
            new Audio(this.url);
        },
        methods: {
            clickAudio() {
                this.audio.play();
            }
        }

    }
</script>
