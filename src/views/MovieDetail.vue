<template>
  <div class="movie-detail">
    <h2>{{ movie.Title }}</h2>
    <div class="movie-container">
      <div class="movie-poster">
        <img :src="movie.Poster" alt="">
      </div>
      <div class="movie-desc">
        <div class="movie-tags">
          <span class="movie-genre">
            Genre: {{ movie.Genre }}
          </span>
          <span class="movie-year">
            Release Date: {{ movie.Year }}
          </span>
          <span v-if="movie.Type == 'series'">
            {{ movie.totalSeasons }} seasons
          </span>
        </div>
        <div class="movie-plot">
          <p>{{ movie.Plot }}</p>
        </div>
        
      </div>
    </div>
    <div class="movie-backlink">
      <router-link to="/" class="back-link">Back to Search</router-link>
    </div>
  </div>
</template>

<script>
import { ref, onBeforeMount } from 'vue';
import { useRoute } from 'vue-router';
import env from '@/env.js';

export default {
  setup () {
    const movie = ref([]);
    const route = useRoute();
    
    onBeforeMount(() => {
      fetch(`https://www.omdbapi.com/?apikey=${env.apikey}&i=${route.params.id}&plot=full`)
      .then(response => response.json())
      .then(data => {
        movie.value = data;
      })
    })
    
    return {
      movie
    }
  }
}
</script>

<style lang="scss">

  h2 {
    color: #FFDF6C;
    font-size: 1.75rem;
    margin-bottom: 1.25rem;
  }
  
  .movie-poster {
    img {
      display: block;
    }
  }

  .movie-detail {
    max-width: 50vw;
  }
  
  .movie-container {
    display: flex;
  }
  
  .movie-desc {
    padding: 1rem;
    background-color: #3F3F3F;
    color: #ffffff;
  }
  
  .movie-plot {
    margin-bottom: 1rem;
    line-height: 1.4rem;
  }
  
  .movie-tags {
    margin-bottom: 1rem;
    
    span {
      display: inline-flex;
      background-color: #ffffff;
      color: #3F3F3F;
      padding: 0.25rem 0.5rem;
      margin-right: 1rem;
      font-weight: 600;
      border-radius: 8px;
      font-size: 0.875rem;
    }
  }
  
  .movie-backlink {
    display: flex;
    justify-content: center;
    padding: 1rem 0;
    
    a {
      color: #ffffff;
      font-size: 1.25rem;
    }
  }
</style>