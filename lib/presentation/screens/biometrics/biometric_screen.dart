import 'package:flutter/material.dart';
import 'package:flutter_miscellaneous/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BiometricScreen extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final canCheckBiometrics = ref.watch(canCheckBiometricsProvider);
    final localAuthState = ref.watch(localAuthProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Biometric Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                ref
                    .read(localAuthProvider.notifier)
                    .authenticateUser(biometricOnly: true);
              },
              child: Text('Autenticar'),
            ),
            canCheckBiometrics.when(
              data: (canCheck) => Text('Puede revisar biométricos: $canCheck'),
              error: (error, stackTrace) => Text('Error: $error'),
              loading: () => CircularProgressIndicator(),
            ),

            SizedBox(height: 40),
            Text('Estado del biométrico', style: TextStyle(fontSize: 30)),
            Text('Estado $localAuthState', style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
