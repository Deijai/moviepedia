import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviepedia/infrastructure/datasources/isar_datasource.dart';
import 'package:moviepedia/infrastructure/repositories/local_storage_repository_impl.dart';

final localStorageRepositoryProvider = Provider((ref) {
  final datasource = IsarDataSource();
  return LocalStorageRepositoryImpl(localStorageDataSource: datasource);
});
