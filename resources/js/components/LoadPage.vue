<template>
    <div id="divLoad">
        <div id="divLoadLogo" v-bind:style="divLoadLogo" v-if="small == false">
            <img :src="this.$logoSrc" id="imgLogoLoad" v-bind:style="imgLogoLoad">
        </div>
        <div id="divLoadLogoSmall" v-bind:style="divLoadLogoSmall" v-else>
            <img :src="this.$logoSrc" id="imgLogoLoadSmall" v-bind:style="imgLogoLoadSmall">
        </div>

        <div id="divimgLoad" v-bind:style="divimgLoad" v-if="small == false">
            <img :src="this.$loadSrc" id="imgLoad" v-bind:style="imgLoad">
        </div>

        <div id="divimgLoadSmall" v-bind:style="divimgLoadSmall" v-else>
            <img :src="this.$loadSrc" id="imgLoadSmall" v-bind:style="imgLoadSmall">
        </div>

    </div>

</template>

<script>
    export default {
        props: {
            small: Boolean,
        },
        data() {
            return {
                divLoadLogo: {
                    position: "absolute",
                    top: "calc(40% - 125px)",
                    left: "calc(50% - 123.26px)"
                    //193.25px - 71px cuando haya espacio blanco
                },
                divLoadLogoSmall: {
                    position: "absolute",
                    top: "calc(40% - 62.5px)",
                    left: "calc(50% - 63.375px)"
                    //96.625px - 35px cuando haya espacio blanco
                },
                //1.014
                //0.9861111111111111
                imgLogoLoad: {
                    width: "246.52",
                    height: "250px"
                },
                imgLogoLoadSmall: {
                    width: "126.75px",
                    height: "125px"
                },
                divimgLoad: {
                    position: "absolute",
                    top: "calc(60% - 24.15625px)",
                    left: "calc(50% - 96.625px)"
                },
                divimgLoadSmall: {
                    position: "absolute",
                    top: "calc(51% - 12.078125px)",
                    left: "calc(50% - 48.3125px)"
                },
                //0.25
                imgLoad: {
                    width: "193.25px",
                    height: "48.3125px"
                },
                imgLoadSmall: {
                    width: "96.625px",
                    height: "24.15625px"
                }
            }
        }


    }
</script>
