import 'package:flutter_miscellaneous/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => HomeScreen()),
    GoRoute(
      path: '/permissions',
      builder: (context, state) => PermissionsScreen(),
    ),
    GoRoute(path: '/gyroscope', builder: (context, state) => GyroscopeScreen()),
    GoRoute(
      path: '/accelerometer',
      builder: (context, state) => AccelerometerScreen(),
    ),
    GoRoute(
      path: '/magnetometer',
      builder: (context, state) => MagnetometerScreen(),
    ),
    GoRoute(
      path: '/gyroscope-ball',
      builder: (context, state) => GyroscopeBallScreen(),
    ),
    GoRoute(path: '/compass', builder: (context, state) => CompassScreen()),
  ],
);
