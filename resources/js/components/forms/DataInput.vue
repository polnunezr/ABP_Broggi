<template>
    <div class="row form-row" style="margin-top: 20px">

        <div class="col d-flex justify-content-center align-items-center"
            v-bind:class="colSmall">
            <label :for="id_input">{{ name }}</label>
        </div>
        <div class="col"
            v-bind:class="colBig">
            <input type="text" class="form-control" :id="id_input" v-on:click="startTime">
        </div>
    </div>
</template>

<script>
    export default {
        props: {
            name: {
                type:[String],
                require: true
            },
            id_input: {
                type:[String],
                require: true
            },
            small: Boolean
        },
        computed: {
            colSmall() {
                let response = "";
                if(this.small == false) {
                    response = "col-1"
                }
                else {
                    response = "col-2"
                }
                return response;
            },
            colBig() {
                let response = "";
                if(this.small == false) {
                    response = "col-11"
                }
                else {
                    response = "col-10"
                }
                return response;
            }
        },
        methods: {
            startTime() {
                this.$eventTime.$emit("start-time","message");
            }
        }
    }
</script>
