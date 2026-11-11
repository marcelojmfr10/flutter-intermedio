import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sensors_plus/sensors_plus.dart';

class AccelerometerXYZ {
  final double x;
  final double y;
  final double z;

  new(this.x, this.y, this.z);

  @override
  String toString() {
    return '''
      x:$x,
      y:$y,
      z:$z
    ''';
  }
}

final accelerometerGravityProvider =
    StreamProvider.autoDispose<AccelerometerXYZ>((ref) async* {
      final stream = accelerometerEventStream(
        samplingPeriod: Duration(milliseconds: 100),
      );

      await for (final event in stream) {
        final x = double.parse((event.x.toStringAsFixed(2)));
        final y = double.parse((event.y.toStringAsFixed(2)));
        final z = double.parse((event.z.toStringAsFixed(2)));

        yield AccelerometerXYZ(x, y, z);
      }
    });

final accelerometerUserProvider = StreamProvider.autoDispose<AccelerometerXYZ>((
  ref,
) async* {
  final stream = userAccelerometerEventStream(
    samplingPeriod: Duration(milliseconds: 100),
  );

  await for (final event in stream) {
    final x = double.parse((event.x.toStringAsFixed(2)));
    final y = double.parse((event.y.toStringAsFixed(2)));
    final z = double.parse((event.z.toStringAsFixed(2)));

    yield AccelerometerXYZ(x, y, z);
  }
});
