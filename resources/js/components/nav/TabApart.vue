<template>
    <div>
        <div class="row" id="rowLogo">
            <div class="col colLogo">
                <div class="row">
                    <div class="col col-12 d-flex justify-content-start align-items-center">
                         <img :src="this.$logoSrc" id="imgLogo">
                    </div>
                </div>
            </div>
        </div>
        <apart-navbar :marginTopApart="30" name="Dades personals" emoticon="fa fa-solid fa-user" v-on:click.native="changeSection(personalData)"></apart-navbar>
        <apart-navbar :marginTopApart="60" name="Localització" emoticon="fa fa-map-marker" v-on:click.native="changeSection(locate)"></apart-navbar>
        <apart-navbar :marginTopApart="60" name="Agències" emoticon="fa fa-solid fa-car-side" v-on:click.native="changeSection(agency)"></apart-navbar>
        <apart-navbar :marginTopApart="60" name="Emergencia" emoticon="fas fa-ambulance" v-on:click.native="changeSection(emergency)"></apart-navbar>
        <apart-navbar :marginTopApart="60" name="Nota comuna" emoticon="fa fa-sticky-note-o" v-on:click.native="changeSection(communeNote)"></apart-navbar>
        <apart-navbar :marginTopApart="60" v-if="show == false" name="Relacionar Expedient" emoticon="fa fa-solid fa-book" v-on:click.native="changeSection(relationExpedient)"></apart-navbar>
        <apart-navbar :marginTopApart="140" v-if="show == false" name="Vídeo interactiu" emoticon="fas fa-video" v-on:click.native="changeSection(interactiveVideo)" video></apart-navbar>
    </div>
</template>

<script>
    export default {
        props: {
            show: {
                type: [Boolean],
                require: true
            }
        },
        data() {
            return {
                personalData: this.$dadesPersonals,
                locate: this.$locate,
                agency: this.$agency,
                emergency: this.$emergency,
                communeNote:this.$communeNote,
                relationExpedient: this.$relationExpedient,
                interactiveVideo: this.$interactiveVideo,
            }
        },
        methods: {
            changeSection(section) {
                this.$eventAlert.$emit("change-section",section);
                this.$eventTime.$emit("change-section",section);
                this.$eventHelpBox.$emit("change-section",section);
            }
        }
    }
</script>
