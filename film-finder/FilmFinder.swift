//
//  FilmFinder.swift
//  film-finder
//
//  Created by Cameron Small on 4/7/24.
//

import Foundation

struct Movies: Codable {
    let items: [MovieInfo]
}

struct MovieInfo: Codable {
    let id: String
}

class FilmFinder {
    let tmdbBaseUrl = "https://api.themoviedb.org/3"
    var tmdbKey = ""
    
    init() {
        
        if let value = ProcessInfo.processInfo.environment["TMDB_KEY"] {
            tmdbKey = value
        } else {
            print("TMDB_KEY environment variable not set.")
        }
    }
    
    func getGenres() async {
        let genreRequestEndpoint = "/genre/movie/list"
        let requestParams = "?api_key=\(self.tmdbKey)"
        let urlToFetch = URL(string: tmdbBaseUrl + genreRequestEndpoint + requestParams)
        
        var request = URLRequest(url: urlToFetch!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
          print(String(data: data, encoding: .utf8)!)
        }

        task.resume()

//        let wrapper = try JSONDecoder().decode(Wrapper.self, from: data)
//        return wrapper.items[0]
    }
    
    func getMovies() async {
        let selectedGenre = "" //getSelectedGenre();
        let requestParams = "?api_key=\(self.tmdbKey)&with_genres=\(selectedGenre)"
        let discoverMovieEndpoint = "/discover/movie"
        let urlToFetch = URL(string: tmdbBaseUrl + discoverMovieEndpoint + requestParams)
        
        var request = URLRequest(url: urlToFetch!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
          print(String(data: data, encoding: .utf8)!)
        }

        task.resume()
    }
    
    func getMovieInfo(movie: MovieInfo) async {
        let movieId = movie.id;
        let movieEndpoint = "/movie/\(movieId)"
        let requestParams = "?api_key=\(tmdbKey)"
        let urlToFetch = URL(string: tmdbBaseUrl + movieEndpoint + requestParams)
        
        var request = URLRequest(url: urlToFetch!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
          print(String(data: data, encoding: .utf8)!)
        }

        task.resume()
    }
    
    /// Gets a list of movies and ultimately displays the info of a random movie from the list
    func showRandomMovie() async {
//        const movieInfo = document.getElementById('movieInfo');
//        if (movieInfo.childNodes.length > 0) {
//            clearCurrentMovie();
//        };
//        const movies = await getMovies();
//        const randomMovie = getRandomMovie(movies);
//        const info = await getMovieInfo(randomMovie);
//        displayMovie(info);
    }
}

//const tmdbKey = ''; - switch to use an environment variable
//const tmdbBaseUrl = 'https://api.themoviedb.org/3';
//const playBtn = document.getElementById('playBtn');
//
//const getGenres = async () => {
//  const genreRequestEndpoint = '/genre/movie/list';
//  const requestParams = `?api_key=${tmdbKey}`;
//  const urlToFetch = tmdbBaseUrl + genreRequestEndpoint + requestParams;
//  try {
//    const response = await fetch(urlToFetch, {cache: 'no-cache'});
//    if (response.ok) {
//      const jsonResponse = await response.json();
//      const genres = jsonResponse.genres;
//      return genres;
//    }
//  }
//  catch (errors) {
//    console.log(errors);
//  }
//};
//
//const getMovies = async () => {
//  const selectedGenre = getSelectedGenre();
//  const requestParams = `?api_key=${tmdbKey}&with_genres=${selectedGenre}`;
//  const discoverMovieEndpoint = '/discover/movie';
//  const urlToFetch = `${tmdbBaseUrl}${discoverMovieEndpoint}${requestParams}`;
//  try {
//    const response = await fetch(urlToFetch, {cache: 'no-cache'});
//    if (response.ok) {
//      const jsonResponse = await response.json();
//      const movies = jsonResponse.results;
//      return movies;
//    }
//  }
//  catch (errors) {
//    console.log(errors);
//  }
//};
//
//const getMovieInfo = async (movie) => {
//  const movieId = movie.id;
//  const movieEndpoint = `/movie/${movieId}`;
//  const requestParams = `?api_key=${tmdbKey}`;
//  const urlToFetch = `${tmdbBaseUrl}${movieEndpoint}${requestParams}`;
//  try {
//    const response = await fetch(urlToFetch, {cache: 'no-cache'});
//    if (response.ok) {
//      const movieInfo = await response.json();
//      return movieInfo;
//    }
//  }
//  catch (errors) {
//    console.log(errors);
//  }
//};
//
//// Gets a list of movies and ultimately displays the info of a random movie from the list
//const showRandomMovie = async () => {
//  const movieInfo = document.getElementById('movieInfo');
//  if (movieInfo.childNodes.length > 0) {
//    clearCurrentMovie();
//  };
//  const movies = await getMovies();
//  const randomMovie = getRandomMovie(movies);
//  const info = await getMovieInfo(randomMovie);
//  displayMovie(info);
//};
//
//getGenres().then(populateGenreDropdown);
//playBtn.onclick = showRandomMovie;
