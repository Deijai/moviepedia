import 'package:moviepedia/domain/entities/actor.dart';

abstract class ActorsRepository {
  Future<List<Actor>> getActorsMovie(String movieId);
}
