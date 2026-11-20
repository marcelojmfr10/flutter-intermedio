import 'package:local_auth/local_auth.dart';

class LocalAuthPlugin {
  static final LocalAuthentication auth = LocalAuthentication();

  static availableBiometrics() async {
    final List<BiometricType> availableBiometrics = await auth
        .getAvailableBiometrics();

    if (availableBiometrics.isNotEmpty) {
      // Some biometrics are enrolled.
    }

    if (availableBiometrics.contains(BiometricType.strong) ||
        availableBiometrics.contains(BiometricType.face)) {
      // Specific types of biometrics are available.
      // Use checks like this with caution!
    }
  }

  static Future<bool> canCheckBiometrics() async {
    return await auth.canCheckBiometrics;
  }

  static Future<(bool, String)> authenticate({
    bool biometricOnly = false,
  }) async {
    try {
      final bool didAuthenticate = await auth.authenticate(
        localizedReason: 'Por favor autenticate para continuar',
        biometricOnly: biometricOnly,
      );

      return (
        didAuthenticate,
        didAuthenticate ? 'Hecho' : 'Cancelado por el usuario',
      );
    } on LocalAuthException catch (e) {
      print('$e');

      if (e.code == LocalAuthExceptionCode.noBiometricHardware) {
        return (false, 'No hay biométricos');
      } else if (e.code == LocalAuthExceptionCode.temporaryLockout ||
          e.code == LocalAuthExceptionCode.biometricLockout) {
        return (false, 'Muchos intentos fallidos');
      } else if (e.code == LocalAuthExceptionCode.noCredentialsSet) {
        return (false, 'No hay un pin configurado');
      }

      return (false, e.toString());
    }
  }
}
