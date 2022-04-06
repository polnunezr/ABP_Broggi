<template>
    <div class="row d-flex justify-content-center">
        <div class="col colSection colRelationSection"
        v-bind:class="colReturn">
            <div class="row">
                <div class="col">
                    <button type="button" class="button buttonNormal" v-on:click="clickRelation">Relacionar expedient</button>
                </div>
            </div>
            <div class="row" style="margin-top:40px">
                <div class="col col-6">
                    <p ref="textrelation" v-bind:style="relation == true ? 'display: block;' : 'display: none;'"></p>
                </div>
                <div class="col col-6">
                    <button type="button" class="button buttonClick"
                    v-bind:style="relation == true ? 'display: block;' : 'display: none;'"
                    v-on:click="cickUnrelate">Desrelacionar</button>
                </div>
            </div>


        </div>

    </div>

</template>

<script>
    export default {
        data() {
            return {
                expedients:[],
                idClick: null,
                relation: false,
                relationText: null
            }
        },
        methods: {
            clickRelation() {
                this.$eventRelation.$emit("open-valor-modal","modal");
            },
            cickUnrelate() {
                this.$eventRelation.$emit("unrelate-valor","modal");
                this.relation = false
                this.relationText = null
                this.$refs.textrelation.innerHTML = ""
                this.idClick = null
            }
        },
        computed: {
            colReturn() {
                return this.$relationExpedientCol
            }
        },
        mounted() {
            // this.$eventRelation.$on("get-expedients-in-section", expedients => {
            //     this.expedients = expedients
            // })
            this.$eventRelation.$on("send-id-button", idClick => {
                this.idClick = idClick
                if(this.idClick != null) {
                    this.relation = true
                    this.$refs.textrelation.innerHTML = "Nº Expedient " + idClick
                }
                else {
                    this.relation = false
                    this.relationText = null
                    this.$refs.textrelation.innerHTML = ""
                }
            })
            this.$eventClear.$on("clear-relation-expedient", expedients => {
                this.cickUnrelate();
            })

            this.$eventFinal.$on("obtener-id-expedient", message => {
                this.$eventFinal.$emit("recojer-id-expedient",this.idClick);
            })
        }
    }
</script>
