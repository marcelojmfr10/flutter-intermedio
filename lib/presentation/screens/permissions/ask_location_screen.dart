import 'package:flutter/material.dart';
import 'package:flutter_miscellaneous/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AskLocationScreen extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(title: Text('Permiso Requerido')),
      body: Center(
        child: FilledButton(
          onPressed: () {
            ref.read(permissionsProvider.notifier).requestLocation();
          },
          child: Text('Localización necesaria'),
        ),
      ),
    );
  }
}
