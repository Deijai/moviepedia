import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  // ignore: non_constant_identifier_names
  static String TheMovieDbKey =
      dotenv.env['THE_MOVIEDB_KEY'] ?? 'Não ha chave configurada';
}
