    /**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

const { message } = require('laravel-mix/src/Log');

require('./bootstrap');

var VuePaginate = require('vue-paginate');
Vue.use(VuePaginate);

window.Vue = require('vue').default;

// Sebas jQuery:
window.$ = window.jQuery = require('jquery')

/**
 * The following block of code may be used to automatically register your
 * Vue components. It will recursively scan this directory for the Vue
 * components and automatically register them with their "basename".
 *
 * Eg. ./components/ExampleComponent.vue -> <example-component></example-component>
 */

// const files = require.context('./', true, /\.vue$/i)
// files.keys().map(key => Vue.component(key.split('/').pop().split('.')[0], files(key).default))

/*
personalData: "Dades Personals",
                locate: "Localitzacio",
                agency: "Agencies",
                emergency: "Emergencia",
                communeNote: "Nota comuna",
                relationExpedient: "Relacionar Expedient",
                interactiveVideo: "video"
*/

// Vue.prototype.$selectSection="Dades Personals"


//Vue.prototype.$logoSrc="http://daw.abp-politecnics.com/daw03/images/logo/LogoHorizontal.svg"
Vue.prototype.$logoSrc="http://daw.abp-politecnics.com/daw03/images/logo/cropp/logo.svg"

Vue.prototype.$loadSrc="http://daw.abp-politecnics.com/daw03/filesSVG/load.svg"

Vue.prototype.$dadesPersonals="Dades Personals"
Vue.prototype.$locate="Localitzacio"
Vue.prototype.$agency="Agencies"
Vue.prototype.$emergency="Emergencia"
Vue.prototype.$communeNote="Nota comuna"
Vue.prototype.$relationExpedient="Relacionar Expedient"
Vue.prototype.$interactiveVideo="video"

Vue.prototype.$dadesPersonalsCol="col-11"
Vue.prototype.$locateCol="col-11"
Vue.prototype.$agencyCol="col-8"
Vue.prototype.$emergencyCol="col-8"
Vue.prototype.$communeNoteCol="col-9"
Vue.prototype.$relationExpedientCol="col-8"


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

// Vue.prototype.$videoURL = "https://paucepnet.github.io/videosProjecte/media/videoInteractivo.mp4"
Vue.prototype.$videoURL = "http://daw.abp-politecnics.com/daw03/videoInteractivo.mp4"

Vue.prototype.$v1="#t=0,24"
Vue.prototype.$qv1 = "¿Llamada procedente?"

Vue.prototype.$v10="#t=25,32"

Vue.prototype.$v11="#t=33,53"
Vue.prototype.$qv11 = "¿Sistema de aviso especial?"

Vue.prototype.$v111="#t=59,73"

Vue.prototype.$v110="#t=80,128"
Vue.prototype.$qv110 = "¿Procedimiento específico?"

Vue.prototype.$v1101="#t=131,144"

Vue.prototype.$v1100="#t=147,161"
Vue.prototype.$qv1100 = "¿Llamada asociada?"

Vue.prototype.$v11001="#t=164,177"
Vue.prototype.$qv11001 = "¿Ampliar nota común?"

Vue.prototype.$v110010="#t=181,190"

Vue.prototype.$v110011="#t=192,211"
Vue.prototype.$qv110011 = "¿IRE?"

Vue.prototype.$v11000="#t=214,258"
Vue.prototype.$qv11000 = "¿IRE?"

Vue.prototype.$v1100110="#t=261,273"

Vue.prototype.$v1100111="#t=276,299"

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



Vue.prototype.$eventAlert = new Vue()

Vue.prototype.$eventTime = new Vue()

Vue.prototype.$eventVideo = new Vue()

Vue.prototype.$eventSelect = new Vue()

Vue.prototype.$eventCheck = new Vue()

Vue.prototype.$eventRelation = new Vue()

Vue.prototype.$eventFinal = new Vue()

Vue.prototype.$eventClear = new Vue()

Vue.prototype.$eventExpedient = new Vue()

Vue.prototype.$eventPersonal = new Vue()

Vue.prototype.$eventMap = new Vue()

Vue.prototype.$eventHelpBox = new Vue()

Vue.prototype.$eventShow = new Vue()

Vue.prototype.$eventLoad = new Vue()

//Sebas

// EventBus para enviar y recibir el estado de la variable 'load' al insertar un usuario:
Vue.prototype.$eventUsuariMostrarLoadInsert = new Vue()

// EventBus para enviar y recibir el estado de la variable 'load' al insertar un usuario:
Vue.prototype.$eventUsuariOcultarLoadInsert = new Vue()

// EventBus para enviar y recibir el estado de la variable 'load' al modificar un usuario:
Vue.prototype.$eventUsuariMostrarLoadUpdate = new Vue()

// EventBus para enviar y recibir el estado de la variable 'load' al modificar un usuario:
Vue.prototype.$eventUsuariOcultarLoadUpdate = new Vue()

// EventBus para enviar y recibir el estado de la variable 'load' al desactivar un usuario:
Vue.prototype.$eventUsuariMostrarLoadDelete = new Vue()

// EventBus para enviar y recibir el estado de la variable 'load' al desactivar un usuario:
Vue.prototype.$eventUsuariOcultarLoadDelete = new Vue()

// EventBus para recibir el estado de la variable 'isModal':
Vue.prototype.$eventUsuariIsModal = new Vue()

// EventBus para enviar el usuario que queremos modificar:
Vue.prototype.$eventUsuariEdit = new Vue()

// EventBus para enviar el usuario que queremos desactivar:
Vue.prototype.$eventUsuariDelete = new Vue()

// EventBus para enviar y recibir errores:
Vue.prototype.$eventUsuariError = new Vue()

// EventBus para enviar y recibir mensajes de confirmación:
Vue.prototype.$eventUsuariMensaje = new Vue()

// EventBus para refrescar la lista de usuarios:
Vue.prototype.$eventUsuariRefrescar = new Vue()





// Vue.component('example-component', require('./components/ExampleComponent.vue').default);

Vue.component('carta-trucada', require('./components/CartaTrucada.vue').default);

Vue.component('load-page', require('./components/LoadPage.vue').default);

Vue.component('background-decoration-izquierda', require('./components/background-decoration/BackgroundDecorationIzquierda.vue').default);

Vue.component('background-decoration-derecha', require('./components/background-decoration/BackgroundDecorationDerecha.vue').default);

Vue.component('help-box-icon', require('./components/sections/helpBox/helpBoxIcon.vue').default);

Vue.component('help-box', require('./components/sections/helpBox/helpBox.vue').default);

Vue.component('help-box-question', require('./components/sections/helpBox/helpBoxQuestion.vue').default);

Vue.component('tab-apart', require('./components/nav/TabApart.vue').default);

Vue.component('apart-navbar', require('./components/nav/ApartNavbar.vue').default);

Vue.component("map-section", require("./components/sections/MapSection.vue").default);

Vue.component("time-section", require("./components/sections/TimeSection.vue").default);

Vue.component("alert-section", require("./components/sections/AlertSection.vue").default);

Vue.component("personal-section", require("./components/sections/PersonalSection.vue").default);

Vue.component("location-section", require("./components/sections/LocationSection.vue").default);

Vue.component("agency-section", require("./components/sections/AgencySection.vue").default);

Vue.component("list-agency-section", require("./components/sections/ListAgencySection.vue").default);

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

//Sebas

// Le ponemos al componente de usuarios el nombre que usaremos como etiqueta:
Vue.component('usuaris-component', require('./components/gestionUsuarios/UsuarisComponent.vue').default);

// Le ponemos al componente que contiene los filtros de búsqueda el nombre que usaremos como etiqueta:
Vue.component('buscar-component', require('./components/gestionUsuarios/BuscarComponent.vue').default);

// Le ponemos al componente que contiene el modal para desactivar un usuario el nombre que usaremos como etiqueta:
Vue.component('desactivar-component', require('./components/gestionUsuarios/DesactivarComponent.vue').default);

// Le ponemos al componente que contiene el modal para insertar/modificar un usuario el nombre que usaremos como etiqueta:
Vue.component('manipular-component', require('./components/gestionUsuarios/ManipularComponent.vue').default);


const app = new Vue({
    el: '#app'
});
