<template>
  <div>
    <div ref="vantaRef" style="width:100%;height:100vh"></div>
    <a id="header" class="indextitle" href="/">
      题目管理网站
    </a>
    <a class="enter" href="/login">我的</a>
    <footer id="footer" class="foot">
      题目管理网站
      © 2023 华东师范大学 ECNU-SEI
    </footer>
    <router-view v-if="$route.meta.hidden"/>


  </div>
</template>

<script>
import * as THREE from 'three'
import BIRDS from 'vanta/src/vanta.birds'

export default {
  name: 'Layout',
  data() {
    return {
      list: [],
      // commentList: [],
      pageConf: {
        page: 1,
        limit: 8,
        total: 0
      }
    }
  },
  mounted() {
    this.vantaEffect = BIRDS({
      el: this.$refs.vantaRef,
      THREE: THREE
    })
  },
  beforeDestroy() {
    if (this.vantaEffect) {
      this.vantaEffect.destroy()
    }
  },
  methods: {}
}
</script>
<style>
.indextitle {
  z-index: 999;
  position: fixed;
  top: 30%;
  left: 10%;
  color: aquamarine;
  font-size: 70px;
  font-weight: bolder;
}

.enter {
  z-index: 999;
  position: fixed;
  top: 2%;
  left: 92%;
  color: skyblue;
  font-size: 24px;
  font-weight: bolder;
}

.foot {
  z-index: 999;
  position: fixed;
  top: 90%;
  left: 10%;
  color: darkgrey;
  font-size: 10px;
  font-weight: bolder;
}
</style>
