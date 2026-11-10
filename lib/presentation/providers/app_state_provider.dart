/*
    resumed: pasó del background al foreground
    inactive: ya no está focus la app (primer plano)
    paused: se mandó al background (segundo plano)
    detached: la app fue destruida
    */

import 'package:flutter/material.dart' show AppLifecycleState;
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appStateProvider = NotifierProvider<AppStateNotifier, AppLifecycleState>(
  AppStateNotifier.new,
);

class AppStateNotifier extends Notifier<AppLifecycleState> {
  @override
  AppLifecycleState build() => AppLifecycleState.resumed;

  void update(AppLifecycleState appLife) => state = appLife;
}
