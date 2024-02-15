import 'package:dio/dio.dart';
import 'package:moviepedia/config/constants/environment.dart';
import 'package:moviepedia/domain/datasources/actors_datasource.dart';
import 'package:moviepedia/domain/entities/actor.dart';
import 'package:moviepedia/infrastructure/mappers/actor_mapper.dart';
import 'package:moviepedia/infrastructure/models/moviedb/credits_response.dart';

class ActorMovieDBDataSource extends ActorDataSource {
  final dio = Dio(BaseOptions(baseUrl: Environment.UrlBase, queryParameters: {
    'api_key': Environment.TheMovieDbKey,
    'language': 'en-US'
  }));

  List<Actor> _jsonToActors(Map<String, dynamic> json) {
    final creditDBResponse = CreditsResponse.fromJson(json);

    final List<Actor> actors = creditDBResponse.cast
        .map((actor) => ActorMapper.castDBToEntity(actor))
        .toList();

    return actors;
  }

  @override
  Future<List<Actor>> getActorsMovie(String movieId) async {
    final Response<dynamic> response = await dio.get('/movie/$movieId/credits');
    return _jsonToActors(response.data);
  }
}
