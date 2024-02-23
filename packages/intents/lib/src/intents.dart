import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Intents {
  static void noAppAvailable({String? msg}) {
    Fluttertoast.showToast(msg: msg ?? 'No app available to open this link');
  }

  static Future<bool> emailIntent(
    String? email, {
    String? subject,
    String? body,
  }) async {
    var q = '';
    if (subject != null) q += 'subject=$subject';
    if (body != null) q += '&body=$body';

    final emailLaunchUri = Uri(scheme: 'mailto', path: email, query: q);
    // final email = emailLaunchUri.toString();
    final result = await canLaunchUrlString(emailLaunchUri.toString());
    try {
      await launchUrl(emailLaunchUri);
    } catch (e) {
      noAppAvailable();
    }
    return result;
  }

  static Future<void> openMap(String url) async {
    try {
      final baseUrl = url.split(' ')..removeRange(0, 2);

      await MapsLauncher.launchQuery(
        baseUrl.join(' '),
      );
    } catch (e) {
      rethrow;
    }
  }

  static Future<bool> dialIntent(String phoneNumber) async {
    final phone = Uri(scheme: 'tel', path: phoneNumber).toString();
    final result = await canLaunchUrlString(phone);
    try {
      await launchUrl(Uri.parse(phone));
    } catch (e) {
      log(e.toString());
      noAppAvailable();
    }
    return result;
  }
}
