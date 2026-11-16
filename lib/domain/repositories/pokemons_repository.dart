import 'package:flutter_miscellaneous/domain/domain.dart';

abstract class PokemonsRepository {
  Future<(Pokemon?, String)> getPokemon(String id);
}
