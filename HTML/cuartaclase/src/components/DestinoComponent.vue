<template>
    <div class="card">
        <img class="card-img" :src="imagen" alt="">
        <span class="flotante-uno red-hat">Acumula millas</span>
        <div class="flotante-dos">
            <h4 class="card-name red-hat">{{ nombre }}</h4>
            <p class="card-detail red-hat">Ida y vuelta desde</p>
            <h4 class="card-price red-hat">COP {{ precio }}</h4>
        </div>
        <div class="flotante-tres">

        </div>
    </div>
</template>

<script>
export default {
    props:{
        imagen: String,
        precio: Number,
        nombre: String
    }
}
</script>

<style scoped>
* {
    padding: 0;
    margin: 0;
    box-sizing: border-box;
}

.card {
    height: 295px;
    width: 400px;
    position: relative;
    display: flex;
    justify-content: center;
}

.card:hover {
    overflow: hidden;

    border-radius: 10px;
}

.card-img {
    height: 100%;
    width: 100%;
    object-fit: cover;
    border-radius: 10px;
}

.card-img:hover {
    cursor: pointer;
    scale: 1.05;
    overflow: hidden;
    transition: 0.4s ease-in-out;
}

.flotante-uno {
    background-color: #C2E9FF;
    border-radius: 1rem;
    padding: 5px 10px;
    font-weight: 700;
    font-size: 13px;
    color: rgb(43, 60, 70);
    position: absolute;
    top: 10px;
    right: 8px;
}

.red-hat {
    font-family: "Red Hat Display", sans-serif;
    font-optical-sizing: auto;
    font-style: normal;
}

.flotante-dos {
    display: grid;
    grid-template-columns: 60% 40%;
    position: absolute;
    bottom: 15px;
    background-color: #FFF;
    border-radius: 1rem;
    width: 90%;
    height: 30%;
    padding: 1rem 1rem 0.5rem;
    color: rgb(27, 27, 27);
    z-index: 100;
}

.flotante-tres {
    position: absolute;
    bottom: 0;
    background-color: rgba(255, 255, 255, 0.7);
    border-radius: 0 0 1rem 1rem;
    width: 100%;
    height: 40%;
    z-index: 10;
}

.card-name {
    grid-column: span 2;
    font-size: 19px;
    font-weight: 700;
}

.card-detail {
    font-size: 12px;
    font-weight: 400;
}

.card-price {
    font-size: 18px;
    font-weight: 700;
}
</style>