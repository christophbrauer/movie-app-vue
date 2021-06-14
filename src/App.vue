<template>
  <div>
    <Spinner v-if="loading" />
    <header>
      <router-link to="/">
        <h1><span>Vue</span>vie and TV Database</h1>
      </router-link>
    </header>
    <main>
      <router-view/>
    </main>
  </div>
</template>

<script>
import Spinner from '@/components/Spinner';

export default {
  components: {
    Spinner
  },
  data() {
    return {
      loading: true
    }
  },
  mounted () {
    setTimeout(() => {
      this.loading = false; 
    }, 500);
  }
}
</script>

<style lang="scss">
  @import url('https://fonts.googleapis.com/css2?family=Lato:wght@300;400&display=swap');

  * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    
    &::selection {
      background: transparentize($color: #FFDF6C, $amount: 0.5);
    }
  }
  
  html {
    font-size: 18px;
  }
  
  body {
    font-family: "Lato", sans-serif;
    font-size: 1rem;
    background-color: #707070;
  }
  
  a {
    text-decoration: none;
  }
  
  header, main, footer {
    display: flex;
    align-items: center;
    justify-content: center;
  }
  
  header {
    background-color: #3F3F3F;
    padding: 1rem;
    margin-bottom: 2rem;
    
    span {
      color: #FFDF6C;
    }
    
    h1 {
      color: #FFFFFF;
    }
  }
</style>
