<template>
    <main>
        <ButtonPrime severity="danger" variant="outlined" @click="open = true">Nuevo destino</ButtonPrime>

        <DialogPrime v-model:visible="open" modal header="Edit Profile" :style="{ width: '24rem' }">
            <div class="flex flex-col gap-4">
                <div class="flex flex-col gap-1.5">
                    <LabelPrime for="name">Nombre</LabelPrime>
                    <InputText id="name" v-model="nuevoDestino.nombre" autoFocus />
                </div>
                <div class="flex flex-col gap-1.5">
                    <LabelPrime for="email">Precio</LabelPrime>
                    <InputText id="email" v-model="nuevoDestino.precio" />
                </div>
                <div class="flex flex-col gap-1.5">
                    <LabelPrime for="email">Imagen</LabelPrime>
                    <InputText id="email" v-model="nuevoDestino.imagen" />
                </div>
            </div>
            <template #footer>
                <ButtonPrime severity="secondary" variant="outlined" @click="visible = false">Cancel</ButtonPrime>
                <ButtonPrime @click="guardarDestino">Guardar</ButtonPrime>
            </template>
        </DialogPrime>

        <section class="contenedor">
            <DestinoComponent v-for="destino in destinos" :key="destino.id" :imagen="destino.imagen"
                :nombre="destino.nombre" :precio="destino.precio">
            </DestinoComponent>
        </section>
    </main>

</template>

<script>
import DestinoComponent from '@/components/DestinoComponent.vue';

export default {
    data() {
        return {
            destinos: [],
            open: false,
            nuevoDestino: {
                nombre: "",
                imagen: "",
                precio: ""
            }
        };
    },

    components: {
        DestinoComponent
    },
    methods: {
        getAllDestinos: function () {
            this.axios
                .get('https://solincosta.com/apiv2.php?action=getalldestinos')
                .then(response => {
                    this.destinos = response.data.respuesta;
                    console.log(this.destinos);
                    console.log(response.data);
                    
                })
        },

        guardarDestino: async function () {
           await this.axios
                .post('https://solincosta.com/apiv2.php?action=savedestino',
                    {
                        nombre: this.nuevoDestino.nombre,
                        imagen: this.nuevoDestino.imagen,
                        precio: this.nuevoDestino.precio,
                    }
                )
                .then(response => {
                    if(response.data.status){
                        alert("Destino guardado exitosamente");
                    }else{
                        alert("ERROR");
                        console.log(response.data);
                    }
                })
        }
    },
    created() {
        this.getAllDestinos();
    }
}
</script>

<style>
.contenedor {
    display: grid;
    grid-template-columns: 1fr 1fr 1fr;
    gap: 1rem;
    width: 95%;
    margin: 1rem auto;
}
</style>