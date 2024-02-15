import 'package:moviepedia/domain/entities/actor.dart';
import 'package:moviepedia/infrastructure/models/moviedb/credits_response.dart';

class ActorMapper {
  static Actor castDBToEntity(Cast castResponse) => Actor(
      id: castResponse.id,
      name: castResponse.name,
      profilePath: castResponse.profilePath != null
          ? 'https://image.tmdb.org/t/p/w500/${castResponse.profilePath}'
          : 'https://ih1.redbubble.net/image.1893341687.8294/fposter,small,wall_texture,product,500x500.jpg',
      character: castResponse.character);
}
