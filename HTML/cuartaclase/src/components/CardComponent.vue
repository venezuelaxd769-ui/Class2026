<template>
    <div class="card">
        <img class="card-image" :src="imagen" alt="">
        <div class="card-name">{{ nombre }}</div>
        <div class="card-parragraf"> {{ parrafo }} </div>
    </div>
</template>

<script>
export default {
    props:{
        imagen: String,
        nombre: String,
        parrafo: String
    },

    created() {
        console.log("NOMBRE DE LA IMAGEN " + this.imagen);
    }
}
</script>

<style scoped>

.card{
    width: 100%;
    display: flex;
    flex-direction: column;
    box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
    border-radius: 1rem 1rem 1rem 1rem;
}
.card-image{
    width: 100%;
    height: 65%;
    border-radius: 1rem 1rem 0 0;
}
.card-name{
    height: 15%;
    background-color: #000;
    color: #FFF;
    display: flex;
    justify-content: center;
    align-items: center;
}
.card-parragraf{
    height: 20%;
    padding: 10px;
}

</style>