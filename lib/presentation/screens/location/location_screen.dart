import 'package:flutter/material.dart';
import 'package:flutter_miscellaneous/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LocationScreen extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final userLocationAsync = ref.watch(userLocationProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Ubicación')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Ubicación actual'),
            userLocationAsync.when(
              data: (data) => Text('$data'),
              error: (error, stackTrace) => Text('$error'),
              loading: () => CircularProgressIndicator(),
            ),
            SizedBox(height: 30),
            Text('Seguimiento de Ubicación'),
          ],
        ),
      ),
    );
  }
}
