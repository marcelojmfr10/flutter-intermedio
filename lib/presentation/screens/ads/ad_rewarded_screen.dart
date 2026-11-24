import 'package:flutter/material.dart';
import 'package:flutter_miscellaneous/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AdRewardedScreen extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final adRewardedAsync = ref.watch(adRewardedProvider);
    final adPoints = ref.watch(adPointsProvider);

    ref.listen(adRewardedProvider, (previous, next) {
      if (!next.hasValue) return;
      if (next.value == null) return;

      next.value!.show(
        onUserEarnedReward: (ad, reward) {
          ref.read(adPointsProvider.notifier).add(10);
        },
      );
    });

    if (adRewardedAsync.isLoading) {
      return Scaffold(body: Center(child: Text('Cargando anuncio')));
    }

    return Scaffold(
      appBar: AppBar(title: Text('Ad Rewarded Screen')),
      body: Center(child: Text('Puntos actuales: $adPoints')),
    );
  }
}
