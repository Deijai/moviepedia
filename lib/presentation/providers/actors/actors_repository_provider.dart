import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviepedia/infrastructure/datasources/actor_moviedb_datasource.dart';
import 'package:moviepedia/infrastructure/repositories/actor_moviedb_repository_impl.dart';

final actorsRepositoryProvider = Provider((ref) {
  final datasource = ActorMovieDBDataSource();
  return ActorMovieDBRepositoryImpl(datasource);
});
