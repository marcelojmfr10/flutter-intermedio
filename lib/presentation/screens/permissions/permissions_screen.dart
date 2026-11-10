import 'package:flutter/material.dart';

class PermissionsScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Permisos')),
      body: _PermissionsView(),
    );
  }
}

class _PermissionsView extends StatelessWidget {
  const new();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CheckboxListTile(
          title: Text('Cámara'),
          subtitle: Text('Estado actual'),
          value: true,
          onChanged: (value) {},
        ),
      ],
    );
  }
}
