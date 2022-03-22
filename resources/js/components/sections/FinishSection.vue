<template>
    <div id="finishSection">
        <button type="button" class="button">Cancelar</button>
        <button type="button" class="button" style="margin-left: 10px" v-on:click="clickFinish">Finalitzar</button>
    </div>
</template>

<script>
    export default {
        data() {
            return {
                finalDates: {
                    telefono: null,
                    procedencia: null,
                    idMunicipiTrucada: null,
                    adreca: null,
                    antecedentes: null,
                    guardarInformacion: false,

                    idTipusLocation: 1,
                    catalonia: true,
                    idProvinciaLocation: null,
                    idComarcaLocation: null,
                    idMunicipiLocation: null,
                    carrertipusDeVia: null,
                    carrerNom: null,
                    carrerNumero: null,
                    carrerEscala: null,
                    carrerPis: null,
                    carrerPorta: null,
                    puntSingularNom: null,
                    carreteraNom: null,
                    carreteraPuntKilometric: null,
                    carreteraSentit: null,
                    idAltreProvincia: null,
                    provinciaMunicipi: null,
                    detallsLocation: null,

                    idTipoIncident: 1,
                    idIncident: 1,

                    notaComuna: null,

                    fecha: null,
                    hora: null,
                    tiempo: null,
                    operador: null

                }
            }
        },
        methods: {
            clickFinish() {
                //Datos Personales
                this.$eventFinal.$emit("obtener-telefono","telefono");
                this.$eventFinal.$emit("obtener-procedencia","procedencia");
                this.$eventFinal.$emit("obtener-id-municipi-trucada","idMunicipiTrucada");
                this.$eventFinal.$emit("obtener-adreca","adreca");
                this.$eventFinal.$emit("obtener-antecedentes","antecedentes");
                this.$eventFinal.$emit("obtener-guardarInformacion","guardarInformacion");

                //Tipus localització
                this.$eventFinal.$emit("obtener-id-tipus-location","idTipusLocation");
                this.$eventFinal.$emit("obtener-catalonia","catalonia");
                this.$eventFinal.$emit("obtener-id-provincia-location","idProvinciaLocation");
                this.$eventFinal.$emit("obtener-id-comarca-location","idComarcaLocation");
                this.$eventFinal.$emit("obtener-id-municipi-location","idMunicipiLocation");

                switch(this.finalDates.idTipusLocation) {
                    case 1: //Carrers
                        this.$eventFinal.$emit("obtener-carrer-tipusDeVia","carrertipusDeVia");
                        this.$eventFinal.$emit("obtener-carrer-nom","carrerNom");
                        this.$eventFinal.$emit("obtener-carrer-numero","carrerNumero");
                        this.$eventFinal.$emit("obtener-carrer-escala","carrerEscala");
                        this.$eventFinal.$emit("obtener-carrer-pis","carrerPis");
                        this.$eventFinal.$emit("obtener-carrer-porta","carrerPorta");
                        break;
                    case 2: //Punt
                        // console.log(this.finalDates.idTipusLocation)
                        this.$eventFinal.$emit("obtener-punt-singular-nom","puntSingularNom");
                        break;
                    case 4: //Carretera
                        this.$eventFinal.$emit("obtener-carretera-nom","carreteraNom");
                        this.$eventFinal.$emit("obtener-carretera-punt-kilometric","carreteraPuntKilometric");
                        this.$eventFinal.$emit("obtener-carretera-sentit","carreteraSentit");
                        break;
                    case 5: //Provincia
                        this.$eventFinal.$emit("obtener-id-otra-provincia","idOtraProvincia");
                        this.$eventFinal.$emit("obtener-provincia-municipi","provinciaMunicipi");
                        break;
                }

                this.$eventFinal.$emit("obtener-detalls-location","detallsLocation");

                //Tipus d'emergencia
                this.$eventFinal.$emit("obtener-id-tipo-incident","idTipoIncident");
                this.$eventFinal.$emit("obtener-id-incident","idIncident");

                //Nota comuna
                this.$eventFinal.$emit("obtener-nota-comuna","notaComuna");
            }
        },
        mounted() {

            //Datos Personales

            this.$eventFinal.$on("recojer-telefono", telefono => {
                if(telefono != "" && telefono != null) {
                    this.finalDates.telefono = telefono
                }
                else {
                    this.finalDates.telefono = null
                }
            })


            this.$eventFinal.$on("recojer-procedencia", procedencia => {
                if(procedencia != "" && procedencia != null) {
                    this.finalDates.procedencia = procedencia
                }
                else {
                    this.finalDates.procedencia = null
                }
            })

            this.$eventFinal.$on("recojer-id-municipi-trucada", idMunicipiTrucada => {
                if(idMunicipiTrucada == 0) {
                    this.finalDates.idMunicipiTrucada = null
                }
                else {
                    this.finalDates.idMunicipiTrucada = idMunicipiTrucada
                }

            })

            this.$eventFinal.$on("recojer-adreca", adreca => {
                if(adreca != "" && adreca != null) {
                    this.finalDates.adreca = adreca
                }
                else {
                    this.finalDates.adreca = null
                }
            })

            this.$eventFinal.$on("recojer-antecedentes", antecedentes => {
                if(antecedentes != "" && antecedentes != null) {
                    this.finalDates.antecedentes = antecedentes
                }
                else {
                    this.finalDates.antecedentes = null
                }
            })

            this.$eventFinal.$on("recojer-guardarInformacion", guardarInformacion => {
                if(guardarInformacion == null) {
                    this.finalDates.guardarInformacion = false
                }
                else {
                    this.finalDates.guardarInformacion = guardarInformacion
                }
            })

            //Tipus localització

            this.$eventFinal.$on("recojer-id-tipus-location", idTipusLocation => {
                if(idTipusLocation == 0) {
                    this.finalDates.idTipusLocation = null
                }
                else {
                    this.finalDates.idTipusLocation = idTipusLocation
                }
            })

            this.$eventFinal.$on("recojer-catalonia", catalonia => {
                if(catalonia == null) {
                    this.finalDates.catalonia = false
                }
                else {
                    this.finalDates.catalonia = catalonia
                }
            })

            this.$eventFinal.$on("recojer-id-provincia-location", idProvinciaLocation => {
                if(idProvinciaLocation == 0) {
                    this.finalDates.idProvinciaLocation = null
                }
                else {
                    this.finalDates.idProvinciaLocation = idProvinciaLocation
                }
            })

            this.$eventFinal.$on("recojer-id-comarca-location", idComarcaLocation => {
                if(idComarcaLocation == 0) {
                    this.finalDates.idComarcaLocation = null
                }
                else {
                    this.finalDates.idComarcaLocation = idComarcaLocation
                }
            })

            this.$eventFinal.$on("recojer-id-municipi-location", idMunicipiLocation => {
                if(idMunicipiLocation == 0) {
                    this.finalDates.idMunicipiLocation = null
                }
                else {
                    this.finalDates.idMunicipiLocation = idMunicipiLocation
                }
            })

            //Carrers

            this.$eventFinal.$on("recojer-carrer-tipusDeVia", carrertipusDeVia => {
                if(carrertipusDeVia != "" && carrertipusDeVia != null) {
                    this.finalDates.carrertipusDeVia = carrertipusDeVia
                }
                else {
                    this.finalDates.carrertipusDeVia = null
                }
            })

            this.$eventFinal.$on("recojer-carrer-nom", carrerNom => {
                if(carrerNom != "" && carrerNom != null) {
                    this.finalDates.carrerNom = carrerNom
                }
                else {
                    this.finalDates.carrerNom = null
                }
            })

            this.$eventFinal.$on("recojer-carrer-numero", carrerNumero => {
                if(carrerNumero != "" && carrerNumero != null) {
                    this.finalDates.carrerNumero = carrerNumero
                }
                else {
                    this.finalDates.carrerNumero = null
                }
            })

            this.$eventFinal.$on("recojer-carrer-escala", carrerEscala => {
                if(carrerEscala != "" && carrerEscala != null) {
                    this.finalDates.carrerEscala = carrerEscala
                }
                else {
                    this.finalDates.carrerEscala = null
                }
            })

            this.$eventFinal.$on("recojer-carrer-pis", carrerPis => {
                if(carrerPis != "" && carrerPis != null) {
                    this.finalDates.carrerPis = carrerPis
                }
                else {
                    this.finalDates.carrerPis = null
                }
            })

            this.$eventFinal.$on("recojer-carrer-porta", carrerPorta => {
                if(carrerPorta != "" && carrerPorta != null) {
                    this.finalDates.carrerPorta = carrerPorta
                }
                else {
                    this.finalDates.carrerPorta = null
                }
            })

            //Punt Singular
            this.$eventFinal.$on("recojer-punt-singular-nom", puntSingularNom => {
                if(puntSingularNom != "" && puntSingularNom != null) {
                    this.finalDates.puntSingularNom = puntSingularNom
                }
                else {
                    this.finalDates.puntSingularNom = null
                }
            })

            //Carretera

            this.$eventFinal.$on("recojer-carretera-nom", carreteraNom => {
                if(carreteraNom != "" && carreteraNom != null) {
                    this.finalDates.carreteraNom = carreteraNom
                }
                else {
                    this.finalDates.carreteraNom = null
                }
            })

            this.$eventFinal.$on("recojer-carretera-punt-kilometric", carreteraPuntKilometric => {
                if(carreteraPuntKilometric != "" && carreteraPuntKilometric != null) {
                    this.finalDates.carreteraPuntKilometric = carreteraPuntKilometric
                }
                else {
                    this.finalDates.carreteraPuntKilometric = null
                }
            })

            this.$eventFinal.$on("recojer-carretera-sentit", carreteraSentit => {
                if(carreteraSentit != "" && carreteraSentit != null) {
                    this.finalDates.carreteraSentit = carreteraSentit
                }
                else {
                    this.finalDates.carreteraSentit = null
                }
            })

            //Provincia

            this.$eventFinal.$on("recojer-id-otra-provincia", idAltreProvincia => {
                if(idAltreProvincia == 0) {
                    this.finalDates.idAltreProvincia = null
                }
                else {
                    this.finalDates.idAltreProvincia = idAltreProvincia
                }
            })

            this.$eventFinal.$on("recojer-provincia-municipi", provinciaMunicipi => {
                if(provinciaMunicipi != "" && provinciaMunicipi != null) {
                    this.finalDates.provinciaMunicipi = provinciaMunicipi
                }
                else {
                    this.finalDates.provinciaMunicipi = null
                }
            })

            //Otros

            this.$eventFinal.$on("recojer-detalls-location", detallsLocation => {
                if(detallsLocation != "" && detallsLocation != null) {
                    this.finalDates.detallsLocation = detallsLocation
                }
                else {
                    this.finalDates.detallsLocation = null
                }
            })

            //Emergencia

            this.$eventFinal.$on("recojer-id-tipo-incident", idTipoIncident => {
                if(idTipoIncident == 0) {
                    this.finalDates.idTipoIncident = null
                }
                else {
                    this.finalDates.idTipoIncident = idTipoIncident
                }
            })

            this.$eventFinal.$on("recojer-id-incident", idIncident => {
                if(idIncident == 0) {
                    this.finalDates.idIncident = null
                }
                else {
                    this.finalDates.idIncident = idIncident
                }
            })

            //Nota Comuna

            this.$eventFinal.$on("recojer-nota-comuna", notaComuna => {
                if(notaComuna != "" && notaComuna != null) {
                    this.finalDates.notaComuna = notaComuna
                }
                else {
                    this.finalDates.notaComuna = null
                }
            })

        }
    }
</script>
