<template>
    <div class="container mt-2">
        <table class="table table-hover" style="background-color: #f2c49b">
            <thead>
                <tr>
                    <th scope="col">NºExpedient</th>
                    <th scope="col">Data Alta</th>
                    <th scope="col">Operador/a</th>
                    <th scope="col">Tipus Emergencia</th>
                    <th scope="col">Telefon</th>
                    <th scope="col">Tipus Localització</th>
                    <th scope="col">Actiu/No actiu</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th scope="row">1</th>
                    <td>Mark</td>
                    <td>Otto</td>
                    <td>@mdo</td>
                    <td>7465783823</td>
                    <td>Municipi</td>
                    <td>Actiu</td>
                    <td>
                        <button type="button" class="btn btn-secondary">
                            <i class="fa-solid fa-eye"></i>
                        </button>
                    </td>
                </tr>
                <tr>
                    <th scope="row">2</th>
                    <td>Jacob</td>
                    <td>Thornton</td>
                    <td>@fat</td>
                    <td>7465783823</td>
                    <td>Municipi</td>
                    <td>Actiu</td>
                    <td>
                        <button type="button" class="btn btn-secondary">
                            <i class="fa-solid fa-eye"></i>
                        </button>
                    </td>
                </tr>
                <tr>
                    <th scope="row">3</th>
                    <td colspan="2">Larry the Bird</td>
                    <td>@twitter</td>
                    <td>7465783823</td>
                    <td>Municipi</td>
                    <td>Actiu</td>
                    <td>
                        <button type="button" class="btn btn-secondary">
                            <i class="fa-solid fa-eye"></i>
                        </button>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</template>
<script>
export default {
    mounted() {
        console.log("Component mounted.");
    },
};
</script>
