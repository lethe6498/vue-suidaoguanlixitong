import './assets/main.css'

import { createApp } from 'vue'
import { createPinia } from 'pinia'
import App from './App.vue'
import router from './router'
import piniaPersist from 'pinia-plugin-persist'
import elementIcon from './plugins/icons'

// 引入 Element Plus
import ElementPlus from 'element-plus'
import 'element-plus/dist/index.css'

const app = createApp(App)
const pinia = createPinia()

pinia.use(piniaPersist)
app.use(pinia)
app.use(router)
app.use(ElementPlus)
app.use(elementIcon)

app.mount('#app')
