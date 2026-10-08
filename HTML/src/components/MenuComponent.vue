<template>
    <header class="cabecera">
        <div class="container-logo">
            <img class="logo" src="../assets/flag-front.svg" alt="LOGO">
        </div>
        <nav class="menu">
            <li class="item-menu">INICIO</li>
            <li class="item-menu">VENTAS</li>
            <li class="item-menu">REGISTRO</li>
            <li class="item-menu">SUSCRIPCION</li>
        </nav>
    </header>
</template>

<script>
export default {

}
</script>

<style scoped>


.cabecera {
    width: 100%;
    display: flex;
    background-color: #000;
    color: #FFF;
    height: 80px;
    border-bottom: #FFF 1px solid;
}

.container-logo {
    width: 20%;
    display: flex;
    justify-content: center;
    align-items: center;
}

.logo{
    height: 80%;
}

.menu {
    width: 80%;
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 2rem;
}

.item-menu{
    list-style: none;
    background-color: gray;
    color: #000;
    padding: 1rem;
    width: 15%;
    display: flex;
    justify-content: center;
    align-items: center;
}

.item-menu:hover{
    background-color: #FFF;
    cursor: pointer;
    font-weight: 700;
}


</style>