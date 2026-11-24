import 'package:flutter/material.dart';
import 'package:flutter_miscellaneous/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AdFullScreen extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final intersticialAdAsync = ref.watch(adInterstitialProvider);

    ref.listen(adInterstitialProvider, (previous, next) {
      if (!next.hasValue) return;
      if (next.value == null) return;

      next.value!.show();
    });

    if (intersticialAdAsync.isLoading) {
      return Scaffold(body: Center(child: Text('Cargando ad')));
    }

    // if (intersticialAdAsync.hasValue) {
    //   intersticialAdAsync.value!.show();
    // }

    return Scaffold(
      appBar: AppBar(title: Text('Ad Full Screen')),
      body: Center(child: Text('Ya puedes regresar o ver esta pantalla')),
    );
  }
}
