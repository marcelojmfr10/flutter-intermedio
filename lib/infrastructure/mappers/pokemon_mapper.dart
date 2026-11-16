import 'package:flutter_miscellaneous/domain/domain.dart';
import 'package:flutter_miscellaneous/infrastructure/infrastructure.dart';

class PokemonMapper {
  static Pokemon pokeApiPokemonToEntity(Map<String, dynamic> json) {
    final pokeApiPokemon = PokemonResponse.fromJson(json);

    return Pokemon(
      id: pokeApiPokemon.id,
      name: pokeApiPokemon.name,
      spriteFront: pokeApiPokemon.sprites.frontDefault ?? '',
    );
  }
}
