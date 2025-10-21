import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'Layout',
      component: () => import('.//views/Layout.vue'),
      children: [
        { path: '/', name: 'home', component: () => import('.//views/Homeview/index.vue') },
      ],
    },
  ],
})

export default router
