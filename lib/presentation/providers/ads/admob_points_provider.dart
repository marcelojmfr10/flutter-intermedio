import 'package:flutter_riverpod/flutter_riverpod.dart';

final adPointsProvider = NotifierProvider<AdPointsNotifier, int>(
  AdPointsNotifier.new,
);

class AdPointsNotifier extends Notifier<int> {
  @override
  int build() {
    return 0;
  }

  void add(int value) {
    state = state + value;
  }
}
