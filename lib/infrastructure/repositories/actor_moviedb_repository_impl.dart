import 'package:moviepedia/domain/datasources/actors_datasource.dart';
import 'package:moviepedia/domain/entities/actor.dart';
import 'package:moviepedia/domain/repositories/actors_repository.dart';

class ActorMovieDBRepositoryImpl extends ActorsRepository {
  final ActorDataSource dataSource;

  ActorMovieDBRepositoryImpl(this.dataSource);
  @override
  Future<List<Actor>> getActorsMovie(String movieId) {
    return dataSource.getActorsMovie(movieId);
  }
}
