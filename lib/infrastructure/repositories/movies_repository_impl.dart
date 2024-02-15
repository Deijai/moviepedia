import 'package:moviepedia/domain/datasources/movies_datasource.dart';
import 'package:moviepedia/domain/entities/movie.dart';
import 'package:moviepedia/domain/repositories/movies_repository.dart';

class MoviesRepositoryImpl extends MoviesRepository {
  final MoviesDataSource dataSource;

  MoviesRepositoryImpl(this.dataSource);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return dataSource.getNowPlaying(page: page);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) {
    return dataSource.getPopular(page: page);
  }

  @override
  Future<List<Movie>> getUpComing({int page = 1}) async {
    return dataSource.getUpComing(page: page);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
    return dataSource.getTopRated(page: page);
  }

  @override
  Future<Movie> getMovieById(String id) {
    return dataSource.getMovieById(id);
  }
}
