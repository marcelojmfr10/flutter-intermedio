import 'package:flutter/material.dart';

class PokemonScreen extends StatelessWidget {
  final String pokemonId;
  const new({super.key, required this.pokemonId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pokemon')),
      body: Center(child: Text('Pokemon: $pokemonId')),
    );
  }
}
