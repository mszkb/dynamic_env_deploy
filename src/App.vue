<template>
  <div id="app">
    <img alt="Vue logo" src="./assets/logo.png">
    {{ string1 }}<br />
    {{ string2 }}<br />
    {{ string3 }}
  </div>
</template>

<script>

export default {
  name: 'App',
  computed: {
    string1 () {
      return this.$c("VUE_APP_EXPOSED_1", "I am the custom fallback");
    },
    string2 () {
      return this.$c("VUE_APP_EXPOSED_2", process.env.VUE_APP_EXPOSED_2);
    },
    string3 () {
      return process.env.VUE_APP_HARD_1
    }
  }
}
</script>
