import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviepedia/domain/entities/movie.dart';
import 'package:moviepedia/presentation/providers/movies/movies_providers.dart';

final moviesSlideshowProvider = Provider<List<Movie>>((ref) {
  final nowPlayingmovies = ref.watch(nowPlayingMoviesProvider);

  if (nowPlayingmovies.isEmpty) return [];

  return nowPlayingmovies.sublist(0, 6);
});
