<template>
    <div class="col col-6 d-flex align-items-center justify-content-center" style="height: 375px;">
        <div class="questions d-flex align-items-center justify-content-center" v-on:click="clickButton">
            <p class="answers">{{answerText}}</p>
        </div>
    </div>
</template>

<script>
    export default {
        props: {
            answerText: {
                type: [String],
                require: true
            }
        },
        methods: {
            clickButton() {
                this.$eventVideo.$emit("click-button",this.answerText)
            }
        }

    }
</script>
