import 'package:flutter/material.dart';
import 'package:flutter_miscellaneous/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

class _PermissionsView extends ConsumerWidget {
  const new();

  @override
  Widget build(BuildContext context, ref) {
    final permissions = ref.watch(permissionsProvider);

    return ListView(
      children: [
        CheckboxListTile(
          title: Text('Cámara'),
          subtitle: Text('${permissions.camera}'),
          value: permissions.cameraGranted,
          onChanged: (value) {
            ref.read(permissionsProvider.notifier).requestCameraAccess();
          },
        ),
        CheckboxListTile(
          title: Text('Galería de fotos'),
          subtitle: Text('${permissions.photoLibrary}'),
          value: permissions.photoLibraryGranted,
          onChanged: (value) {
            ref.read(permissionsProvider.notifier).requestPhotoLibrary();
          },
        ),
        CheckboxListTile(
          title: Text('Localización'),
          subtitle: Text('${permissions.location}'),
          value: permissions.locationGranted,
          onChanged: (value) {
            ref.read(permissionsProvider.notifier).requestLocation();
          },
        ),
        CheckboxListTile(
          title: Text('Sensores'),
          subtitle: Text('${permissions.sensors}'),
          value: permissions.sensorsGranted,
          onChanged: (value) {
            ref.read(permissionsProvider.notifier).requestSensors();
          },
        ),
      ],
    );
  }
}
