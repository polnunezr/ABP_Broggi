<template>
    <div class="row form-row" style="margin-top: 20px">
        <div class="col d-flex"
            v-bind:class="colSmall">
            <label :for="id_select">{{ name }}</label>
        </div>
        <div class="col d-flex justify-content-center align-items-center"
            v-bind:class="colBig">
            <select v-on:click="startTime" class="form-select" id="id_select">
                <option value="1">One</option>
                <option value="2">Two</option>
                <option value="3">Three</option>
            </select>
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
            id_select: {
                type:[String],
                require: true
            },
            small: Boolean
        },
        computed: {
            colSmall() {
                let response = "";
                if(this.small == true) {
                    response = "col-3 justify-content-center align-items-center"
                }
                else {
                    response = "col-5 align-items-center"
                }
                return response;
            },
            colBig() {
                let response = "";
                if(this.small == true) {
                    response = "col-9"
                }
                else {
                    response = "col-7"
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
