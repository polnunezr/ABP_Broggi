<template>
    <div class="row" v-bind:style="first ? 'margin-top: 0px;' : 'margin-top: 20px;'">
        <div class="col col-6 d-flex justify-content-start align-items-center"
            style="fontWeight: bold">
            {{ titleData }}
        </div>
        <div class="col col-6 d-flex justify-content-end align-items-center">
            {{ data }}
        </div>
    </div>
</template>

<script>
    export default {
        props: {
            titleData: {
                type: [String],
                require: true
            },
            data: {
                type: [String],
                require: true
            },
            first:Boolean
        },
    }
</script>
