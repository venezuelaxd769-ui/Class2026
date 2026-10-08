<template>
  <div class="home">
    <MenuComponent></MenuComponent>
    <BannerComponent></BannerComponent>
    <article v-show="loadingMotos == true" class="content-card">
      <SkeletonPrime height="14rem"></SkeletonPrime>
      <SkeletonPrime height="14rem"></SkeletonPrime>
      <SkeletonPrime height="14rem"></SkeletonPrime>
    </article>

    <article v-show="loadingMotos == false" class="content-card">
      <CardComponent v-for="moto in motos" :key="moto.id" :imagen="moto.imagen"
        :nombre="moto.nombre" :parrafo="moto.detalle"></CardComponent>
    </article>

  </div>
</template>

<script>

export default {
  name: 'HomeView',
  data() {
    return {
      motos: [],
      loadingMotos: false,

    }
  },
  components: {

  },
  methods: {
    getAllMotos: async function () {
      this.loadingMotos = true;
      await this.axios
        .get('https://solincosta.com/apiv2.php?action=getallmotos')
        .then(response => {
          this.motos = response.data.respuesta;
          console.log(this.motos);
        })
        .finally(() =>{
          this.loadingMotos = false;
        });
      
    }
  },

  created(){
    this.getAllMotos();
  }
}
</script>

<style>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

.content-card {
  width: 80%;
  height: 350px;
  margin: 1rem auto;
  gap: 2.5rem;
  display: flex;
}
</style>