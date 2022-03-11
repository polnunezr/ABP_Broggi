<template>
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
</template>

<script>
    export default {
        props: {
            name: {
                type: [String],
                require: true
            },
            id_check: {
                type:[String],
                require: true
            }
        }
    }
</script>
