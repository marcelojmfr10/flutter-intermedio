import 'package:flutter/material.dart';
import 'package:flutter_miscellaneous/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccelerometerScreen extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final accelerometerGravity$ = ref.watch(accelerometerGravityProvider);
    final accelerometerUser$ = ref.watch(accelerometerUserProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Acelerómetro')),
      body: Center(
        child: accelerometerUser$.when(
          data: (value) =>
              Text(value.toString(), style: TextStyle(fontSize: 30)),
          error: (error, stackTrace) => Text('$error'),
          loading: () => CircularProgressIndicator(),
        ),
      ),
    );
  }
}
