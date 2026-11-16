import 'package:flutter/material.dart';
import 'package:flutter_miscellaneous/presentation/providers/permissions/permissions_provider.dart';
import 'package:flutter_miscellaneous/presentation/screens/screens.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CompassScreen extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final locationGranted = ref.watch(permissionsProvider).locationGranted;

    if (!locationGranted) {
      return AskLocationScreen();
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Brújula', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Center(child: Compass()),
    );
  }
}

class Compass extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('155', style: TextStyle(color: Colors.white, fontSize: 30)),
        SizedBox(height: 20),
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset('assets/images/compass/quadrant-1.png'),
            Image.asset('assets/images/compass/needle-1.png'),
          ],
        ),
      ],
    );
  }
}
