import 'package:flutter/material.dart';
import 'package:flutter_miscellaneous/config/config.dart';
import 'package:flutter_miscellaneous/domain/domain.dart';
import 'package:flutter_miscellaneous/presentation/providers/pokemons/pokemon_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PokemonScreen extends ConsumerWidget {
  final String pokemonId;
  const new({super.key, required this.pokemonId});

  @override
  Widget build(BuildContext context, ref) {
    final pokemonAsync = ref.watch(pokemonProvider(pokemonId));

    return pokemonAsync.when(
      data: (data) => _PokemonView(pokemon: data),
      error: (error, stackTrace) => _ErrorWidget(message: error.toString()),
      loading: () => _LoadingWidget(),
    );
  }
}

class _PokemonView extends StatelessWidget {
  final Pokemon pokemon;
  const new({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name),
        actions: [
          IconButton(
            icon: Icon(Icons.share_outlined),
            onPressed: () {
              // link = DeepLink
              SharePlugin.shareLink(pokemon.spriteFront, 'Mira este pokémon');
            },
          ),
        ],
      ),
      body: Center(
        child: Image.network(
          pokemon.spriteFront,
          fit: BoxFit.contain,
          width: 150,
          height: 150,
        ),
      ),
    );
  }
}

class _ErrorWidget extends StatelessWidget {
  final String message;
  const new({required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(message)));
  }
}

class _LoadingWidget extends StatelessWidget {
  const new();

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }
}
