<template>
    <div>
        <apart-navbar name="Dades personals" emoticon="fa fa-solid fa-user" v-on:click.native="changeSection(personalData)"></apart-navbar>
        <apart-navbar name="Localització" emoticon="fa fa-map-marker" v-on:click.native="changeSection(locate)"></apart-navbar>
        <apart-navbar name="Agències" emoticon="fa fa-solid fa-car-side" v-on:click.native="changeSection(agency)"></apart-navbar>
        <apart-navbar name="Emergencia" emoticon="fas fa-ambulance" v-on:click.native="changeSection(emergency)"></apart-navbar>
        <apart-navbar name="Nota comuna" emoticon="fa fa-sticky-note-o" v-on:click.native="changeSection(communeNote)"></apart-navbar>
        <apart-navbar name="Relacionar Expedient" emoticon="fa fa-solid fa-book" v-on:click.native="changeSection(relationExpedient)"></apart-navbar>
        <apart-navbar name="Vídeo interactiu" emoticon="fas fa-video" v-on:click.native="changeSection(interactiveVideo)" video></apart-navbar>
    </div>
</template>

<script>
    export default {
        data() {
            return {
                personalData: "Dades Personals",
                locate: "Localitzacio",
                agency: "Agencies",
                emergency: "Emergencia",
                communeNote: "Nota comuna",
                relationExpedient: "Relacionar Expedient",
                interactiveVideo: "video"
            }
        },
        methods: {
            changeSection(section) {
                this.$eventTime.$emit("change-section",section);
            }
        }
    }
</script>
