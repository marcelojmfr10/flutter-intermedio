import 'package:flutter_riverpod/flutter_riverpod.dart';

// final pokemonIdsProvider = Provider<List<int>>((ref) {
//   return List.generate(30, (index) => index + 1);
// });

final pokemonIdsProvider = NotifierProvider<PokemonsNotifier, List<int>>(
  PokemonsNotifier.new,
);

class PokemonsNotifier extends Notifier<List<int>> {
  @override
  List<int> build() => List.generate(30, (index) => index + 1);

  void loadMore(List<int> values) => state = [...state, ...values];
}
