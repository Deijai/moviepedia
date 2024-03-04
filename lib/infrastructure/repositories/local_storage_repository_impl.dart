import 'package:moviepedia/domain/datasources/local_storage_datasource.dart';
import 'package:moviepedia/domain/entities/movie.dart';
import 'package:moviepedia/domain/repositories/local_storage_repository.dart';

class LocalStorageRepositoryImpl extends LocalStorageRepository {
  final LocalStorageDataSource localStorageDataSource;

  LocalStorageRepositoryImpl({required this.localStorageDataSource});
  @override
  Future<bool> isMoviefavorite(int movieId) {
    return localStorageDataSource.isMoviefavorite(movieId);
  }

  @override
  Future<List<Movie>> loadMovies({int limit = 10, int offset = 0}) {
    return localStorageDataSource.loadMovies(limit: limit, offset: offset);
  }

  @override
  Future<void> toggleFavorite(Movie movie) {
    return localStorageDataSource.toggleFavorite(movie);
  }
}
