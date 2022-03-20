<template>
    <div class="row form-row" style="margin-top: 20px">
        <div class="col d-flex"
            v-bind:class="colSmall">
            <label :for="id_select">{{ name }}</label>
        </div>
        <div class="col d-flex justify-content-center align-items-center"
            v-bind:class="colBig">

            <select v-if="name == this.$comarca || name == this.$provincia || name == this.$municipi"
                ref="select" v-on:change="changeSelect" v-on:click="startTime" class="form-select" :id="id_select">
                <option v-for="arrayElement in arrayElements" :key="arrayElement.id" :value="arrayElement.id">
                {{arrayElement.nom}}</option>
            </select>

            <select v-else-if="name == this.$tipusLocalitzacio"
                ref="select" v-on:change="changeSelect" v-on:click="startTime" class="form-select" :id="id_select">
                <option v-for="arrayElement in arrayElements" :key="arrayElement.id" :value="arrayElement.id">
                {{arrayElement.tipus}}</option>
            </select>

            <select v-else
                ref="select" v-on:change="changeSelect" v-on:click="startTime" class="form-select" :id="id_select">
                <option v-for="arrayElement in arrayElements" :key="arrayElement.id" :value="arrayElement.id">
                {{arrayElement.descripcio}}</option>
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
            arrayElements: {
                type:[Array],
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
                    if(this.name == this.$tipusLocalitzacio) {
                        response = "col-2 align-items-center"
                    }
                    else {
                        response = "col-5 align-items-center"
                    }

                }
                return response;
            },
            colBig() {
                let response = "";
                if(this.small == true) {
                    response = "col-9"
                }
                else {
                    if(this.name == this.$tipusLocalitzacio) {
                        response = "col-10"
                    }
                    else {
                         response = "col-7"
                    }

                }
                return response;
            }
        },
        methods: {
            startTime() {
                this.$eventTime.$emit("start-time","message");
            },
            changeSelect() {

                switch(this.name) {
                    case this.$provincia:
                        this.$eventSelect.$emit("change-select-provincia",parseInt(this.$refs.select.value))
                        break;
                    case this.$comarca:
                        this.$eventSelect.$emit("change-select-comarca",parseInt(this.$refs.select.value))
                    break;
                    case this.$tipusEmergencia:
                        this.$eventSelect.$emit("change-select-incident",parseInt(this.$refs.select.value))
                    break;
                    case this.$tipusLocalitzacio:
                        this.$eventSelect.$emit("change-select-localitzacio",parseInt(this.$refs.select.value))
                    break;
                }

                // if(this.name == this.$provincia) {
                //     this.$eventSelect.$emit("change-select-provincia",parseInt(this.$refs.select.value))
                // }
                // else if(this.name == this.$comarca) {
                //     this.$eventSelect.$emit("change-select-comarca",parseInt(this.$refs.select.value))
                // }


            }
        },
        mounted() {
            this.$eventSelect.$on("change-select-localitzacio-provincia", selectValor => {
                this.$refs.select.value = selectValor;
                if(selectValor != 1) {
                    this.$refs.select.disabled = true;
                }
                else {
                    this.$refs.select.disabled = false;
                }

            })
        }
    }
</script>
