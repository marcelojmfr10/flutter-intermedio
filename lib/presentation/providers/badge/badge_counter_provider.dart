import 'package:flutter_riverpod/flutter_riverpod.dart';

final badgeCounterProvider = NotifierProvider<BadgeCounterNotifier, int>(
  BadgeCounterNotifier.new,
);

class BadgeCounterNotifier extends Notifier<int> {
  @override
  int build() {
    return 0;
  }

  void add(int value) {
    state = state + value;
  }
}
