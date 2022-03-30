<template>
    <div class="row rowAgenciaList">
        <div class="col col-10 d-flex align-items-center">
            <label class="labelAgenciaList">{{name}}</label>
        </div>
        <div class="col col-2 d-flex justify-content-end align-items-center">
            <i class="fa fa-trash-o" v-on:click="clickTrash"></i>
        </div>
        <div class="col col-12">
            <hr class="hrAgencia">
        </div>
    </div>
</template>

<script>
    export default {
        props: {
            idAgency: {
                type:[Number],
                require: true
            },
            agencies: {
                type: [Array],
                require: true
            }
        },
        data() {
            return {
                name: ""
            }
        },
        created() {

            for(let i = 0; i < this.agencies.length; i++) {
                if(this.agencies[i].id == this.idAgency) {
                    this.name = this.agencies[i].nom
                }
            }
        },
        methods: {
            clickTrash() {
                this.$eventMap.$emit("delete-select-mark",this.idAgency);
            }
        }
    }
</script>
