<template>

    <div id="backdropRelation">
        <div id="relationModal">
            <div id="closeModal"
                class="d-flex align-items-center justify-content-center"
                v-on:click="clickCloseModal">
                <i class="fa fa-times fa-lg"></i>
            </div>
            <div id="divTableExpedient">
                <table class="table table-hover">
                    <thead>
                        <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Data Creació</th>
                        <th scope="col">Data última Modificació</th>
                        <th scope="col">Estats expedients</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="expedient in expedients" :key="expedient.id">
                            <th scope="row">{{expedient.id}}</th>
                            <td>{{expedient.data_creacio}}</td>
                            <td>{{expedient.data_ultima_modificacio}}</td>
                            <td>{{expedient.estat_expedient.estat}}</td>
                            <td><button :id="expedient.id"
                            type="button" class="button buttonNormal"
                            @click="btnRelacionarClick(expedient.id)"
                            ref="btns">Relacionar</button></td>
                        </tr>
                    </tbody>
                </table>
            </div>

        </div>
    </div>

</template>

<script>
    export default {
        props: {
            expedients: {
                type:[Array],
                require: true
            }
        },
        data() {
            return {
                idClick: null
            }
        },
        methods: {
            clickCloseModal() {
                this.$eventRelation.$emit("send-id-button",this.idClick);
                this.$eventRelation.$emit("close-modal","closeModal");
            },
            btnRelacionarClick(idButton) {
                let buttons = this.$refs.btns
                if(this.idClick != null) {
                    if(this.idClick != idButton) {
                        for(let i = 0; i < buttons.length; i++) {
                            if(parseInt(buttons[i].id) == this.idClick) {
                                buttons[i].className = "button buttonNormal"
                                buttons[i].innerHTML = "Relacionar"
                            }
                        }
                        for(let i = 0; i < buttons.length; i++) {
                            if(parseInt(buttons[i].id) == idButton) {
                                buttons[i].className = "button buttonClick"
                                buttons[i].innerHTML = "Relacionat"
                                this.idClick = idButton

                            }
                        }
                    }
                    else {
                        for(let i = 0; i < buttons.length; i++) {
                            if(parseInt(buttons[i].id) == this.idClick) {
                                buttons[i].className = "button buttonNormal"
                                buttons[i].innerHTML = "Relacionar"
                                this.idClick = null
                            }
                        }
                    }


                }
                else {
                    for(let i = 0; i < buttons.length; i++) {
                        if(parseInt(buttons[i].id) == idButton) {
                            buttons[i].className = "button buttonClick"
                            buttons[i].innerHTML = "Relacionat"
                            this.idClick = idButton

                        }
                    }
                }


            }
        }

    }
</script>
