<template>
    <div id="map">
    </div>
</template>

<script>
    export default {
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
            }
        },
        created() {

            let vueThis = this;

            axios
            .get("/agencies")
            .then(response => {
                vueThis.agencies = response.data
                vueThis.controlMap();
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
                        mapThis.mark.id = i;
                        mapThis.mark.features = response.body.features[0];
                        mapThis.mark.popup = new mapboxgl.Popup({ offset: 25 })
                        .setText(
                            mapThis.agencies[i].carrer
                        )
                        .setHTML(
                            "<div class='container container-map'>" +
                            "<div class='row'>" +
                            "<div class='col d-flex justify-content-center align-items-center'>" +
                            "<p>" + mapThis.agencies[i].carrer +"</p>" +
                            "</div>" +
                            "</div>" +
                            "<div class='row'>" +
                            "<div class='col colButtonMap d-flex justify-content-center align-items-center'>" +
                            "<button type='button' class='button' id='buttonMap"+i+"'>Relacionar</button>" +
                            "</div>" +
                            "</div>" +
                            "</div>"
                        );
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

                    const el = document.createElement("div");
                    el.id = "marker1";
                    el.className = el.className + " markers";

                    // Create a marker and add it to the map.
                    // mapThis.marker =
                    new mapboxgl.Marker(el).setLngLat(feature.center).addTo(map);

                    // mapThis.marker._element.id = "marker1";
                    // mapThis.marker._element.className = mapThis.marker._element.className + " markers";

                    // mapThis.marker.marker-color = "#b40219";

                    for(let i = 0; i < mapThis.markers.length; i++) {
                        const elMark = document.createElement("div");
                        elMark.id = mapThis.markers[i].id;
                        elMark.className = elMark.className + " markers";
                        new mapboxgl.Marker()
                        .setLngLat(mapThis.markers[i].features.center)
                        .setPopup(mapThis.markers[i].popup)
                        .addTo(map);
                        // new mapboxgl.Marker().setLngLat(mapThis.features[i].center).addTo(map);
                    }

                });
            }
        }
    }
</script>
