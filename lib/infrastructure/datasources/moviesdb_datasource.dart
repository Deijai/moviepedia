import 'package:dio/dio.dart';
import 'package:moviepedia/config/constants/environment.dart';
import 'package:moviepedia/domain/datasources/movies_datasource.dart';
import 'package:moviepedia/domain/entities/movie.dart';
import 'package:moviepedia/infrastructure/mappers/movie_mapper.dart';
import 'package:moviepedia/infrastructure/models/moviedb/movie_details_moviedb.dart';
import 'package:moviepedia/infrastructure/models/moviedb/moviedb_response.dart';

class MoviesDBDataSource extends MoviesDataSource {
  final dio = Dio(BaseOptions(baseUrl: Environment.UrlBase, queryParameters: {
    'api_key': Environment.TheMovieDbKey,
    'language': 'en-US'
  }));

  List<Movie> _jsonToMovies(Map<String, dynamic> json) {
    final movieDBResponse = MovieDbResponse.fromJson(json);

    final List<Movie> movies = movieDBResponse.results
        .where((moviedb) => moviedb.posterPath != 'no-poster')
        .map((moviedb) => MovieMapper.movieDBToEntity(moviedb))
        .toList();

    return movies;
  }

  Movie _toJsonMovie(Map<String, dynamic> json) {
    final movieDetails = MovieDetailsDbResponse.fromJson(json);
    final movie = MovieMapper.movieDetailDBToEntity(movieDetails);
    return movie;
  }

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final Response<dynamic> response =
        await dio.get('/movie/now_playing', queryParameters: {'page': page});
    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    final Response<dynamic> response =
        await dio.get('/movie/popular', queryParameters: {'page': page});
    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getUpComing({int page = 1}) async {
    final Response<dynamic> response =
        await dio.get('/movie/upcoming', queryParameters: {'page': page});
    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
    final Response<dynamic> response =
        await dio.get('/movie/top_rated', queryParameters: {'page': page});
    return _jsonToMovies(response.data);
  }

  @override
  Future<Movie> getMovieById(String id) async {
    final Response<dynamic> response = await dio.get('/movie/$id');
    if (response.statusCode != 200) {
      return throw Exception('Movie with id: $id not found.');
    }

    return _toJsonMovie(response.data);
  }

  @override
  Future<List<Movie>> searchMovies(String query) async {
    if (query.isEmpty) return [];
    final Response<dynamic> response =
        await dio.get('/search/movie', queryParameters: {'query': query});
    return _jsonToMovies(response.data);
  }
}
