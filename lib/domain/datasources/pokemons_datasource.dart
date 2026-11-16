import 'package:flutter_miscellaneous/domain/domain.dart';

abstract class PokemonDatasource {
  Future<(Pokemon?, String)> getPokemon(String id);
}
