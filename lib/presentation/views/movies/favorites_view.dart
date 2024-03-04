import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:moviepedia/presentation/providers/providers.dart';
import 'package:moviepedia/presentation/widgets/widgets.dart';

class FavoritesView extends ConsumerStatefulWidget {
  const FavoritesView({super.key});

  @override
  FavoritesViewState createState() => FavoritesViewState();
}

class FavoritesViewState extends ConsumerState<FavoritesView> {
  bool isLatsPage = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    loadNextPage();
  }

  void loadNextPage() async {
    if (isLoading || isLatsPage) return;
    isLoading = true;

    final movies =
        await ref.read(favoritesMoviesProvider.notifier).loadNextPage();
    isLoading = false;

    if (movies.isEmpty) {
      isLatsPage = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final favoritesMovies = ref.watch(favoritesMoviesProvider);
    final colors = Theme.of(context).colorScheme;

    if (favoritesMovies.isEmpty) {
      return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.favorite_outline_sharp,
                size: 60,
                color: colors.primary,
              ),
              Text(
                'Ohhhhh no!!!',
                style: TextStyle(fontSize: 30, color: colors.primary),
              ),
              const Text(
                'Não tem nenhum filme em favoritos',
                style: TextStyle(fontSize: 20, color: Colors.black45),
              ),
              const SizedBox(
                height: 20,
              ),
              FilledButton.tonal(
                onPressed: () => context.go('/home/0'),
                child: const Text('Voltar'),
              )
            ]),
      );
    }

    return Scaffold(
        body: MovieMasonry(
      loadNextPage: loadNextPage,
      movies: favoritesMovies.values.toList(),
    ));
  }
}
