import Vue from 'vue/dist/vue.esm'
import Router from './router/router'

document.addEventListener('turbolinks:load', () => {
  new Vue({
    el: '#app',
      router: Router,
  })
})
