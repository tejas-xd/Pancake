import 'package:dio/dio.dart';
import 'package:pancake/data_handeling/models/models.dart';
import 'package:pancake/data_handeling/models/moviedetail.dart';
import 'package:pancake/data_handeling/models/tvdetail.dart';




class ApiService {
  final Dio _dio = Dio();

  final String baseUrl = 'https://api.themoviedb.org/3';
  final String apiKey = 'api_key=#########################';


  Future<List<Genre>> getGenreList(String mediatype) async {
    try {
      final url = '$baseUrl/genre/$mediatype/list?$apiKey';
      final response = await _dio.get(url);
      var genres = response.data['genres'] as List;
      List<Genre> genreList = genres.map((g) => Genre.fromJson(g)).toList();
      return genreList;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

  Future<List<Mixed>> getTrendingAll() async {
    try {
      final url = '$baseUrl/trending/all/week?$apiKey';
      final response = await _dio.get(url);
      var mixed = response.data['results'] as List;
      List<Mixed> mixedList = mixed.map((m) => Mixed.fromJson(m)).toList();
      return mixedList;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

  Future<List<Movie>> getTrendingMovie() async {
    try {
      final url = '$baseUrl/trending/movie/week?$apiKey';
      final response = await _dio.get(url);
      var movies = response.data['results'] as List;
      List<Movie> movieList = movies.map((m) => Movie.fromJson(m)).toList();
      return movieList;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

  Future<List<TVshow>> getTrendingTVshow() async {
    try {
      final url = '$baseUrl/trending/tv/week?$apiKey';
      final response = await _dio.get(url);
      var tvshow = response.data['results'] as List;
      List<TVshow> tvList = tvshow.map((m) => TVshow.fromJson(m)).toList();
      return tvList;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

  Future<List<Movie>> getPopularMovie() async {
    try {
      final url = '$baseUrl/movie/popular?$apiKey';
      final response = await _dio.get(url);
      var movies = response.data['results'] as List;
      List<Movie> movieList = movies.map((m) => Movie.fromJson(m)).toList();
      return movieList;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

  Future<List<Movie>> getTopRatedMovie() async {
    try {
      final url = '$baseUrl/movie/top_rated?$apiKey';
      final response = await _dio.get(url);
      var movies = response.data['results'] as List;
      List<Movie> movieList = movies.map((m) => Movie.fromJson(m)).toList();
      return movieList;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

  Future<List<Movie>> getUpcomingMovie() async {
    try {
      final url = '$baseUrl/movie/upcoming?$apiKey';
      final response = await _dio.get(url);
      var movies = response.data['results'] as List;
      List<Movie> movieList = movies.map((m) => Movie.fromJson(m)).toList();
      return movieList;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

  Future<List<Movie>> getNowPlayingMovie() async {
    try {
      final url = '$baseUrl/movie/now_playing?$apiKey';
      final response = await _dio.get(url);
      var movies = response.data['results'] as List;
      List<Movie> movieList = movies.map((m) => Movie.fromJson(m)).toList();
      return movieList;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

  Future<List<TVshow>> getPopularTVshow() async {
    try {
      final url = '$baseUrl/tv/popular?$apiKey';
      final response = await _dio.get(url);
      var tvshow = response.data['results'] as List;
      List<TVshow> tvList = tvshow.map((m) => TVshow.fromJson(m)).toList();
      return tvList;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

  Future<List<TVshow>> getTopRatedTVshow() async {
    try {
      final url = '$baseUrl/tv/top_rated?$apiKey';
      final response = await _dio.get(url);
      var tvshow = response.data['results'] as List;
      List<TVshow> tvList = tvshow.map((m) => TVshow.fromJson(m)).toList();
      return tvList;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

  Future<List<TVshow>> getUpcomingTVshow() async {
    try {
      final url = '$baseUrl/tv/airing_today?$apiKey';
      final response = await _dio.get(url);
      var tvshow = response.data['results'] as List;
      List<TVshow> tvList = tvshow.map((m) => TVshow.fromJson(m)).toList();
      return tvList;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

  Future<List<TVshow>> getNowPlayingTVshow() async {
    try {
      final url = '$baseUrl/tv/on_the_air?$apiKey';
      final response = await _dio.get(url);
      var tvshow = response.data['results'] as List;
      List<TVshow> tvList = tvshow.map((m) => TVshow.fromJson(m)).toList();
      return tvList;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

  Future<Moviedetail> getMovieDetail(String id) async {
    try {
      final url = '$baseUrl/movie/$id?$apiKey';
      final response = await _dio.get(url);
      Moviedetail movie = Moviedetail.fromJson(response.data);
      return movie;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

  Future<List<Movie>> getMovieRecommendations(String id) async {
    try {
      final url = '$baseUrl/movie/$id/recommendations?$apiKey';
      final response = await _dio.get(url);
      var movies = response.data['results'] as List;
      List<Movie> movieList = movies.map((m) => Movie.fromJson(m)).toList();
      return movieList;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

  Future<TVdetail> getTVDetail(String id) async {
    try {
      final url = '$baseUrl/tv/$id?$apiKey';
      final response = await _dio.get(url);
      TVdetail tv = TVdetail.fromJson(response.data);
      return tv;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

  Future<List<TVshow>> getTVRecommendations(String id) async {
    try {
      final url = '$baseUrl/tv/$id/recommendations?$apiKey';
      final response = await _dio.get(url);
      var tv = response.data['results'] as List;
      List<TVshow> tvList = tv.map((m) => TVshow.fromJson(m)).toList();
      return tvList;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

  Future<List<Movie>> getMovieByGenre(String movieId) async {
    try {
      final url = '$baseUrl/discover/movie?with_genres=$movieId&$apiKey';
      final response = await _dio.get(url);
      var movies = response.data['results'] as List;
      List<Movie> movieList = movies.map((m) => Movie.fromJson(m)).toList();
      return movieList;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

  Future<List<Movie>> getMovieBySearch(String title, String mediatype) async {
    try {
      final url = '$baseUrl/search/$mediatype?$apiKey&query=$title';
      final response = await _dio.get(url);
      var movies = response.data['results'] as List;
      List<Movie> movieList = movies.map((m) => Movie.fromJson(m)).toList();
      return movieList;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

  Future<List<TVshow>> getTVByGenre(String movieId) async {
    try {
      final url = '$baseUrl/discover/tv?with_genres=$movieId&$apiKey';
      final response = await _dio.get(url);
      var tvshow = response.data['results'] as List;
      List<TVshow> movieList = tvshow.map((m) => TVshow.fromJson(m)).toList();
      return movieList;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

  Future<List<TVshow>> getTVBySearch(String title, String mediatype) async {
    try {
      final url = '$baseUrl/search/$mediatype?$apiKey&query=$title';
      final response = await _dio.get(url);
      var tvshow = response.data['results'] as List;
      List<TVshow> movieList = tvshow.map((m) => TVshow.fromJson(m)).toList();
      return movieList;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

  Future<List<Episodes>> getTVepisodeBySeason(String id, String season) async {
    try {
      final url = '$baseUrl/tv/$id/season/$season?$apiKey';
      final response = await _dio.get(url);
      var tvshow = response.data['episodes'] as List;
      List<Episodes> episodes = tvshow.map((m) => Episodes.fromJson(m)).toList();
      return episodes;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

}