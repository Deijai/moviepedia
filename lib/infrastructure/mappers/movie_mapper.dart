import 'package:moviepedia/domain/entities/movie.dart';
import 'package:moviepedia/infrastructure/models/moviedb/movie_details_moviedb.dart';
import 'package:moviepedia/infrastructure/models/moviedb/movie_moviedb.dart';

class MovieMapper {
  static Movie movieDBToEntity(MovieMovieDB movieMovieDB) => Movie(
      adult: movieMovieDB.adult,
      backdropPath: (movieMovieDB.backdropPath != '')
          ? 'https://image.tmdb.org/t/p/w500/${movieMovieDB.backdropPath}'
          : 'https://ih1.redbubble.net/image.1893341687.8294/fposter,small,wall_texture,product,500x500.jpg',
      genreIds: movieMovieDB.genreIds.map((e) => e.toString()).toList(),
      id: movieMovieDB.id,
      originalLanguage: movieMovieDB.originalLanguage,
      originalTitle: movieMovieDB.originalTitle,
      overview: movieMovieDB.overview,
      popularity: movieMovieDB.popularity,
      posterPath: (movieMovieDB.posterPath != '')
          ? 'https://image.tmdb.org/t/p/w500/${movieMovieDB.posterPath}'
          : 'https://ih1.redbubble.net/image.1893341687.8294/fposter,small,wall_texture,product,500x500.jpg',
      releaseDate: movieMovieDB.releaseDate != null
          ? movieMovieDB.releaseDate!
          : DateTime.now(),
      title: movieMovieDB.title,
      video: movieMovieDB.video,
      voteAverage: movieMovieDB.voteAverage,
      voteCount: movieMovieDB.voteCount);

  static Movie movieDetailDBToEntity(MovieDetailsDbResponse movieDetailsDbResponse) => Movie(
      adult: movieDetailsDbResponse.adult,
      backdropPath: (movieDetailsDbResponse.backdropPath != '')
          ? 'https://image.tmdb.org/t/p/w500/${movieDetailsDbResponse.backdropPath}'
          : 'https://ih1.redbubble.net/image.1893341687.8294/fposter,small,wall_texture,product,500x500.jpg',
      genreIds: movieDetailsDbResponse.genres.map((e) => e.name).toList(),
      id: movieDetailsDbResponse.id,
      originalLanguage: movieDetailsDbResponse.originalLanguage,
      originalTitle: movieDetailsDbResponse.originalTitle,
      overview: movieDetailsDbResponse.overview,
      popularity: movieDetailsDbResponse.popularity,
      posterPath: (movieDetailsDbResponse.posterPath != '')
          ? 'https://image.tmdb.org/t/p/w500/${movieDetailsDbResponse.posterPath}'
          : 'https://ih1.redbubble.net/image.1893341687.8294/fposter,small,wall_texture,product,500x500.jpg',
      releaseDate: movieDetailsDbResponse.releaseDate,
      title: movieDetailsDbResponse.title,
      video: movieDetailsDbResponse.video,
      voteAverage: movieDetailsDbResponse.voteAverage,
      voteCount: movieDetailsDbResponse.voteCount);
}
