// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:async';
import 'dart:developer';
import 'dart:math' show Random;

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PushNotificationService {
  static late AwesomeNotifications _notifications;
  static bool _initialized = false;
  static final Completer<void> _completer = Completer<void>();
  PushNotificationService() {
    _notifications = AwesomeNotifications();
    init();
  }

  Future<bool> init() async {
    if (_initialized) return true;
    final result = await _notifications.initialize(
      null,
      [
        NotificationChannel(
          channelKey: 'betterlife_channel',
          channelName: 'Better-Life',
          channelShowBadge: true,
          importance: NotificationImportance.High,
          vibrationPattern: highVibrationPattern,
          channelDescription: 'Notification channel for better-life',
          playSound: true,
          defaultColor: const Color.fromARGB(255, 0, 0, 0),
          ledColor: Colors.white,
        )
      ],
      debug: kDebugMode,
    );
    _initialized = result;
    await initmessaging();
    if (!_completer.isCompleted) {
      _completer.complete();
    }
    return result;
  }

  Future<bool> showNotification({
    required String title,
    required String body,
    int? id,
  }) async {
    if (!_initialized) {
      await _completer.future;
    }
    final result = await _notifications.createNotification(
      content: NotificationContent(
        notificationLayout: NotificationLayout.BigText,
        id: id ?? Random().nextInt(2147483647),
        title: title,
        category: NotificationCategory.Message,
        body: body,
        channelKey: 'betterlife_channel',
        wakeUpScreen: true,
        displayOnBackground: true,
        displayOnForeground: true,
      ),
    );
    return result;
  }

  Future<void> initmessaging() async {
    await FirebaseMessaging.instance.requestPermission();
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        _showRemoteNotification(message);
      }
    });
    FirebaseMessaging.onMessage.listen(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(_handleOnMessageOpenedApp);
  }

  void _handleOnMessageOpenedApp(RemoteMessage message) {
    showNotification(
      title: ((message.data['title']) ?? '').toString(),
      body: ((message.data['body']) ?? '').toString(),
    );
  }

  Future<void> handleMessage(
    RemoteMessage message, {
    bool inBackground = false,
  }) async {
    await _showRemoteNotification(message);
  }

  Future<void> _showRemoteNotification(RemoteMessage message) async {
    print("Message Recieved: ${message.data}");
    final result = await showNotification(
      title: message.notification?.title ?? '',
      body: message.notification?.body ?? '',
    );
    log('${message.notification?.toMap()} \n notification shown: $result');
  }

  Future<String?> getFCMtoken() async {
    try {
      return FirebaseMessaging.instance.getToken();
    } catch (e) {
      print(e);
    }
    return null;
  }
}
