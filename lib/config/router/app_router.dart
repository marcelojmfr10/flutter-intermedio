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
    GoRoute(
      path: '/pokemons',
      builder: (context, state) => PokemonsScreen(),
      routes: [
        GoRoute(
          path: ':id',
          builder: (context, state) {
            final id = state.pathParameters['id'] ?? '1';
            return PokemonScreen(pokemonId: id);
          },
        ),
      ],
    ),
    // GoRoute(
    //   path: '/pokemon/:id',
    //   builder: (context, state) => PokemonsScreen(),
    // ),
    GoRoute(
      path: '/biometrics',
      builder: (context, state) => BiometricScreen(),
    ),
    GoRoute(path: '/location', builder: (context, state) => LocationScreen()),
    GoRoute(path: '/maps', builder: (context, state) => MapScreen()),
    GoRoute(
      path: '/controlled-map',
      builder: (context, state) => ControlledMapScreen(),
    ),
    GoRoute(path: '/badge', builder: (context, state) => BadgeScreen()),
    GoRoute(
      path: '/ad-fullscreen',
      builder: (context, state) => AdFullScreen(),
    ),
    GoRoute(
      path: '/ad-rewarded',
      builder: (context, state) => AdRewardedScreen(),
    ),
  ],
);
