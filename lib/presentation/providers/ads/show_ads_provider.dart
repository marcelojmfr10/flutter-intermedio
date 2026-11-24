import 'package:flutter_miscellaneous/config/config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final showAdsProvider = NotifierProvider<ShowAdsNotifier, bool>(
  ShowAdsNotifier.new,
);

const String storeKey = 'showAds';

class ShowAdsNotifier extends Notifier<bool> {
  @override
  bool build() {
    Future.microtask(checkAdState);
    return true;
  }

  void checkAdState() async {
    state = await SharePreferencesPlugin.getBool(storeKey);
  }

  void removeAds() {
    SharePreferencesPlugin.setBool(storeKey, false);
    state = false;
  }

  void showAds() {
    SharePreferencesPlugin.setBool(storeKey, true);
    state = true;
  }

  void toggleAds() {
    state ? removeAds() : showAds();
  }
}
