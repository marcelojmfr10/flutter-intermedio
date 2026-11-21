import 'package:flutter/material.dart';

class AdRewardedScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ad Rewarded Screen')),
      body: Center(child: Text('Puntos actuales:')),
    );
  }
}
