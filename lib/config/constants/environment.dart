// ignore_for_file: non_constant_identifier_names

import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String TheMovieDbKey =
      dotenv.env['THE_MOVIEDB_KEY'] ?? 'Não ha chave configurada';
  static String UrlBase = dotenv.env['URL_BASE'] ?? 'Não ha url configurada';
}
