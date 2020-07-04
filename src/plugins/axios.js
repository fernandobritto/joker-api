import Vue from 'vue'
import axios from 'axios'

axios.defaults.baseURL = '127.0.0.1:8000/api/v1'

Vue.use({
    install(Vue){
        Vue.prototype.$http = axios
    }
})
