<template>
    <div class="col col-3 colTimeExit">
        <div class="row">
            <div class="col col-4">
                <button type="button" class="button buttonNormal">Sortir</button>
            </div>
            <div class="col-6 colSection colTime">

                <data-time titleData="Data" :data="data" first></data-time>

                <data-time titleData="Hora" :data="hora"></data-time>

                <data-time titleData="Temps" :data="time"></data-time>

                <data-time titleData="Operador" :data="operador"></data-time>

            </div>
        </div>
    </div>
</template>

<script>
    export default {
        data() {
            return {
                time:"00:00",
                start: false,
                data: "08/03/2022",
                hora: "16:28:00",
                operador: "001",
                timeSeconds: 0
            }
        },
        created() {
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
            }
        },
        mounted() {
            this.$eventTime.$on("start-time", message => {
                let vueThis = this
                let lastCharacter,lastCharacterInt,penultimateCharacterInt,secondCharacterInt,firstCharacterInt
                if(!this.start) {
                    this.start = true
                    setInterval(function() {
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

            this.$eventFinal.$on("obtener-operador", message => {
                this.$eventFinal.$emit("recojer-operador",this.operador);
            })

            this.$eventFinal.$on("obtener-tiempo-segundos", message => {
                this.$eventFinal.$emit("recojer-tiempo-segundos",this.timeSeconds);
            })
        }
    }
</script>
