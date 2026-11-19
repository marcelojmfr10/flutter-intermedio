import 'package:flutter/material.dart';

class BiometricScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Biometric Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(onPressed: () {}, child: Text('Autenticar')),
            SizedBox(height: 40),
            Text('Estado del biométrico', style: TextStyle(fontSize: 30)),
            Text('Estado ', style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
