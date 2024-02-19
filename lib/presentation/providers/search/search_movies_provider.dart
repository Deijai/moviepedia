import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviepedia/domain/entities/movie.dart';
import 'package:moviepedia/presentation/providers/movies/repositories/movies_repository_provider.dart';

final searchQueryProvider = StateProvider<String>((ref) => '');

final searchMoviesProvider =
    StateNotifierProvider<SearchMoviesNotifier, List<Movie>>((ref) {
  final searchMovieCallback = ref.read(movieRepositoryProvider).searchMovies;
  return SearchMoviesNotifier(
      searchMovieCallback: searchMovieCallback, ref: ref);
});

typedef SearchMovieCallback = Future<List<Movie>> Function(String query);

class SearchMoviesNotifier extends StateNotifier<List<Movie>> {
  SearchMovieCallback searchMovieCallback;
  final Ref ref;
  SearchMoviesNotifier({required this.searchMovieCallback, required this.ref})
      : super([]);

  Future<List<Movie>> searchMoviesByQuery(String query) async {
    final List<Movie> movies = await searchMovieCallback(query);
    ref.read(searchQueryProvider.notifier).update((state) => query);
    state = movies;
    return movies;
  }
}
