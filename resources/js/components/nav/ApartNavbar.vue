<template>
    <div class="row" v-bind:style="video ? 'margin-top: 210px;' : 'margin-top: 60px;'">
        <div class="col colApart">
            <div class="row form-row">
                <div class="col col-2 d-flex justify-content-end align-items-center">
                    <i :class="emoticon"></i>
                </div>
                <div class="col col-10 d-flex justify-content-start align-items-center">
                    <p class="pApart">{{ name }}</p>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        props: {
            name: {
                type: [String],
                require: true
            },
            emoticon: {
                type: [String],
                require: true
            },
            video:Boolean
        }
    }
</script>
