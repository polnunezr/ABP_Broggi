<template>
    <div class="col col-3 colTimeExit">

        <div class="row">
            <div class="col col-3">
                <button type="button" class="button buttonNormal" v-on:click="clickSalir">Sortir</button>
            </div>
            <div class="col-7 colSection colTime">

                <data-time titleData="Data" :data="data" first></data-time>

                <data-time titleData="Hora" :data="hora"></data-time>

                <data-time titleData="Temps" :data="time"></data-time>

                <data-time :titleData="perfil" :data="codi"></data-time>

            </div>
        </div>
        <help-box-icon></help-box-icon>
        <help-box v-if="helpBoxOpen" :selectTab="selectTab"></help-box>

    </div>
</template>

<script>
    export default {
        props: {
            cartaTrucadaShow: {
                type: [Object],
                require: true
            },
            logOutRoute: {
                type:[String],
                require: true
            },
            user: {
                type:[Object],
                require: true
            },
            show: {
                type: [Boolean],
                require: true
            }
        },
        data() {
            return {
                time:"00:00",
                start: false,
                data: "08/03/2022",
                hora: "16:28:00",
                timeSeconds: 0,
                intervalTime: null,
                helpBoxOpen: false,
                selectTab: 1,
                codi: null,
                perfil: null
            }
        },
        created() {

            this.codi = this.user.codi
            this.perfil = this.user.perfil_nom

            if(!this.show) {

                let today = new Date();
                let dia = today.getDate();
                if(dia <= 9) {
                    dia = "0" + dia
                }
                let mes = today.getMonth() + 1;
                if(mes <= 9) {
                    mes = "0" + mes
                }
                let year = today.getFullYear();

                this.data = dia +"/"+ mes +"/"+year;

                this.updateHour();

                setInterval(this.updateHour,1000)
            }
            else {
                let dataHoraSplit = this.cartaTrucadaShow.data_hora.split(" ");
                this.data = dataHoraSplit[0].replace("-","/");
                this.data = this.data.replace("-","/");

                this.hora = dataHoraSplit[1];

                this.time = this.cartaTrucadaShow.temps_trucada + "s"
            }


        },
        methods: {
            updateHour() {
                let today = new Date();
                let hour = today.getHours().toString();
                let minut = today.getMinutes().toString();
                let second = today.getSeconds().toString();
                if(second <= 9) {
                    second = "0" + second
                }
                this.hora = hour + ":" + minut+":"+second
            },
            clickSalir() {
                // axios.get(route("menu"))
                window.location.href = this.logOutRoute
            }
        },
        mounted() {
            this.$eventTime.$on("start-time", message => {
                let vueThis = this
                let lastCharacter,lastCharacterInt,penultimateCharacterInt,secondCharacterInt,firstCharacterInt
                if(!this.start) {
                    this.start = true
                    this.intervalTime = setInterval(function() {
                        lastCharacter = vueThis.time.substring(vueThis.time.length - 1, vueThis.time.length)
                        lastCharacterInt = parseInt(lastCharacter)
                        if(lastCharacterInt == 9) {
                            penultimateCharacterInt = parseInt(vueThis.time.substring(vueThis.time.length - 2, vueThis.time.length - 1))
                            if(penultimateCharacterInt == 5) {
                                secondCharacterInt = parseInt(vueThis.time.substring(vueThis.time.length - 4, vueThis.time.length-3))
                                if(secondCharacterInt == 9) {
                                    firstCharacterInt = parseInt(vueThis.time.substring(vueThis.time.length - 5, vueThis.time.length-4))
                                    if(firstCharacterInt != 5) {
                                        firstCharacterInt++
                                        vueThis.time = firstCharacterInt.toString() + "0:00"
                                    }
                                }
                                else {
                                    secondCharacterInt++
                                    vueThis.time = vueThis.time.substring(0,vueThis.time.length - 4)
                                    vueThis.time = vueThis.time.concat(secondCharacterInt + ":00")
                                }

                            }
                            else {
                                penultimateCharacterInt++
                                vueThis.time = vueThis.time.substring(0,vueThis.time.length - 2)
                                vueThis.time = vueThis.time.concat(penultimateCharacterInt)
                                vueThis.time = vueThis.time.concat("0")
                            }

                        }
                        else {
                            lastCharacterInt++
                            vueThis.time = vueThis.time.substring(0,vueThis.time.length - 1)
                            vueThis.time = vueThis.time.concat(lastCharacterInt)
                        }

                        vueThis.timeSeconds++

                    },1000)
                }
            })

            this.$eventFinal.$on("obtener-fecha", message => {
                this.$eventFinal.$emit("recojer-fecha",this.data);
            })

            this.$eventFinal.$on("obtener-hora", message => {
                this.$eventFinal.$emit("recojer-hora",this.hora);
            })

            this.$eventFinal.$on("obtener-tiempo", message => {
                this.$eventFinal.$emit("recojer-tiempo",this.time);
            })

            this.$eventFinal.$on("obtener-tiempo-segundos", message => {
                this.$eventFinal.$emit("recojer-tiempo-segundos",this.timeSeconds);
            })

            this.$eventClear.$on("clear-time", message => {
                if(this.intervalTime != null) {
                    clearInterval(this.intervalTime);
                    this.intervalTime = null
                    this.time ="00:00"
                    this.start = false
                    this.timeSeconds = 0
                }
            })

            this.$eventHelpBox.$on("open-help-box", helpBoxOpen => {
                this.helpBoxOpen = helpBoxOpen
            })

            this.$eventHelpBox.$on("close-help-box", helpBoxOpen => {
                this.helpBoxOpen = helpBoxOpen
            })

            this.$eventHelpBox.$on("change-section", section => {
                let selectTabActual = null
                switch(section) {
                    case this.$dadesPersonals:
                        this.selectTab = 1
                        selectTabActual = 1
                    break;
                    case this.$locate:
                        this.selectTab = 2
                        selectTabActual = 2
                    break;
                    case this.$agency:
                        this.selectTab = 3
                        selectTabActual = 3
                    break;
                    case this.$emergency:
                        this.selectTab = 4
                        selectTabActual = 4
                    break;
                    case this.$communeNote:
                        this.selectTab = 5
                        selectTabActual = 5
                    break;
                    case this.$relationExpedient:
                        this.selectTab = 6
                        selectTabActual = 6
                    break;
                }
                this.$eventHelpBox.$emit("change-section-in-help-box",selectTabActual);
            })
        }
    }
</script>
