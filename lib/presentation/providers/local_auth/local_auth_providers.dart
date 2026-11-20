import 'package:flutter_miscellaneous/config/config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final canCheckBiometricsProvider = FutureProvider<bool>((ref) async {
  return await LocalAuthPlugin.canCheckBiometrics();
});

enum LocalAuthStatus { authenticated, notAuthenticated, authenticating }

class LocalAuthState {
  final bool didAuthenticate;
  final LocalAuthStatus status;
  final String message;

  new({
    this.didAuthenticate = false,
    this.status = LocalAuthStatus.notAuthenticated,
    this.message = '',
  });

  LocalAuthState copyWith({
    bool? didAuthenticate,
    LocalAuthStatus? status,
    String? message,
  }) => LocalAuthState(
    didAuthenticate: didAuthenticate ?? this.didAuthenticate,
    status: status ?? this.status,
    message: message ?? this.message,
  );
}

final localAuthProvider = NotifierProvider<LocalAuthNotifier, LocalAuthState>(
  LocalAuthNotifier.new,
);

class LocalAuthNotifier extends Notifier<LocalAuthState> {
  @override
  LocalAuthState build() {
    return LocalAuthState();
  }

  Future<(bool, String)> authenticateUser() async {
    final (didAuthenticate, message) = await LocalAuthPlugin.authenticate();

    state = state.copyWith(
      didAuthenticate: didAuthenticate,
      message: message,
      status: didAuthenticate
          ? LocalAuthStatus.authenticated
          : LocalAuthStatus.notAuthenticated,
    );

    return (didAuthenticate, message);
  }
}
