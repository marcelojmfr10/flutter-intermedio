import 'package:flutter_miscellaneous/domain/domain.dart';

abstract class PokemonRepository {
  Future<(Pokemon?, String)> getPokemon(String id);
}
