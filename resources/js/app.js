/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

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

Vue.component('example-component', require('./components/ExampleComponent.vue').default);

/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

Vue.component("personal-section", {
    template:
    `
    <div class="row">
        <div class="col colSection colPersonalDates">
            <div class="row">
                <div class="col">
                    <h4 v-text="title"></h4>
                </div>
            </div>

            <data-input name="Telefon" id_input="inputTelefon" ></data-input>

            <div class="row">
                <div class="col col-6">
                    <data-input name="Nom" id_input="inputNom" small></data-input>
                </div>
                <div class="col col-6">
                    <data-input name="Cognoms" id_input="inputCognoms" small></data-input>
                </div>

            </div>


        </div>
    </div>
    `,
    data() {
        return {
            title: "Dades personals"
        }
    }

})

Vue.component("location-section", {
    template:
    `
    <div class="row">
        <div class="col colSection colLocation">
            <div class="row">
                <div class="col">
                    <h4 v-text="title"></h4>
                </div>
            </div>

            <data-check name="Catalunya" id_check="checkCatalunya"></data-check>

            <div class="row">
                <div class="col">
                    <data-select name="Provincia" id_select="provinciaSelect"></data-select>
                </div>
                <div class="col">
                    <data-select name="Comarca" id_select="comarcaSelect"></data-select>
                </div>
                <div class="col">
                    <data-select name="Municipi" id_select="municipiSelect"></data-select>
                </div>
            </div>

            <data-input name="Direccio" id_input="inputDireccio"></data-input>

            <div class="row" style="margin-top: 20px">
                <div class="col">
                    <div class="form-floating">
                        <textarea class="form-control" id="textAreaDetalls"
                        style="height: 130px; resize: none"></textarea>
                        <label for="textAreaDetalls">Detalls</label>
                    </div>
                </div>
            </div>

        </div>
    </div>
    `,
    data() {
        return {
            title: "Localització"
        }
    }




})

Vue.component("data-select", {
    props: {
        name: {
            type: [String],
            require: true
        },
        id_select: {
            type:[String],
            require: true
        }
    },

    template:
    `
    <div class="row form-row" style="margin-top: 20px">
        <div class="col col-3 d-flex justify-content-center align-items-center">
            <label :for="id_select">{{ name }}</label>
        </div>
        <div class="col col-9 d-flex justify-content-center align-items-center">
            <select class="form-select" id="id_select">
                <option value="1">One</option>
                <option value="2">Two</option>
                <option value="3">Three</option>
            </select>
        </div>
    </div>
    `

})

Vue.component("data-check", {
    props: {
        name: {
            type: [String],
            require: true
        },
        id_check: {
            type:[String],
            require: true
        }
    },
    template:
    `
    <div class="row" style="margin-top: 20px">
        <div class="col">
            <div class="form-check">
            <label class="form-check-label" :for="id_check">
                {{ name }}
            </label>
            <input class="form-check-input" type="checkbox" value="" :id="id_check">
            </div>
        </div>
    </div>

    `
})

Vue.component("data-input", {

    props: {
        name: {
            type:[String],
            require: true
        },
        id_input: {
            type:[String],
            require: true
        },
        small: Boolean
    },

    template:
    `
    <div class="row form-row" style="margin-top: 20px">

        <div class="col d-flex justify-content-center align-items-center"
            v-bind:class="colSmall">
            <label :for="id_input">{{ name }}</label>
        </div>
        <div class="col"
            v-bind:class="colBig">
            <input type="text" class="form-control" :id="id_input">
        </div>
    </div>
    `,
    computed: {
        colSmall() {
            let response = "";
            if(this.small == false) {
                response = "col-1"
            }
            else {
                response = "col-2"
            }
            return response;
        },
        colBig() {
            let response = "";
            if(this.small == false) {
                response = "col-11"
            }
            else {
                response = "col-10"
            }
            return response;
        }
    }

})

const app = new Vue({
    el: '#app'
});
