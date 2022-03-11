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
