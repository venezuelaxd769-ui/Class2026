import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import InicioView from '../views/InicioView.vue'
import EstudentView from '../views/EstudentView.vue'
import DestinosView from '../views/DestinosView.vue'



const routes = [
  {
    path: '/',
    name: 'home',
    component: HomeView
  },
  {
    path: '/estudiantes',
    name: 'estudiantes',
    component: EstudentView
  },
  {
    path: '/destinos',
    name: 'destinos',
    component: DestinosView
  },
  {
    path: '/inicio',
    name: 'inicio',
    component: InicioView
  },
  {
    path: '/about',
    name: 'about',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/AboutView.vue')
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
