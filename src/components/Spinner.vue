<template>
  <div class="spinner">
    <div class="lds-dual-ring"></div>
  </div>
</template>

<script>
export default {

}
</script>

<style lang="scss" scoped>
  .spinner {
    width: 100%;
    height: calc(100vh - 80px);
    display: flex;
    justify-content: center;
    align-items: center;
    position: fixed;
    left: 0;
    right: 0;
    top: 80px;
    background-color: rgba(0,0,0,0.5);
    z-index: 1;
  }
  .lds-dual-ring {
    display: inline-block;
    width: 80px;
    height: 80px;
  }
  .lds-dual-ring:after {
    content: " ";
    display: block;
    width: 64px;
    height: 64px;
    margin: 8px;
    border-radius: 50%;
    border: 6px solid #FFDF6C;
    border-color: #FFDF6C transparent #FFDF6C transparent;
    animation: lds-dual-ring 1.2s linear infinite;
  }
  @keyframes lds-dual-ring {
    0% {
      transform: rotate(0deg);
    }
    100% {
      transform: rotate(360deg);
    }
  }
</style>