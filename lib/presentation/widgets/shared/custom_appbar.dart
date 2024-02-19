import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:moviepedia/domain/entities/movie.dart';
import 'package:moviepedia/presentation/delegates/search_movie_delegate.dart';

import '../../providers/providers.dart';

class CustomAppbar extends ConsumerWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;

    return SafeArea(
      bottom: false,
      child: Container(
        color: const Color(0x0fffffff),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                Icon(
                  Icons.movie_outlined,
                  color: colors.primary,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  'VideoPedia',
                  style: titleStyle,
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      final searchMovies = ref.read(searchMoviesProvider);
                      final searchQuery = ref.read(searchQueryProvider);

                      showSearch<Movie?>(
                              query: searchQuery,
                              context: context,
                              delegate: SearchMovieDelegate(
                                  initialMovies: searchMovies,
                                  searchMoviesCallback: ref
                                      .read(searchMoviesProvider.notifier)
                                      .searchMoviesByQuery))
                          .then((movie) => {
                                if (movie != null)
                                  {context.push('/movie/${movie.id}')}
                              });
                    },
                    icon: const Icon(Icons.search)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
