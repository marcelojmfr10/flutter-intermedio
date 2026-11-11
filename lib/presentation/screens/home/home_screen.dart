import 'package:flutter/material.dart';
import 'package:flutter_miscellaneous/presentation/widgets/widgets.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text('Misceláneos'),
              actions: [
                IconButton(
                  onPressed: () => context.push('/permissions'),
                  icon: Icon(Icons.settings),
                ),
              ],
            ),
            MainMenu(),
          ],
        ),
      ),
    );
  }
}
