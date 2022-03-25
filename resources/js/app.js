    /**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

const { message } = require('laravel-mix/src/Log');

require('./bootstrap');

window.Vue = require('vue').default;

/**
 * The following block of code may be used to automatically register your
 * Vue components. It will recursively scan this directory for the Vue
 * components and automatically register them with their "basename".
 *
 * Eg. ./components/ExampleComponent.vue -> <example-component></example-component>
 */

// const files = require.context('./', true, /\.vue$/i)
// files.keys().map(key => Vue.component(key.split('/').pop().split('.')[0], files(key).default))


Vue.prototype.$checkCatalonia="Catalunya"

Vue.prototype.$provincia="Provincia"
Vue.prototype.$comarca="Comarca"
Vue.prototype.$municipi="Municipi"

Vue.prototype.$provinciaPersonal="provinciaSelectPersonal"
Vue.prototype.$comarcaPersonal="comarcaSelectPersonal"
Vue.prototype.$municipiPersonal="municipiSelectPersonal"

Vue.prototype.$provinciaLocation="ProvinciaSelectLocation"
Vue.prototype.$comarcaLocation="ComarcaSelectLocation"
Vue.prototype.$municipiLocation="MunicipiSelectLocation"

Vue.prototype.$nullLoclaitzacio = ""

Vue.prototype.$tipusLocalitzacio="Tipus localització"
Vue.prototype.$tipusLocalitzacioId="tipusLocalitzacioSelect"

Vue.prototype.$tipusEmergencia="Tipus d'emergencia general"
Vue.prototype.$tipusEmergenciaId="selectEmergencyGeneral"

Vue.prototype.$incidents="Tipus d'emergencia específica"
Vue.prototype.$incidentsId="selectEmergencySpecific"

Vue.prototype.$noVideo = "NO"
Vue.prototype.$yesVideo= "YES"
Vue.prototype.$refreshVideo = "refresh"
Vue.prototype.$refreshGeneral="refreshGeneral"

Vue.prototype.$videoURL = "https://paucepnet.github.io/videosProjecte/media/videoInteractivo.mp4"

Vue.prototype.$v1="#t=0,24"
Vue.prototype.$qv1 = "¿Llamada procedente?"

Vue.prototype.$v10="#t=25,32"

Vue.prototype.$v11="#t=33,53"
Vue.prototype.$qv11 = "¿Sistema de aviso especial?"

Vue.prototype.$v111="#t=59,73"

Vue.prototype.$inputTelefon="inputTelefon"
Vue.prototype.$inputProcedencia="inputProcedencia"
Vue.prototype.$inputAdreca="inputAdreca"
Vue.prototype.$inputOrigen="inputOrigen"
Vue.prototype.$checkSaveInformation="checkSaveInformation"

Vue.prototype.$checkCatalunya="checkCatalunya"

Vue.prototype.$inputTipusDeVia="inputTipusDeVia"
Vue.prototype.$inputNom="inputNom"
Vue.prototype.$inputNumero="inputNumero"
Vue.prototype.$inputEscala="inputEscala"
Vue.prototype.$inputPis="inputPis"
Vue.prototype.$inputPorta="inputPorta"

Vue.prototype.$inputNomPuntSingular="inputNomPuntSingular"

Vue.prototype.$inputNomCarretera="inputNomCarretera"
Vue.prototype.$inputPuntKilometric="inputPuntKilometric"
Vue.prototype.$inputSentit="inputSentit"

Vue.prototype.$provinciaSelectProvincia="provinciaSelectProvincia"
Vue.prototype.$inputProvinciaMunicipi="inputProvinciaMunicipi"

Vue.prototype.$textAreaDetalls="textAreaDetalls"




Vue.prototype.$eventTime = new Vue()

Vue.prototype.$eventVideo = new Vue()

Vue.prototype.$eventSelect = new Vue()

Vue.prototype.$eventCheck = new Vue()

Vue.prototype.$eventRelation = new Vue()

Vue.prototype.$eventFinal = new Vue()





// Vue.component('example-component', require('./components/ExampleComponent.vue').default);

Vue.component('carta-trucada', require('./components/CartaTrucada.vue').default);

Vue.component('tab-apart', require('./components/nav/TabApart.vue').default);

Vue.component('apart-navbar', require('./components/nav/ApartNavbar.vue').default);

Vue.component("time-section", require("./components/sections/TimeSection.vue").default);

Vue.component("personal-section", require("./components/sections/PersonalSection.vue").default);

Vue.component("location-section", require("./components/sections/LocationSection.vue").default);

Vue.component("agency-section", require("./components/sections/AgencySection.vue").default);

Vue.component("emergency-section", require("./components/sections/EmergencySection.vue").default);

Vue.component("commune-note-section", require("./components/sections/CommuneNoteSection.vue").default);

Vue.component("relation-section", require("./components/sections/RelationSection.vue").default);

Vue.component("relation-modal", require("./components/sections/RelationModalSection.vue").default);

Vue.component("video-section", require("./components/sections/videoSection/VideoSection.vue").default);

Vue.component("backdrop-video", require("./components/sections/videoSection/BackdropVideo.vue").default);

Vue.component("backdrop-video-button", require("./components/sections/videoSection/BackdropVideoButton.vue").default);

Vue.component("backdrop-video-refresh-button", require("./components/sections/videoSection/BackdropVideoRefreshButton.vue").default);

Vue.component("backdrop-refresh", require("./components/sections/videoSection/BackdropRefresh.vue").default);

Vue.component("finish-section", require("./components/sections/FinishSection.vue").default);

Vue.component("data-input", require("./components/forms/DataInput.vue").default);

Vue.component("data-time", require("./components/forms/DataTime.vue").default);

Vue.component("data-emergency", require("./components/forms/DataEmergency.vue").default);

Vue.component("data-check", require("./components/forms/DataCheck.vue").default);

Vue.component("data-select", require("./components/forms/DataSelect.vue").default);






/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

// Vue.component("tab-apart", {
//     template:
//     `
//     <div>
//         <apart-navbar name="Dades personals" emoticon="fa fa-solid fa-user" v-on:click.native="changeSection(personalData)"></apart-navbar>
//         <apart-navbar name="Localització" emoticon="fa fa-map-marker" v-on:click.native="changeSection(locate)"></apart-navbar>
//         <apart-navbar name="Agències" emoticon="fa fa-solid fa-car-side" v-on:click.native="changeSection(agency)"></apart-navbar>
//         <apart-navbar name="Emergencia" emoticon="fas fa-ambulance" v-on:click.native="changeSection(emergency)"></apart-navbar>
//         <apart-navbar name="Nota comuna" emoticon="fa fa-sticky-note-o" v-on:click.native="changeSection(communeNote)"></apart-navbar>
//         <apart-navbar name="Relacionar Expedient" emoticon="fa fa-solid fa-book" v-on:click.native="changeSection(relationExpedient)"></apart-navbar>
//         <apart-navbar name="Vídeo interactiu" emoticon="fas fa-video" v-on:click.native="changeSection(interactiveVideo)" video></apart-navbar>
//     </div>

//     `,
//     data() {
//         return {
//             personalData: "Dades Personals",
//             locate: "Localitzacio",
//             agency: "Agencies",
//             emergency: "Emergencia",
//             communeNote: "Nota comuna",
//             relationExpedient: "Relacionar Expedient",
//             interactiveVideo: "video"
//         }
//     },
//     methods: {
//         changeSection(section) {
//             eventTime.$emit("change-section",section);
//         }
//     }

// })

// Vue.component("apart-navbar", {
//     props: {
//         name: {
//             type: [String],
//             require: true
//         },
//         emoticon: {
//             type: [String],
//             require: true
//         },
//         video:Boolean
//     },
//     template:
//     `
//     <div class="row" v-bind:style="video ? 'margin-top: 210px;' : 'margin-top: 60px;'">
//         <div class="col colApart">
//             <div class="row form-row">
//                 <div class="col col-2 d-flex justify-content-end align-items-center">
//                     <i :class="emoticon"></i>
//                 </div>
//                 <div class="col col-10 d-flex justify-content-start align-items-center">
//                     <p class="pApart">{{ name }}</p>
//                 </div>
//             </div>

//         </div>

//     </div>
//     `
// })

// Vue.component("personal-section", {
//     template:
//     `
//     <div class="row d-flex justify-content-center">
//         <div class="col col-8 colSection colPersonalDates">
//             <div class="row">
//                 <div class="col">
//                     <h4 v-text="title"></h4>
//                 </div>
//             </div>

//             <data-input name="Telefon" id_input="inputTelefon" ></data-input>

//             <data-input name="Direcció" id_input="inputDireccion" ></data-input>

//             <div class="row" style="margin-top: 20px">
//                 <div class="col">
//                     <div class="form-floating">
//                         <textarea class="form-control" id="textAreaAntecedents"
//                         style="height: 130px; resize: none" v-on:click="startTime"></textarea>
//                         <label for="textAreaAntecedents">Antecedents</label>
//                     </div>
//                 </div>
//             </div>


//         </div>
//     </div>
//     `,
//     data() {
//         return {
//             title: "Dades personals"
//         }
//     }

// })

// Vue.component("location-section", {
//     template:
//     `
//     <div class="row d-flex justify-content-center">
//         <div class="col col-10 colSection colLocation">
//             <div class="row">
//                 <div class="col">
//                     <h4 v-text="title"></h4>
//                 </div>
//             </div>

//             <data-check name="Catalunya" id_check="checkCatalunya"></data-check>

//             <div class="row">
//                 <div class="col">
//                     <data-select name="Provincia" id_select="provinciaSelect" small></data-select>
//                 </div>
//                 <div class="col">
//                     <data-select name="Comarca" id_select="comarcaSelect" small></data-select>
//                 </div>
//                 <div class="col">
//                     <data-select name="Municipi" id_select="municipiSelect" small></data-select>
//                 </div>
//             </div>

//             <data-input name="Direccio" id_input="inputDireccio"></data-input>

//             <div class="row" style="margin-top: 20px">
//                 <div class="col">
//                     <div class="form-floating">
//                         <textarea class="form-control" id="textAreaDetalls"
//                         style="height: 130px; resize: none" v-on:click="startTime"></textarea>
//                         <label for="textAreaDetalls">Detalls</label>
//                     </div>
//                 </div>
//             </div>

//         </div>
//     </div>
//     `,
//     data() {
//         return {
//             title: "Localització"
//         }
//     },
//     methods: {
//         startTime() {
//             eventTime.$emit("start-time","message");
//         }
//     }




// })

// Vue.component("agency-section", {

//     template:
//     `
//     <div class="row d-flex justify-content-center">
//         <div class="col col-8 colSection colAgency">
//             <div class="row">
//                 <div class="col">
//                     <h4 v-text="title"></h4>
//                 </div>
//             </div>

//             <div class="row" style="margin-top: 20px">
//                 <div class="col col-10">
//                     <input type="text" class="form-control">
//                 </div>
//                 <div class="col col-2 d-flex justify-content-center align-items-center">
//                     <button type="button" class="button">Afegir</button>
//                 </div>
//             </div>
//             <div class="row" style="margin-top: 20px">
//                 <div class="col col-10">
//                     <textarea v-on:click="startTime" class="form-control" id="textAreaAgency"></textarea>
//                 </div>
//                 <div class="col col-2 d-flex justify-content-center align-items-end">
//                     <button type="button" class="button">Mapa</button>
//                 </div>

//             </div>

//         </div>
//     </div>

//     `,
//     data() {
//         return {
//             title: "Agències"
//         }
//     },
//     methods: {
//         startTime() {
//             eventTime.$emit("start-time","message");
//         }
//     }



// })

// Vue.component("emergency-section", {
//     template:
//     `
//         <div class="row d-flex justify-content-center">
//             <div class="col col-8 colSection colEmergency">
//                 <div class="row">
//                     <div class="col">
//                         <h4 v-text="title"></h4>
//                     </div>
//                 </div>
//                 <div class="row">
//                     <div class="col">
//                         <data-select name="Tipus d'emergencia general" id_select="selectEmergencyGeneral"></data-select>
//                     </div>
//                 </div>
//                 <div class="row">
//                     <div class="col">
//                         <data-select name="Tipus d'emergencia específica" id_select="selectEmergencySpecific"></data-select>
//                     </div>
//                 </div>
//             </div>
//         </div>
//     `,
//     data() {
//         return {
//             title: "Tipus d'emergencia"
//         }
//     }


// })

// Vue.component("time-section", {

//     template:
//     `
//     <div class="col col-3 colTimeExit">
//         <div class="row">
//             <div class="col col-4">
//                 <button type="button" class="button">Sortir</button>
//             </div>
//             <div class="col-6 colSection colTime">

//                 <data-time titleData="Data" data="08/03/2022" first></data-time>

//                 <data-time titleData="Hora" data="16:28"></data-time>

//                 <data-time titleData="Temps" :data="time"></data-time>

//             </div>
//         </div>
//     </div>
//     `,
//     data() {
//         return {
//             time:"00:00",
//             start: false,
//         }
//     },
//     mounted() {
//         eventTime.$on("start-time", message => {
//             let vueThis = this
//             let lastCharacter,lastCharacterInt,penultimateCharacterInt,secondCharacterInt,firstCharacterInt
//             if(!this.start) {
//                 this.start = true
//                 setInterval(function() {
//                     lastCharacter = vueThis.time.substring(vueThis.time.length - 1, vueThis.time.length)
//                     lastCharacterInt = parseInt(lastCharacter)
//                     if(lastCharacterInt == 9) {
//                         penultimateCharacterInt = parseInt(vueThis.time.substring(vueThis.time.length - 2, vueThis.time.length - 1))
//                         if(penultimateCharacterInt == 5) {
//                             secondCharacterInt = parseInt(vueThis.time.substring(vueThis.time.length - 4, vueThis.time.length-3))
//                             if(secondCharacterInt == 9) {
//                                 firstCharacterInt = parseInt(vueThis.time.substring(vueThis.time.length - 5, vueThis.time.length-4))
//                                 if(firstCharacterInt != 5) {
//                                     firstCharacterInt++
//                                     vueThis.time = firstCharacterInt.toString() + "0:00"
//                                 }
//                             }
//                             else {
//                                 secondCharacterInt++
//                                 vueThis.time = vueThis.time.substring(0,vueThis.time.length - 4)
//                                 vueThis.time = vueThis.time.concat(secondCharacterInt + ":00")
//                             }

//                         }
//                         else {
//                             penultimateCharacterInt++
//                             vueThis.time = vueThis.time.substring(0,vueThis.time.length - 2)
//                             vueThis.time = vueThis.time.concat(penultimateCharacterInt)
//                             vueThis.time = vueThis.time.concat("0")
//                         }

//                     }
//                     else {
//                         lastCharacterInt++
//                         vueThis.time = vueThis.time.substring(0,vueThis.time.length - 1)
//                         vueThis.time = vueThis.time.concat(lastCharacterInt)
//                     }

//                 },1000)
//             }
//         })
//     },
//     methods: {
//         changeTime() {

//         }
//     }

// })

// Vue.component("data-time", {

//     props: {
//         titleData: {
//             type: [String],
//             require: true
//         },
//         data: {
//             type: [String],
//             require: true
//         },
//         first:Boolean
//     },

//     template:
//     `
//     <div class="row" v-bind:style="first ? 'margin-top: 0px;' : 'margin-top: 20px;'">
//         <div class="col col-6 d-flex justify-content-start align-items-center"
//             style="fontWeight: bold">
//             {{ titleData }}
//         </div>
//         <div class="col col-6 d-flex justify-content-end align-items-center">
//             {{ data }}
//         </div>
//     </div>
//     `


// })

// Vue.component("commune-note-section" , {

//     template:
//     `
//     <div class="row d-flex justify-content-center">
//         <div class="col col-9 colSection colCommuneNote">
//             <div class="row">
//                 <div class="col">
//                     <h4 v-text="title"></h4>
//                 </div>
//             </div>
//             <div class="row" style="margin-top: 20px">
//                 <div class="col">
//                     <div class="form-floating">
//                         <textarea v-on:click="startTime" class="form-control" id="textAreaCommuneNote" style="height: 200px; resize:none"></textarea>
//                     </div>
//                 </div>
//             </div>

//         </div>
//     </div>
//     `    ,
//     data() {
//         return {
//             title: "Nota comuna"
//         }
//     },
//     methods: {
//         startTime() {
//             eventTime.$emit("start-time","message");
//         }
//     }


// })

// Vue.component("relation-section", {
//     template:
//     `
//         <div class="row d-flex justify-content-center">
//             <div class="col col-8 colSection colRelationSection d-flex justify-content-start align-items-center">
//                 <button type="button" class="button">Relacionar expedient</button>
//             </div>
//         </div>
//     `


// })

// Vue.component("video-section", {
//     template:
//     `
//     <div class="row d-flex">
//         <div class="col col-11 colCard colVideo d-flex justify-content-center align-items-center">
//             <div id="containerVideo">
//                 <backdrop-video></backdrop-video>
//                 <backdrop-refresh></backdrop-refresh>
//                 <video @timeupdate="timeUpdateVideo" ref="videoo" id="video" width="1066.2" height="600" controls>
//                     <source id="sourceVideo" :src="getSrc" type="video/mp4">
//                 </video>
//             </div>
//         </div>
//     </div>
//     `,
//     data() {
//         return {
//             src: videoURL,
//             timeVideo: v1,
//             currentTime: 0,
//             tipoVideo: "1"
//         }
//     },
//     computed: {
//         getSrc() {
//             return this.src + this.timeVideo;
//         }
//     },
//     methods: {
//         timeUpdateVideo() {
//             this.currentTime = this.$refs.videoo.currentTime

//             switch(this.tipoVideo) {
//                 case "1":
//                     if(this.$refs.videoo.currentTime < 0) {
//                         this.$refs.videoo.currentTime = 0;
//                     }
//                     else if(this.$refs.videoo.currentTime > 24) {
//                         this.showBackdrop()
//                     }
//                     else if(this.$refs.videoo.onpause == true && this.$refs.videoo.currentTime >= 24) {
//                         this.showBackdrop()
//                     }
//                     break;
//                 case "10":
//                     if(this.$refs.videoo.currentTime < 25) {
//                         this.$refs.videoo.currentTime = 25;
//                     }
//                     else if(this.$refs.videoo.currentTime > 32) {
//                         this.showBackdropRefresh()
//                     }
//                     else if(this.$refs.videoo.onpause == true && this.$refs.videoo.currentTime >= 32) {
//                         this.showBackdropRefresh()
//                     }
//                     break;
//             }

//         },
//         showBackdrop() {
//             this.$refs.videoo.style.display = "none"
//             eventVideo.$emit("change-backdrop-video","¿Llamada procedente?")
//         },
//         showBackdropRefresh() {
//             this.$refs.videoo.style.display = "none"
//             eventVideo.$emit("change-backdrop-refresh","true")
//         },
//         refresh() {
//             this.$refs.videoo.style.display = "block"
//             this.$refs.videoo.load()
//             this.$refs.videoo.play()
//         }
//     },
//     mounted() {
//         eventVideo.$on("new-video", optionVideo => {

//             if(optionVideo == yesVideo || optionVideo == noVideo) {

//                 switch(this.tipoVideo) {
//                     case "1":
//                         if(optionVideo == yesVideo) {

//                         }
//                         else {
//                             this.timeVideo = v10
//                             this.tipoVideo = "10"
//                             this.refresh()
//                         }

//                         break;
//                 }

//             }
//             else if(optionVideo == refreshVideo){
//                 this.refresh()

//             }
//             else {
//                 this.timeVideo = v1
//                 this.tipoVideo = "1"
//                 this.refresh()
//             }


//         })

//     }
// })

// Vue.component("backdrop-video", {

//     template:
//     `
//         <div class="backdrop" v-bind:style="showBackdrop ? 'display: block;' : 'display: none;'">
//             <div class="container-fluid">
//                 <div class="row">
//                     <div class="col d-flex justify-content-center align-items-center" style="height: 150px;">
//                         <p id="titleVideo">{{ title }}</p>
//                     </div>
//                 </div>
//                 <div class="row">

//                     <backdrop-video-button answerText="SI" v-on:click.native="yesButton" ></backdrop-video-button>

//                     <backdrop-video-button answerText="NO" v-on:click.native="noButton"></backdrop-video-button>


//                 </div>
//                 <div class="row">
//                     <backdrop-video-refresh-button v-on:click.native="refreshButton"></backdrop-video-refresh-button>
//                 </div>
//             </div>
//         </div>
//     `,
//     data() {
//         return {
//             showBackdrop: false,
//             title: "Broggi"
//         }
//     },
//     methods: {
//         yesButton() {
//             this.showBackdrop = false
//             eventVideo.$emit("new-video",yesVideo)
//         },
//         noButton() {
//             this.showBackdrop = false
//             eventVideo.$emit("new-video",noVideo)
//         },
//         refreshButton() {
//             this.showBackdrop = false
//             eventVideo.$emit("new-video",refreshVideo)
//         }
//     },
//     mounted() {
//         eventVideo.$on("change-backdrop-video", title => {
//             this.title = title
//             this.showBackdrop = true
//         })
//     }

// })

// Vue.component("backdrop-video-button" , {
//     props: {
//         answerText: {
//             type: [String],
//             require: true
//         }
//     },
//     template:
//     `
//     <div class="col col-6 d-flex align-items-center justify-content-center" style="height: 375px;">
//         <div class="questions d-flex align-items-center justify-content-center">
//             <p class="answers">{{answerText}}</p>
//         </div>
//     </div>
//     `

// })

// Vue.component("backdrop-video-refresh-button", {

//     template:
//     `
//     <div class="col col-1 d-flex align-items-center justify-content-center" style="height: 75px;">
//         <div id="refreshButton">
//             <i class="fa fa-refresh"></i>
//         </div>

//     </div>
//     `

// })

// Vue.component("backdrop-refresh", {

//     template:
//     `
//     <div class="backdrop" v-bind:style="showBackdropRefresh ? 'display: block;' : 'display: none;'">
//         <div class="container-fluid">
//             <div class="row">
//                 <div class="col d-flex align-items-center justify-content-center" style="height: 600px;">
//                     <div v-on:click="refreshButtonGeneral">
//                         <i class="fa fa-refresh fa-7x"></i>
//                     </div>

//                 </div>
//             </div>
//         </div>
//     </div>
//     `,
//     data() {
//         return {
//             showBackdropRefresh: false
//         }
//     },
//     methods: {
//         refreshButtonGeneral() {
//             this.showBackdropRefresh = false
//             eventVideo.$emit("new-video",refreshGeneral)
//         }
//     },
//     mounted() {
//         eventVideo.$on("change-backdrop-refresh", valor => {
//             this.showBackdropRefresh = valor
//         })
//     }


// })

// Vue.component("finish-section", {
//     template:
//     `
//     <div id="finishSection">
//         <button type="button" class="button">Cancelar</button>
//         <button type="button" class="button" style="margin-left: 10px">Finalitzar</button>
//     </div>

//     `
// })

// Vue.component("data-select", {
//     props: {
//         name: {
//             type: [String],
//             require: true
//         },
//         id_select: {
//             type:[String],
//             require: true
//         },
//         small: Boolean
//     },

//     template:
//     `
//     <div class="row form-row" style="margin-top: 20px">
//         <div class="col d-flex"
//             v-bind:class="colSmall">
//             <label :for="id_select">{{ name }}</label>
//         </div>
//         <div class="col d-flex justify-content-center align-items-center"
//             v-bind:class="colBig">
//             <select v-on:click="startTime" class="form-select" id="id_select">
//                 <option value="1">One</option>
//                 <option value="2">Two</option>
//                 <option value="3">Three</option>
//             </select>
//         </div>
//     </div>
//     `,
//     computed: {
//         colSmall() {
//             let response = "";
//             if(this.small == true) {
//                 response = "col-3 justify-content-center align-items-center"
//             }
//             else {
//                 response = "col-5 align-items-center"
//             }
//             return response;
//         },
//         colBig() {
//             let response = "";
//             if(this.small == true) {
//                 response = "col-9"
//             }
//             else {
//                 response = "col-7"
//             }
//             return response;
//         }
//     },
//     methods: {
//         startTime() {
//             eventTime.$emit("start-time","message");
//         }
//     }

// })

// Vue.component("data-check", {
//     props: {
//         name: {
//             type: [String],
//             require: true
//         },
//         id_check: {
//             type:[String],
//             require: true
//         }
//     },
//     template:
//     `
//     <div class="row" style="margin-top: 20px">
//         <div class="col">
//             <div class="form-check">
//             <label class="form-check-label" :for="id_check">
//                 {{ name }}
//             </label>
//             <input class="form-check-input" type="checkbox" value="" :id="id_check">
//             </div>
//         </div>
//     </div>

//     `
// })

// Vue.component("data-input", {

//     props: {
//         name: {
//             type:[String],
//             require: true
//         },
//         id_input: {
//             type:[String],
//             require: true
//         },
//         small: Boolean
//     },

//     template:
//     `
//     <div class="row form-row" style="margin-top: 20px">

//         <div class="col d-flex justify-content-center align-items-center"
//             v-bind:class="colSmall">
//             <label :for="id_input">{{ name }}</label>
//         </div>
//         <div class="col"
//             v-bind:class="colBig">
//             <input type="text" class="form-control" :id="id_input" v-on:click="startTime">
//         </div>
//     </div>
//     `,
//     computed: {
//         colSmall() {
//             let response = "";
//             if(this.small == false) {
//                 response = "col-1"
//             }
//             else {
//                 response = "col-2"
//             }
//             return response;
//         },
//         colBig() {
//             let response = "";
//             if(this.small == false) {
//                 response = "col-11"
//             }
//             else {
//                 response = "col-10"
//             }
//             return response;
//         }
//     },
//     methods: {
//         startTime() {
//             eventTime.$emit("start-time","message");
//         }
//     }

// })

const app = new Vue({
    el: '#app'
});
