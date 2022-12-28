import { createApp } from 'vue'
import App from './Login.vue'
import axios from 'axios'
import VueAxios from 'vue-axios'

createApp(App).use(VueAxios, axios).mount('#app')