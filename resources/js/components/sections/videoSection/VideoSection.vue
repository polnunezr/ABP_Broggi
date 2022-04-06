<template>
    <div class="row d-flex">
        <div class="col col-11 colCard colVideo d-flex justify-content-center align-items-center">
            <div id="containerVideo">
                <backdrop-video></backdrop-video>
                <backdrop-refresh></backdrop-refresh>
                <video @timeupdate="timeUpdateVideo" ref="videoo" id="video" width="1066.2" height="600" controls>
                    <source id="sourceVideo" :src="getSrc" type="video/mp4">
                </video>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        data() {
            return {
                src: this.$videoURL,
                timeVideo: this.$v1,
                currentTime: 0,
                tipoVideo: "1"
            }
        },
        computed: {
            getSrc() {
                return this.src + this.timeVideo;
            }
        },
        methods: {
            timeUpdateVideo() {
                switch(this.tipoVideo) {
                    case "1":
                        this.show(this.$v1,false,this.tipoVideo)
                        break;
                    case "10":
                        this.show(this.$v10,true,this.tipoVideo)
                        break;
                    case "11":
                        this.show(this.$v11,false,this.tipoVideo)
                        break;
                    case "111":
                        this.show(this.$v111,true,this.tipoVideo)
                        break;
                    case "110":
                        this.show(this.$v110,false,this.tipoVideo)
                        break;
                    case "1101":
                        this.show(this.$v1101,true,this.tipoVideo)
                        break;
                    case "1100":
                        this.show(this.$v1100,false,this.tipoVideo)
                        break;
                    case "11001":
                        this.show(this.$v11001,false,this.tipoVideo)
                        break;
                    case "11000":
                        this.show(this.$v11000,false,this.tipoVideo)
                        break;
                    case "110010":
                        this.show(this.$v110010,true,this.tipoVideo)
                        break;
                    case "110011":
                        this.show(this.$v110011,false,this.tipoVideo)
                        break;
                    case "1100110":
                        this.show(this.$v1100110,true,this.tipoVideo)
                        break;
                    case "1100111":
                        this.show(this.$v1100111,true,this.tipoVideo)
                        break;

                }

            },
            showBackdrop(tipoVideo) {
                this.$refs.videoo.style.display = "none"
                switch(tipoVideo) {
                    case "1":
                        this.$eventVideo.$emit("change-backdrop-video",this.$qv1)
                        break;
                    case "11":
                        this.$eventVideo.$emit("change-backdrop-video",this.$qv11)
                        break;
                    case "110":
                        this.$eventVideo.$emit("change-backdrop-video",this.$qv110)
                        break;
                    case "1100":
                        this.$eventVideo.$emit("change-backdrop-video",this.$qv1100)
                        break;
                    case "11000":
                        this.$eventVideo.$emit("change-backdrop-video",this.$qv11000)
                        break;
                    case "11001":
                        this.$eventVideo.$emit("change-backdrop-video",this.$qv11001)
                        break;
                    case "110011":
                        this.$eventVideo.$emit("change-backdrop-video",this.$qv110011)
                        break;
                }

            },
            showBackdropRefresh() {
                this.$refs.videoo.style.display = "none"
                this.$eventVideo.$emit("change-backdrop-refresh","true")
            },
            refresh() {
                this.$refs.videoo.style.display = "block"
                this.$refs.videoo.load()
                this.$refs.videoo.play()
            },
            show(vString,finish,tipoVideo) {
                let time,tInicial,tFinal
                this.currentTime = this.$refs.videoo.currentTime

                time = vString.split("=")
                time = time[1].split(",")
                tInicial = time[0]
                tFinal = time[1]

                if(this.$refs.videoo.currentTime < tInicial) {
                    this.$refs.videoo.currentTime = tInicial;
                }
                else if(this.$refs.videoo.currentTime > tFinal) {
                    if(finish) {
                        this.showBackdropRefresh()
                    }
                    else {
                        this.showBackdrop(tipoVideo)
                    }

                }
                else if(this.$refs.videoo.onpause == true && this.$refs.videoo.currentTime >= tFinal) {
                    if(finish) {
                        this.showBackdropRefresh()
                    }
                    else {
                        this.showBackdrop(tipoVideo)
                    }
                }
            }
        },
        mounted() {
            this.$eventVideo.$on("new-video", optionVideo => {

                if(optionVideo == this.$yesVideo || optionVideo == this.$noVideo) {

                    switch(this.tipoVideo) {
                        case "1":
                            if(optionVideo == this.$yesVideo) {
                                this.timeVideo = this.$v11
                                this.tipoVideo = "11"
                                this.refresh()
                            }
                            else {
                                this.timeVideo = this.$v10
                                this.tipoVideo = "10"
                                this.refresh()
                            }

                            break;
                        case "11":
                            if(optionVideo == this.$yesVideo) {
                                this.timeVideo = this.$v111
                                this.tipoVideo = "111"
                                this.refresh()
                            }
                            else {
                                this.timeVideo = this.$v110
                                this.tipoVideo = "110"
                                this.refresh()
                            }
                            break;
                        case "110":
                            if(optionVideo == this.$yesVideo) {
                                this.timeVideo = this.$v1101
                                this.tipoVideo = "1101"
                                this.refresh()
                            }
                            else {
                                this.timeVideo = this.$v1100
                                this.tipoVideo = "1100"
                                this.refresh()
                            }
                            break;
                        case "1100":
                            if(optionVideo == this.$yesVideo) {
                                this.timeVideo = this.$v11001
                                this.tipoVideo = "11001"
                                this.refresh()
                            }
                            else {
                                this.timeVideo = this.$v11000
                                this.tipoVideo = "11000"
                                this.refresh()
                            }
                            break;
                        case "11001":
                            if(optionVideo == this.$yesVideo) {
                                this.timeVideo = this.$v110011
                                this.tipoVideo = "110011"
                                this.refresh()
                            }
                            else {
                                this.timeVideo = this.$v110010
                                this.tipoVideo = "110010"
                                this.refresh()
                            }
                            break;
                        case "110011":
                            if(optionVideo == this.$yesVideo) {
                                // debugger;
                                this.timeVideo = this.$v1100111
                                this.tipoVideo = "1100111"
                                this.refresh()
                            }
                            else {
                                // debugger;
                                this.timeVideo = this.$v1100110
                                this.tipoVideo = "1100110"
                                this.refresh()
                            }
                            break;
                        case "11000":
                            if(optionVideo == this.$yesVideo) {
                                this.timeVideo = this.$v1100111
                                this.tipoVideo = "1100111"
                                this.refresh()
                            }
                            else {
                                this.timeVideo = this.$v1100110
                                this.tipoVideo = "1100110"
                                this.refresh()
                            }
                            break;
                    }

                }
                else if(optionVideo == this.$refreshVideo){
                    this.refresh()

                }
                else {
                    this.timeVideo = this.$v1
                    this.tipoVideo = "1"
                    this.refresh()
                }


            })

        }
    }
</script>
