import 'package:flutter/material.dart';

class AccelerometerScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Acelerómetro')),
      body: Center(child: Text('Hola')),
    );
  }
}
