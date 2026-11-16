import 'package:share_plus/share_plus.dart';

class SharePlugin {
  static Future<void> shareLink(String link, String subject) async {
    await SharePlus.instance.share(ShareParams(text: link, subject: subject));
  }
}
