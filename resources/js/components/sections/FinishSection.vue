<template>
    <div id="finishSection">
        <button type="button" class="button buttonNormal" :disabled="disabledButton" v-on:click="clickCancel"
        v-bind:class = "disabledButton == true ? 'buttonDisabled' : ''">Cancelar</button>
        <button type="button" class="button buttonNormal" style="margin-left: 10px" v-on:click="getCartesTrucada"
        :disabled="disabledButton" v-bind:class = "disabledButton == true ? 'buttonDisabled' : ''">Finalitzar</button>
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
                    origenLlamada: null,
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
                    timeSeconds: null,
                    operador: null,

                    expedientId: null,
                    dadaPersonalId: null,

                    selectMarks: []

                },
                objectPost: {
                    cartes_trucades: {
                        codi_trucada: null,
                        data_hora: null,
                        temps_trucada: null,
                        dades_personals_id: null,
                        telefon: null,
                        procedencia_trucada: null,
                        origen_trucada: null,
                        nom_trucada: null,
                        municipis_id_trucada: null,
                        adreca_trucada: null,
                        fora_catalunya: null,
                        provincies_id: null,
                        municipis_id: null,
                        tipus_localitzacions_id: null,
                        descripcio_localitzacio: null,
                        detall_localitzacio: null,
                        altres_ref_localitzacio: null,
                        incidents_id: null,
                        nota_comuna: null,
                        expedients_id: null,
                        usuaris_id: null
                    },
                    dades_personals: {
                        id: null,
                        telefon: null,
                        adreca: null,
                        antecedents: null,
                        guardar: true
                    },
                    expedients: {
                        id: null,
                        data_creacio: null,
                        data_ultima_modificacio: null,
                        estats_expedients_id: null
                    },
                    cartes_trucades_has_agencies: {
                        agenciesId: []
                    }
                },
                cartesTrucadesArray: [],
                disabledButton: false
            }
        },
        created() {
            // let vueThis = this

            //     axios
            //     .get("/cartes_trucades")
            //     .then(response => {
            //         vueThis.cartesTrucadesArray = response.data;
            //         vueThis.disabledButton = false
            //     })
            //     .catch(error => {
            //         console.log(error)
            //     })
            //     .finally(() => this.loading = false)
        },
        methods: {
            getCartesTrucada() {
                this.disabledButton = true
                let vueThis = this

                axios
                .get("/cartes_trucades")
                .then(response => {
                    console.log(response)
                    vueThis.cartesTrucadesArray = response.data;
                    // vueThis.disabledButton = false

                    vueThis.clickFinish();
                })
                .catch(error => {
                    console.log(error)
                    vueThis.disabledButton = false
                })
                .finally(() => this.loading = false)
            },
            clickFinish() {

                //Datos Personales
                this.$eventFinal.$emit("obtener-telefono","telefono");
                this.$eventFinal.$emit("obtener-procedencia","procedencia");
                this.$eventFinal.$emit("obtener-id-municipi-trucada","idMunicipiTrucada");
                this.$eventFinal.$emit("obtener-adreca","adreca");
                this.$eventFinal.$emit("obtener-antecedentes","antecedentes");
                this.$eventFinal.$emit("obtener-origen-llamada","origenLlamada");
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

                //Section Time
                this.$eventFinal.$emit("obtener-fecha","fecha");
                this.$eventFinal.$emit("obtener-hora","hora");
                this.$eventFinal.$emit("obtener-tiempo","tiempo");
                this.$eventFinal.$emit("obtener-operador","operador");
                this.$eventFinal.$emit("obtener-tiempo-segundos","timeSeconds");

                //Expedient relation

                this.$eventFinal.$emit("obtener-id-expedient","expedient");

                //Dada personal relation

                this.$eventFinal.$emit("obtener-id-dada-personal","dada-personal");

                //Agencies

                this.$eventFinal.$emit("obtener-id-agencies","id-agencies");

                this.crearCartaTrucada()
            },
            crearCartaTrucada() {

                let insertCartaTrucada = true;
                let mensajeAlert = []
                let mensaje = {
                    id: null,
                    text: null
                }


                //dades_personals

                if(this.finalDates.telefono == null) {
                    insertCartaTrucada = false
                    this.objectPost.dades_personals.telefon = null
                    mensaje.id = 1
                    mensaje.text = "Introduzca el numero de telefono!"
                    mensajeAlert.push(Object.assign({}, mensaje));


                    //Cuando se cambia los datos del objeto, también se en el array
                    //Esta funcion sube una copia del objeto, por lo tanto cuando se cambie los datos del objeto original
                    //no se cambiara los objetos del array
                    //overflow -> Javascript pushing objects into array changes entire array
                }

                //Dades personals

                this.objectPost.dades_personals.telefon = this.finalDates.telefono

                if(this.finalDates.dadaPersonalId != null) {
                    this.objectPost.dades_personals.id = this.finalDates.dadaPersonalId
                    this.objectPost.dades_personals.telefon = null
                    this.objectPost.dades_personals.adreca = null
                    this.objectPost.dades_personals.antecedents = null
                    this.objectPost.dades_personals.guardar = null;
                }
                else {
                    if(!this.finalDates.guardarInformacion) {
                    this.objectPost.dades_personals.guardar = false;
                    }
                    else {
                        this.objectPost.dades_personals.guardar = true;
                    }
                    this.objectPost.dades_personals.adreca = this.finalDates.adreca
                    this.objectPost.dades_personals.antecedents = this.finalDates.antecedentes
                }

                //expedients
                //0000-00-00 00:00:00
                let fecha = this.finalDates.fecha;
                let fechaSplit = fecha.split("/")
                let data_creacio =  ""

                fecha = fechaSplit[2] + "-" +fechaSplit[1] + "-" +fechaSplit[0]
                data_creacio = fecha + " " + this.finalDates.hora;


                if(this.finalDates.expedientId != null) {
                    this.objectPost.expedients.id = this.finalDates.expedientId
                }
                else {
                    this.objectPost.expedients.data_creacio = data_creacio
                    this.objectPost.expedients.data_ultima_modificacio = fecha + " " + this.finalDates.hora
                    this.objectPost.expedients.estats_expedients_id = 1
                }




                //cartes_trucades

                //Personal dates

                let codiTrucadaBig = 0,textCodiTrucadaSplit,codiTrucada;
                if(this.cartesTrucadesArray.length > 0) {
                    for(let i = 0; i < this.cartesTrucadesArray.length; i++) {
                        textCodiTrucadaSplit = this.cartesTrucadesArray[i].codi_trucada.split("_")
                        codiTrucada = parseInt(textCodiTrucadaSplit[1])
                        if(codiTrucada > codiTrucadaBig) {
                            codiTrucadaBig = codiTrucada
                        }
                    }
                    codiTrucadaBig++
                    this.objectPost.cartes_trucades.codi_trucada= "CT_"+codiTrucadaBig
                }
                else {
                    this.objectPost.cartes_trucades.codi_trucada= "CT_1"
                }

                // this.objectPost.cartes_trucades.data_hora= this.objectPost.expedients.data_creacio //Cuando creas solo
                this.objectPost.cartes_trucades.data_hora= data_creacio
                this.objectPost.cartes_trucades.temps_trucada= this.finalDates.timeSeconds
                this.objectPost.cartes_trucades.dades_personals_id= null //Obtener response

                this.objectPost.cartes_trucades.telefon = this.finalDates.telefono

                this.objectPost.cartes_trucades.procedencia_trucada= this.finalDates.procedencia
                this.objectPost.cartes_trucades.origen_trucada= this.finalDates.origenLlamada
                this.objectPost.cartes_trucades.municipis_id_trucada= this.finalDates.idMunicipiTrucada
                this.objectPost.cartes_trucades.adreca_trucada= this.finalDates.adreca

                this.objectPost.cartes_trucades.nom_trucada = this.objectPost.cartes_trucades.codi_trucada //?


                //Localització

                this.objectPost.cartes_trucades.fora_catalunya= this.finalDates.catalonia
                this.objectPost.cartes_trucades.provincies_id= this.finalDates.idProvinciaLocation
                //id_comarca? base de datos
                this.objectPost.cartes_trucades.municipis_id= this.finalDates.idMunicipiLocation
                this.objectPost.cartes_trucades.tipus_localitzacions_id= this.finalDates.idTipusLocation

                switch(this.objectPost.cartes_trucades.tipus_localitzacions_id) {
                    case 1: //Carrers
                        //tipus de via + nom
                        this.objectPost.cartes_trucades.descripcio_localitzacio = ""
                        let carrerDescripcio = [this.finalDates.carrertipusDeVia,this.finalDates.carrerNom]
                        for(let i = 0; i < carrerDescripcio.length; i++) {
                            if(this.objectPost.cartes_trucades.descripcio_localitzacio == "" && carrerDescripcio[i] != null) {
                                this.objectPost.cartes_trucades.descripcio_localitzacio = carrerDescripcio[i]
                            }
                            else if(this.objectPost.cartes_trucades.descripcio_localitzacio != "" && carrerDescripcio[i] != null) {
                                this.objectPost.cartes_trucades.descripcio_localitzacio = this.objectPost.cartes_trucades.descripcio_localitzacio + ", " + carrerDescripcio[i]
                            }
                        }

                        //Numero + escala + pis + porta
                        this.objectPost.cartes_trucades.detall_localitzacio = ""
                        let carrerDetall = [this.finalDates.carrerNumero,this.finalDates.carrerEscala,this.finalDates.carrerPis,this.finalDates.carrerPorta]
                        for(let i = 0; i < carrerDetall.length; i++) {
                            if(this.objectPost.cartes_trucades.detall_localitzacio == "" && carrerDetall[i] != null) {
                                this.objectPost.cartes_trucades.detall_localitzacio = carrerDetall[i]
                            }
                            else if(this.objectPost.cartes_trucades.detall_localitzacio != "" && carrerDetall[i] != null) {
                                this.objectPost.cartes_trucades.detall_localitzacio = this.objectPost.cartes_trucades.detall_localitzacio + ", " + carrerDetall[i]
                            }
                        }

                        break;
                    case 2: //Punt Singular

                        this.objectPost.cartes_trucades.descripcio_localitzacio  = this.finalDates.puntSingularNom
                        this.objectPost.cartes_trucades.detall_localitzacio = null

                        break;
                    case 3: //Entitat Població

                        this.objectPost.cartes_trucades.descripcio_localitzacio  = null
                        this.objectPost.cartes_trucades.detall_localitzacio = null

                        break;
                    case 4: //Carretera
                        //Nom carretera
                        this.objectPost.cartes_trucades.descripcio_localitzacio  = this.finalDates.carreteraNom

                        //Punt kilometric + sentit
                        this.objectPost.cartes_trucades.detall_localitzacio = ""
                        let carreteraDetall = [this.finalDates.carreteraPuntKilometric,this.finalDates.carreteraSentit]
                        for(let i = 0; i < carreteraDetall.length; i++) {
                            if(this.objectPost.cartes_trucades.detall_localitzacio == "" && carreteraDetall[i] != null) {
                                this.objectPost.cartes_trucades.detall_localitzacio = carreteraDetall[i]
                            }
                            else if(this.objectPost.cartes_trucades.detall_localitzacio != "" && carreteraDetall[i] != null) {
                                this.objectPost.cartes_trucades.detall_localitzacio = this.objectPost.cartes_trucades.detall_localitzacio + ", " + carreteraDetall[i]
                            }
                        }

                        break;
                    case 5: //Provincia
                        this.objectPost.cartes_trucades.provincies_id= this.finalDates.idAltreProvincia
                        //id_comarca? base de datos
                        this.objectPost.cartes_trucades.municipis_id= null
                        this.objectPost.cartes_trucades.descripcio_localitzacio  = this.finalDates.provinciaMunicipi
                        this.objectPost.cartes_trucades.detall_localitzacio = null

                        break;

                }
                this.objectPost.cartes_trucades.altres_ref_localitzacio= this.finalDates.detallsLocation

                //Tipificacion emeregncia
                this.objectPost.cartes_trucades.incidents_id = this.finalDates.idIncident

                //Nota comuna

                if(this.finalDates.notaComuna == null) {
                    insertCartaTrucada = false
                    this.objectPost.cartes_trucades.nota_comuna = null
                    if(mensajeAlert.length > 0) {
                        mensaje.id = 2;
                        mensaje.text = "Introduzca la nota comúna!"
                        mensajeAlert.push(Object.assign({}, mensaje));
                    }
                    else {
                        mensaje.id = 1;
                        mensaje.text = "Introduzca la nota comúna!"
                        mensajeAlert.push(Object.assign({}, mensaje));
                    }


                }

                this.objectPost.cartes_trucades.nota_comuna = this.finalDates.notaComuna

                // debugger;

                this.objectPost.cartes_trucades.expedients_id = null//Obtener response | cuando se crea uno

                this.objectPost.cartes_trucades.usuaris_id = 1 //Provisional

                //Agencies

                this.objectPost.cartes_trucades_has_agencies.agenciesId = this.finalDates.selectMarks

                let vueThis = this

                if(insertCartaTrucada) {
                    axios
                    .post("/cartes_trucades_view",vueThis.objectPost)
                    .then(function(response) {
                        console.log(response)
                        vueThis.$eventAlert.$emit("open-alert-carta-insert",
                        [
                        {
                            id: 1,
                            text: "Carta de llamada añadida correctamente"
                        }
                        ]
                        );

                        vueThis.clearAll();
                        vueThis.$eventPersonal.$emit("update-personal-dates","personal-dates");
                        vueThis.disabledButton = false;

                    }).catch(function(error) {
                        console.log(error.response.status)
                        console.log(typeof error.response.data.error)
                        vueThis.$eventAlert.$emit("open-alert",
                        [
                        {
                            id: 1,
                            text: error.response.data.error
                        }
                        ]
                        );
                        vueThis.$eventPersonal.$emit("update-personal-dates","personal-dates");
                        vueThis.disabledButton = false;
                    })
                }
                else {
                    this.$eventAlert.$emit("open-alert",mensajeAlert);
                    this.$eventPersonal.$emit("update-personal-dates","personal-dates");
                    this.disabledButton = false;
                }


                // debugger;
            },
            clickCancel() {
                this.disabledButton = true
                this.clearAll();
                this.$eventPersonal.$emit("update-personal-dates","personal-dates");
                this.disabledButton = false
            },
            clearAll() {
                this.$eventClear.$emit("clear-input-text","input");
                this.$eventClear.$emit("clear-select-personal","select-dades-personals");
                this.$eventClear.$emit("clear-antecedents","antecedents");
                this.$eventClear.$emit("clear-check-information-save","check-information-save");
                this.$eventClear.$emit("clear-select-location","select-location");
                this.$eventClear.$emit("clear-check-catalonia","check-catalonia");
                this.$eventClear.$emit("clear-select-tipus-location","select-tipus-location");
                this.$eventClear.$emit("clear-select-other-provincies","select-other-provincies");
                this.$eventClear.$emit("clear-detalls","detalls");
                this.$eventClear.$emit("clear-select-emergencia","select-location");
                this.$eventClear.$emit("clear-nota-comuna","nota-comuna");
                this.$eventClear.$emit("clear-relation-expedient","relation-expedient");

                this.$eventClear.$emit("clear-time","time");

                this.objectPost.expedients.id = null;
                if(this.objectPost.dades_personals.id != null) {
                    this.$eventClear.$emit("clear-dades-personals","dades-personals");
                }
                this.objectPost.dades_personals.id = null;

                //Vaciar select mark
                this.$eventClear.$emit("clear-select-mark","select-mark");
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

            this.$eventFinal.$on("recojer-origen-llamada", origenLlamada => {
                if(origenLlamada != "" && origenLlamada != null) {
                    this.finalDates.origenLlamada = origenLlamada
                }
                else {
                    this.finalDates.origenLlamada = null
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

            //Time Section

            this.$eventFinal.$on("recojer-fecha", fecha => {
                this.finalDates.fecha = fecha
            })

            this.$eventFinal.$on("recojer-hora", hora => {
                this.finalDates.hora = hora
            })

            this.$eventFinal.$on("recojer-tiempo", tiempo => {
                this.finalDates.tiempo = tiempo
            })

            this.$eventFinal.$on("recojer-tiempo-segundos", timeSeconds => {
                this.finalDates.timeSeconds = timeSeconds
            })


            this.$eventFinal.$on("recojer-operador", operador => {
                this.finalDates.operador = operador
            })

            //Relation expedient

            this.$eventFinal.$on("recojer-id-expedient", idExpedient => {
                this.finalDates.expedientId = idExpedient
            })

            //Relation dades personals

            this.$eventFinal.$on("recojer-id-dada-personal", dadaPersonalId => {
                this.finalDates.dadaPersonalId = dadaPersonalId
            })

            //Agencies

            this.$eventFinal.$on("recojer-id-agencies", selectMarks => {
                this.finalDates.selectMarks = selectMarks
            })

        }
    }
</script>
