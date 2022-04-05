<template>
    <div class="row form-row" style="margin-top: 25px">
        <div class="col col-5 align-items-center">
            <p>{{firstText}}</p>
        </div>
        <div class="col col-7">
             <p>{{secondText}}</p>
        </div>
    </div>
</template>

<script>
    export default {
        props: {
            firstText: {
                type: [String],
                require: true
            },
            secondText: {
                type: [String],
                require: true
            },
        }
    }
</script>
