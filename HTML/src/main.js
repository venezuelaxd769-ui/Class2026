import { createApp } from 'vue'
import App from './App.vue'
import router from './router'

// Importar axios
import axios from 'axios'
import VueAxios from 'vue-axios'

//Importar Primer Vue
import PrimeVue from 'primevue/config';
import Aura from '@primeuix/themes/aura';

import Button from 'primevue/button';
import Skeleton from 'primevue/skeleton';

import MenuComponent from './components/MenuComponent.vue'
import BannerComponent from './components/BannerComponent.vue'
import CardComponent from './components/CardComponent.vue'

const app = createApp(App).use(router);
//Uso de axios
app.use(VueAxios, axios);

//Usar Prime-Vue
app.use(PrimeVue, {
    theme: {
        preset: Aura
    },
    license: 'PRIMEUI-LICENSE-KEY'
});

app.component("MenuComponent", MenuComponent);
app.component("BannerComponent", BannerComponent);
app.component("CardComponent", CardComponent);
app.component("ButtonPrime", Button);
app.component("SkeletonPrime", Skeleton);

app.mount('#app');
