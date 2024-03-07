import { createApp } from 'vue'
import App from './App.vue'
import './index.css'
import router from './router' // 引入路由配置
import store from './store'

const app = createApp(App)

// 创建路由实例
app.use(router).use(store).mount('#app')