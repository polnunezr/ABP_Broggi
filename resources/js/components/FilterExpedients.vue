<template>
    <div class="container">
        <h3>Filtres</h3>

        <div class="row">
            <div class="col">
                <!-- Name input -->
                <div class="form-outline">
                    <label class="form-label" for="form8Example1"
                        >NºExpedient</label
                    >
                    <input
                        type="number"
                        id="form8Example1"
                        class="form-control"
                        name="expedient"
                        min="001"
                    />
                </div>
            </div>
            <div class="col">
                <!-- Email input -->
                <div class="form-outline">
                    <label class="form-label" for="form8Example2"
                        >Operador/a</label
                    >
                    <input
                        type="text"
                        id="form8Example2"
                        class="form-control"
                        name="operador"
                    />
                </div>
            </div>
        </div>

        <hr />

        <div class="row g-2">
            <div class="col">
                <!-- Name input -->
                <div class="form-outline">
                    <label class="form-label" for="form8Example3"
                        >Data Modificacio</label
                    >
                    <input
                        type="date"
                        id="form8Example3"
                        class="form-control"
                        name="data"
                    />
                </div>
            </div>

            <div class="col">
                <!-- Email input -->
                <div class="form-outline">
                    <label class="form-label" for="form8Example5"
                        >Telefon</label
                    >
                    <input
                        type="number"
                        id="form8Example5"
                        class="form-control"
                        name="telefon"
                        min="000000000"
                    />
                </div>
            </div>
        </div>
        <hr />
        <div class="row g-2">
            <div class="col-md-6">
                <!-- Email input -->
                <div class="form-outline">
                    <label class="form-label" for="form8Example5"
                        >Tipus Emergencia</label
                    >
                    <select
                        class="form-select"
                        aria-label="Default select example"
                        name="emergencia"
                    >
                        <option selected>Open this select menu</option>
                        <option value="1">One</option>
                        <option value="2">Two</option>
                        <option value="3">Three</option>
                    </select>
                </div>
            </div>

            <div class="col-md-6">
                <div class="form-outline">
                    <label class="form-label" for="form8Example5"
                        >Tipus Localització</label
                    >
                    <select
                        class="form-select"
                        aria-label="Default select example"
                        name="localitzacio"
                    >
                        <option selected>Open this select menu</option>
                        <option value="1">One</option>
                        <option value="2">Two</option>
                        <option value="3">Three</option>
                    </select>
                </div>
            </div>
        </div>
        <hr />
        <div class="row">
            <h3>Estat</h3>
            <div class="col">
                <div class="form-check form-check-inline">
                    <input
                        class="form-check-input"
                        type="checkbox"
                        id="inlineCheckbox1"
                        value="actiu"
                    />
                    <label class="form-check-label" for="inlineCheckbox1"
                        >Actiu</label
                    >
                </div>

                <div class="form-check form-check-inline">
                    <input
                        class="form-check-input"
                        type="checkbox"
                        id="inlineCheckbox2"
                        value="noactiu"
                    />
                    <label class="form-check-label" for="inlineCheckbox2"
                        >No Actiu</label
                    >
                </div>

                <div class="form-check form-check-inline">
                    <input
                        class="form-check-input"
                        type="checkbox"
                        id="inlineCheckbox3"
                        value="todos"
                    />
                    <label class="form-check-label" for="inlineCheckbox3"
                        >Todos</label
                    >
                </div>
            </div>
        </div>
        <hr />
        <div>
            <button type="button" class="btn btn-secondary">
                <i class="fa-solid fa-magnifying-glass"></i> Buscar
            </button>
        </div>
        <hr />
    </div>
</template>
<script>
export default {
    mounted() {
        console.log("Component mounted.");
    },
};
</script>
