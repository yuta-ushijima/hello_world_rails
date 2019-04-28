import Vue from 'vue/dist/vue.esm.js'
import VueRouter from 'vue-router'
import UsersContainer from '../container/users_container.vue'

Vue.use(VueRouter)

export default new VueRouter({
  mode: 'history',
  routes: [
    { path: '/', component: UsersContainer },
  ],
})
