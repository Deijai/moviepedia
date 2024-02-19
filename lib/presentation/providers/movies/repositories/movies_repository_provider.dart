import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviepedia/infrastructure/datasources/moviesdb_datasource.dart';
import 'package:moviepedia/infrastructure/repositories/movies_repository_impl.dart';

// Repositorio imutavel, é somente para leitura - Provider
final movieRepositoryProvider = Provider((ref) {
  final datasource = MoviesDBDataSource();
  return MoviesRepositoryImpl(datasource);
});
