import 'package:flutter_miscellaneous/domain/domain.dart';
import 'package:flutter_miscellaneous/infrastructure/infrastructure.dart';

class PokemonsRepositoryImpl implements PokemonsRepository {
  final PokemonsDatasource datasource;

  new(PokemonsDatasource? datasource)
    : datasource = datasource ?? PokemonsDatasourceImpl();

  @override
  Future<(Pokemon?, String)> getPokemon(String id) async {
    return datasource.getPokemon(id);
  }
}
