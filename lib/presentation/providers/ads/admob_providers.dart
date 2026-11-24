import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_miscellaneous/config/plugins/admob_plugin.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

final adBannerProvider = FutureProvider<BannerAd>((ref) async {
  final ad = await AdmobPlugin.loadBannerAd();
  return ad;
});

final adInterstitialProvider = FutureProvider.autoDispose<InterstitialAd>((ref) async {
  final ad = await AdmobPlugin.loadInterstitialAd();
  return ad;
});
