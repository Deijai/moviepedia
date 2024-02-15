import 'package:moviepedia/domain/entities/actor.dart';

abstract class ActorDataSource {
  Future<List<Actor>> getActorsMovie(String movieId);
}
