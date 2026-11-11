import 'package:flutter/material.dart';
import 'package:flutter_miscellaneous/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GyroscopeBallScreen extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final gyroscope$ = ref.watch(gyroscopeProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Giróscopio')),
      body: SizedBox.expand(
        child: gyroscope$.when(
          data: (value) => MovingBall(x: value.x, y: value.y),
          error: (error, stackTrace) => Text('$error'),
          loading: () => CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class MovingBall extends StatelessWidget {
  final double x;
  final double y;

  const new({super.key, required this.x, required this.y});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double screenWidth = size.width;
    double screenHeight = size.height;

    double currentYPosition = (y * 150);
    double currentXPosition = (x * 150);

    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedPositioned(
          left: (currentYPosition - 25) + (screenWidth / 2),
          top: (currentXPosition - 25) + (screenHeight / 2),
          curve: Curves.easeInOut,
          duration: Duration(milliseconds: 1000),
          child: Ball(),
        ),
        Text('''
        X:$x,
        Y:$y
      ''', style: TextStyle(fontSize: 30)),
      ],
    );
  }
}

class Ball extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }
}
