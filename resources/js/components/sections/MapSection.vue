<template>
    <div id="backdropMap">
        <div id="map">
        <button v-if="showButton" type="button" class="button buttonClick" id="buttonFinalizarMap"
            v-on:click="closeMap">Finalitzar</button>
        </div>
    </div>

</template>

<script>
    export default {
        props: {
            selectMarks: {
                type: [Array],
                require: true
            }
        },
        data() {
            return {
                markers: [],
                mark: {
                    id: null,
                    features: null,
                    popup: null
                },
                marker: null,
                agencies: [],
                buttons: [],
                selectMarksActual: [],
                showButton: false
            }
        },
        created() {
            let vueThis = this;

            axios
            .get("/agencies")
            .then(response => {
                vueThis.agencies = response.data
                vueThis.controlMap()
                vueThis.showButton = true
            })
            .catch(error => {
                console.log(error)
            })
            .finally(() => this.loading = false)
        },
        methods: {
            controlMap() {
                mapboxgl.accessToken = 'pk.eyJ1IjoicGdyYW5lbGxtMjZ0IiwiYSI6ImNsMWIzZWdhNTBvZzMzZm1saGRobnVwb2MifQ.UW5EnRri0CGnQSbPLt6GmA';
                const mapboxClient = mapboxSdk({ accessToken: mapboxgl.accessToken });
                let mapThis = this

                for(let i = 0; i < mapThis.agencies.length; i++) {
                    mapboxClient.geocoding
                    .forwardGeocode({
                        query: mapThis.agencies[i].carrer,
                        autocomplete: false,
                        limit: 1
                    })
                    .send()
                    .then((response) => {
                        if (
                        !response ||
                        !response.body ||
                        !response.body.features ||
                        !response.body.features.length
                        ) {
                            console.error('Invalid response:');
                            console.error(response);
                            return;
                        }
                        mapThis.mark.id = mapThis.agencies[i].id
                        mapThis.mark.features = response.body.features[0];



                        // const divContainer = window.document.createElement('div');
                        // divContainer.innerHTML = "<div class='container container-map'></div>";
                        // const divRow = window.document.createElement('div');
                        // divRow.innerHTML = "<div class='row'></div>";
                        // const divCol = window.document.createElement('div');
                        // divCol.innerHTML = "<div class='col colButtonMap d-flex justify-content-center align-items-center'></div>";

                        const button = window.document.createElement('button');
                        button.type = "button";
                        button.className = "button buttonsMaps";
                        button.id="buttonMap"+mapThis.agencies[i].id;
                        button.innerHTML = "Relacionar"
                        // button.innerHTML = "<button type='button' class='button buttonsMaps' id='buttonMap"+i+"'>Relacionar</button>";

                        const divCol = window.document.createElement('div');
                        divCol.className = "col colButtonMap d-flex justify-content-center align-items-center";
                        // divCol.innerHTML = "<div class='col colButtonMap d-flex justify-content-center align-items-center'></div>";

                        const divRow = window.document.createElement('div');
                        divRow.className = "row";
                        // divRow.innerHTML = "<div class='row'></div>";

                        const divContainer = window.document.createElement('div');
                        divContainer.className = "container container-map";
                        divContainer.innerHTML =
                        "<div class='row'>" +
                        "<div class='col d-flex justify-content-start align-items-center'>" +
                        "<p>" + mapThis.agencies[i].nom +"</p>" +
                        "</div>" +
                        "</div>"+
                        "<div class='row'>" +
                        "<div class='col d-flex justify-content-start align-items-center'>" +
                        "<p>" + mapThis.agencies[i].carrer +"</p>" +
                        "</div>" +
                        "</div>";


                        divCol.appendChild(button);
                        divRow.appendChild(divCol);
                        divContainer.appendChild(divRow);

                        // const divElement = window.document.createElement('div');
                        // divElement.innerHTML =
                        // "<div class='container container-map'>" +
                        // "<div class='row'>" +
                        // "<div class='col d-flex justify-content-center align-items-center'>" +
                        // "<p>" + mapThis.agencies[i].carrer +"</p>" +
                        // "</div>" +
                        // "</div>" +
                        // "<div class='row'>" +
                        // "<div class='col colButtonMap d-flex justify-content-center align-items-center'>" +
                        // "<button type='button' class='button buttonsMaps' id='buttonMap"+i+"'>Relacionar</button>" +
                        // "</div>" +
                        // "</div>" +
                        // "</div>";
                        mapThis.mark.popup = new mapboxgl.Popup({ offset: 25 })
                        .setDOMContent(divContainer);

                        mapThis.buttons.push(button);

                        // mapThis.mark.popup = new mapboxgl.Popup({ offset: 25 })
                        // .setHTML(
                        //     "<div class='container container-map'>" +
                        //     "<div class='row'>" +
                        //     "<div class='col d-flex justify-content-center align-items-center'>" +
                        //     "<p>" + mapThis.agencies[i].carrer +"</p>" +
                        //     "</div>" +
                        //     "</div>" +
                        //     "<div class='row'>" +
                        //     "<div class='col colButtonMap d-flex justify-content-center align-items-center'>" +
                        //     "<button type='button' class='button buttonsMaps' id='buttonMap"+i+"'>Relacionar</button>" +
                        //     "</div>" +
                        //     "</div>" +
                        //     "</div>"
                        // );


                        mapThis.markers.push(Object.assign({}, mapThis.mark))

                        // mapThis.features.push(response.body.features[0]);
                    });
                }

                mapboxClient.geocoding
                .forwardGeocode({
                    query: 'Barcelona',
                    autocomplete: false,
                    limit: 1
                })
                .send()
                .then((response) => {
                    if (
                    !response ||
                    !response.body ||
                    !response.body.features ||
                    !response.body.features.length
                    ) {
                        console.error('Invalid response:');
                        console.error(response);
                        return;
                    }
                    const feature = response.body.features[0];

                    const map = new mapboxgl.Map({
                        container: 'map',
                        style: 'mapbox://styles/mapbox/streets-v11',
                        center: feature.center,
                        zoom: 10
                    });

                    // const el = document.createElement("div");
                    // el.id = "markerOne";
                    // el.className = el.className + " markers";

                    // Create a marker and add it to the map.
                    // mapThis.marker =
                    // new mapboxgl.Marker(el).setLngLat(feature.center).addTo(map);

                    // mapThis.marker._element.id = "marker1";
                    // mapThis.marker._element.className = mapThis.marker._element.className + " markers";

                    // mapThis.marker.marker-color = "#b40219";

                    for(let i = 0; i < mapThis.markers.length; i++) {
                        const elMark = document.createElement("div");
                        elMark.id = "marker"+mapThis.markers[i].id;
                        elMark.className = "mapboxgl-marker mapboxgl-marker-anchor-center markers";
                        new mapboxgl.Marker(elMark)
                        .setLngLat(mapThis.markers[i].features.center)
                        .setPopup(mapThis.markers[i].popup)
                        .addTo(map);
                        // new mapboxgl.Marker().setLngLat(mapThis.features[i].center).addTo(map);
                    }

                    // let button = null;
                    // let markerId = null
                    // let buttonId = null
                    // const markersGet = document.getElementsByClassName("markers");
                    // for(let i = 0; i < markersGet.length; i++) {
                    //     markersGet[i].addEventListener('click', () => {
                    //         // markerId = markersGet[i].id.substring(6,markersGet[i].id.length);
                    //         // buttonId = "buttonMap"+markerId;
                    //         // console.log(markerId)
                    //         // console.log(buttonId)
                    //         // mapThis.$nextTick(() => {
                    //         //     button = document.getElementById(buttonId)
                    //         //     console.log(button.id)
                    //         // })

                    //     })
                    // }


                    let button = null;
                    let buttonId = null;
                    let markerId = null;
                    let positionDelete = null;

                    for(let i = 0; i < mapThis.selectMarks.length; i++) {
                        markerId = "marker"+mapThis.selectMarks[i];
                        const markersGet = document.getElementsByClassName("markers");
                        for(let j = 0; j < markersGet.length; j++) {
                            if(markersGet[j].id == markerId) {

                                markersGet[j].className="mapboxgl-marker mapboxgl-marker-anchor-center markers markerClick"
                            }
                        }

                        buttonId = "buttonMap" + mapThis.selectMarks[i];

                        for(let j = 0; j < mapThis.buttons.length; j++) {
                            if(mapThis.buttons[j].id == buttonId) {
                                mapThis.buttons[j].className="button buttonsMaps buttonClickMap";
                            }
                        }

                        mapThis.selectMarksActual.push(mapThis.selectMarks[i]);
                    }

                    for(let i = 0; i < mapThis.buttons.length; i++) {
                        mapThis.buttons[i].addEventListener('click', (e) => {
                            if(mapThis.buttons[i].className == "button buttonsMaps") {
                                mapThis.buttons[i].className = "button buttonsMaps buttonClickMap";
                                mapThis.buttons[i].innerHTML = "Relacionat";
                                buttonId = parseInt(mapThis.buttons[i].id.substring(9,mapThis.buttons[i].id.length));
                                console.log(buttonId);
                                mapThis.selectMarksActual.push(buttonId);
                                const markersGet = document.getElementsByClassName("markers");
                                for(let i = 0; i < markersGet.length; i++) {
                                    markerId = parseInt(markersGet[i].id.substring(6,markersGet[i].id.length));
                                    if(markerId == buttonId) {
                                        markersGet[i].className="mapboxgl-marker mapboxgl-marker-anchor-center markers markerClick"
                                    }
                                }

                            }
                            else {
                                mapThis.buttons[i].className = "button buttonsMaps";
                                mapThis.buttons[i].innerHTML = "Relacionar";
                                buttonId = parseInt(mapThis.buttons[i].id.substring(9,mapThis.buttons[i].id.length));
                                for(let i = 0; i < mapThis.selectMarksActual.length; i++) {
                                    if(mapThis.selectMarksActual[i] == buttonId) {
                                        positionDelete = i;
                                    }
                                }
                                mapThis.selectMarksActual.splice(positionDelete,1);
                                const markersGet = document.getElementsByClassName("markers");
                                for(let i = 0; i < markersGet.length; i++) {
                                    markerId = parseInt(markersGet[i].id.substring(6,markersGet[i].id.length));
                                    if(markerId == buttonId) {
                                        markersGet[i].className="mapboxgl-marker mapboxgl-marker-anchor-center markers"
                                    }
                                }
                            }

                        });
                    }

                });

                // let buttons = this.$refs.btns
                // const buttonsMaps = document.getElementsByClassName("buttonsMaps");
            },
            closeMap() {
                this.$eventMap.$emit("close-map",this.selectMarksActual);
                this.$eventMap.$emit("send-agencies",this.agencies);
            }
        }
    }
</script>
