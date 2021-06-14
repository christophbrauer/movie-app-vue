<template>
  <div class="home">
    <h2>Featured Movie</h2>
    <div class="featured-card">
        
        <div class="featured-card-inner">
          <img src="https://m.media-amazon.com/images/M/MV5BNjM0NTc0NzItM2FlYS00YzEwLWE0YmUtNTA2ZWIzODc2OTgxXkEyXkFqcGdeQXVyNTgwNzIyNzg@._V1_SX300.jpg" alt="Poster" class="featured-img">
          <div class="featured-detail">
            <h3>Guardians of the Galaxy Vol. 2</h3>
            <p>The Guardians struggle to keep together as a team while dealing with their personal family issues, notably Star-Lord's encounter with his father the ambitious celestial being Ego.</p>
            <router-link to="/movie/tt3896198">Show more</router-link>
        </div>
        </div>
      
    </div>
    
    <form @submit.prevent="searchMovies()" class="search-box">
      <input type="text" placeholder="Enter Movie or TV Show Name" v-model="search">
      <input type="submit" value="Search">
    </form>
    
    <div class="movies-list">
      <div class="movie" v-for="movie in movies" :key="movie.imdbID">
        <router-link :to="'/movie/' + movie.imdbID" class="movie-link">
          <div class="movie-meta">
            <div class="movie-image">
              <img :src="movie.Poster" alt="Movie Poster">
              <span class="movie-type">{{ movie.Type }}</span>
            </div>
            <div class="movie-detail">
              <div class="movie-title">
                {{ movie.Title }}
              </div>
              <div class="movie-infos">
                <span>{{ movie.Year }}</span>
              </div>
            
            </div>
          </div>
        </router-link>
      </div>
    </div>
  </div>
</template>

<script>
// @ is an alias to /src

import { ref } from "vue";
import env from '@/env.js';

export default {
  
   setup() {
    const search = ref("");
    const movies = ref([]);
    
    const searchMovies = () => {
      if(search.value != "") {
        fetch(`https://www.omdbapi.com/?apikey=${env.apikey}&s=${search.value}`)
        .then(response => response.json())
        .then(data => {
          movies.value = data.Search;
          search.value = "";
          console.log(movies.value);
        })
      }
    }
    
    return {
      search,
      movies,
      searchMovies
    }
  }
}
</script>

<style lang="scss">
  .home {
    max-width: 50vw;
    
    h2 {
      color: #FFDF6C;
      font-size: 1.75rem;
      margin-bottom: 1.25rem;
    }
    
    
    .featured-card {
      position: relative;
      margin-bottom: 1.5rem;
      
      
      &-inner {
        display: flex;
        flex-direction: row;
      }
      
      .featured-img {
        display: block;
        max-width: 100%;
        height: auto !important;
        object-fit: cover;
        position: relative;
        z-index: 0;
      }
      
      .featured-detail {
        background-color: rgba($color: #000000, $alpha: 0.6);
        padding: 1.5rem;
        
        h3 {
          color: #FFF;
          margin-bottom: 1rem;
          font-size: 1.5rem;
        }
        
        p {
          color: #FFF;
          margin-bottom: 1rem;
        }
        
        a {
          color: #FFDF6C;
          text-decoration: underline;
          
          &:hover {
            text-decoration: none;
          }
        }
      }
    }
  }
  
  .search-box {
    display: flex;
    flex-direction: row;
    align-items: center;
    justify-content: center;
    padding: 1rem 0;
    
    input {
      display: block;
      appearance: none;
      border: none;
      outline: none;
      background: none;
      
      &[type="text"] {
        width: 100%;
        background-color: #FFFFFF;
        color: #3F3F3F;
        padding: 1.25rem;
        font-size: 1.25rem;
        border-radius: .75rem;
        display: block;
        margin-right: 1rem;
        
        &:focus {
          box-shadow: 0px 3px 6px rgba(0,0,0,0.2);
        }
      }
      
      &[type="submit"] {
        background-color: #FFDF6C;
        color: #202020;
        padding: 1.25rem;
        font-size: 1.25rem;
        border-radius: .75rem;
        min-width: 10rem;
        display: block;
        cursor: pointer;
        text-transform: uppercase;
        font-weight: 500;
        transition: 0.3s all ease-in-out;
        
        &:hover {
          background-color: #eebe0f;
        }
      }
    }
  }
  
  .movies-list {
    display: flex;
    flex-wrap: wrap;
    margin: 0 -1rem;
    
    .movie {
      flex: 1 1 33.3333%;
      max-width: 33.3333%;
      padding: 1rem;
      transition: 0.3s all ease-in-out;
      
      &:hover {
        opacity: 0.75;
      }
    }
    
    .movie-meta {
      display: flex;
      flex-direction: column;
      height: 100%;
    }
    
    .movie-image {
      position: relative;
      
      img {
        max-width: 100%;
        height: 450px;
        object-fit: cover;
        display: block;
      }
    }
    
    .movie-type {
      position: absolute;
      left: 0;
      bottom: 60px;
      background-color: #FFDF6C;
      color: #3F3F3F;
      padding: 0.5rem 1rem;
      font-weight: 600;
      text-transform: capitalize;
    }
    
    .movie-detail {
      background-color: rgba($color: #000000, $alpha: 0.6);
      color: #ffffff;
      padding: 0.375rem;
      height: 100%;
    }
  }
</style>