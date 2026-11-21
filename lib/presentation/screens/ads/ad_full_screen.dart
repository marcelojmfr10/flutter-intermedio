import 'package:flutter/material.dart';

class AdFullScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ad Full Screen')),
      body: Center(child: Text('Ya puedes regresar o ver esta pantalla')),
    );
  }
}
