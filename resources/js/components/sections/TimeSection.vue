<template>
    <div class="col col-3 colTimeExit">
        <div class="row">
            <div class="col col-4">
                <button type="button" class="button">Sortir</button>
            </div>
            <div class="col-6 colSection colTime">

                <data-time titleData="Data" data="08/03/2022" first></data-time>

                <data-time titleData="Hora" data="16:28"></data-time>

                <data-time titleData="Temps" :data="time"></data-time>

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

                    },1000)
                }
            })
        }
    }
</script>
