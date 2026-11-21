import 'package:flutter/material.dart';
import 'package:flutter_miscellaneous/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BadgeScreen extends ConsumerWidget {
  const BadgeScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final badgeCounter = ref.watch(badgeCounterProvider);
    return Scaffold(
      appBar: AppBar(title: Text('App Badge')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Badge(
              alignment: Alignment.lerp(
                Alignment.topRight,
                Alignment.bottomRight,
                0.2,
              ),
              label: Text('$badgeCounter'),
              child: Text('$badgeCounter', style: TextStyle(fontSize: 150)),
            ),
            FilledButton.tonal(
              onPressed: () {
                ref.invalidate(badgeCounterProvider);
              },
              child: Text('Borrar Badge'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(badgeCounterProvider.notifier).add(1);
        },
        child: Icon(Icons.plus_one),
      ),
    );
  }
}
