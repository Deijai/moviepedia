import 'package:dio/dio.dart';
import 'package:moviepedia/config/constants/environment.dart';
import 'package:moviepedia/domain/datasources/movies_datasource.dart';
import 'package:moviepedia/domain/entities/movie.dart';
import 'package:moviepedia/infrastructure/mappers/movie_mapper.dart';
import 'package:moviepedia/infrastructure/models/moviedb/moviedb_response.dart';

class MoviesDBDataSource extends MoviesDataSource {
  final dio = Dio(BaseOptions(baseUrl: Environment.UrlBase, queryParameters: {
    'api_key': Environment.TheMovieDbKey,
    'language': 'en-US'
  }));

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final Response<dynamic> response = await dio.get('/movie/now_playing');
    final movieDBResponse = MovieDbResponse.fromJson(response.data);

    final List<Movie> movies = movieDBResponse.results
        .where((moviedb) => moviedb.posterPath != 'no-poster')
        .map((moviedb) => MovieMapper.movieDBToEntity(moviedb))
        .toList();

    return movies;
  }
}
