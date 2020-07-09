import Vue from 'vue'
import App from './App.vue'

Vue.config.productionTip = false

Vue.prototype.$c = (variable, fallback) => {
  if (process.env.NODE_ENV === "development") {
    return fallback;
  }

  if (window._env_ && window._env_[variable]) {
    return window._env_[variable];
  }

  return fallback;
};

new Vue({
  render: h => h(App),
}).$mount('#app')
