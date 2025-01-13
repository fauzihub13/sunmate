import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_sunmate/main.dart';
import 'package:flutter_sunmate/src/core/constants/variables.dart';
import 'package:flutter_sunmate/src/data/sources/auth/auth_local_datasources.dart';
import 'package:flutter_sunmate/src/presentation/notification/pages/notification_list_page.dart';
import 'package:http/http.dart' as http;

class FirebaseNotificationDatasources {
  // Create instance of FBM
  final _firebaseMessaging = FirebaseMessaging.instance;

  final _androidChannel = const AndroidNotificationChannel(
      'high_importance_channel', 'High Importance Notifications',
      description: 'This channel is used for important notifications.',
      importance: Importance.defaultImportance);

  final _localNotifications = FlutterLocalNotificationsPlugin();

  Future iniLocalNotifications() async {
    const iOS = DarwinInitializationSettings();
    const android = AndroidInitializationSettings('launcher_icon');
    const settings = InitializationSettings(android: android, iOS: iOS);

    await _localNotifications.initialize(settings,
        onDidReceiveNotificationResponse: (NotificationResponse response) {
      if (response.payload != null) {
        final message = RemoteMessage.fromMap(jsonDecode(response.payload!));
        handleMessage(message);
      }
    });

    final platform = _localNotifications.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();

    await platform?.createNotificationChannel(_androidChannel);
  }

  // Update FCM Token
  Future<void> updateFcmToken(String fcmToken) async {
    final url = Uri.parse('${Variables.apiUrl}/user/fcm-token');
    final authData = await AuthLocalDatasources().getAuthData();
    final response = await http.post(url, headers: {
      'Authorization': 'Bearer ${authData.token}',
      'Accept': 'application/json',
    }, body: {
      'user_id': authData.user!.id!.toString(),
      'fcm_token': fcmToken
    });

    if (response.statusCode == 200) {
      debugPrint('FCM Token updated successfully');
    } else {
      debugPrint('Failed to update FCM Token: ${response.body}');
    }
  }

  // Initialize notifications for device
  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    String? fcmToken = await _firebaseMessaging.getToken();
    debugPrint('FCM Token: $fcmToken');

    if (fcmToken != null) {
      debugPrint('FCM Token: $fcmToken');
      await updateFcmToken(fcmToken);
    } else {
      debugPrint('Failed to get FCM Token');
    }

    handleBackgroundNotification();
  }

  // Handle message when received
  void handleMessage(RemoteMessage? message) {
    if (message == null) return;
    // print(message.notification?.title!);
    // print(message.notification?.body!);
    // print(message.data);
    // navigatorKey.currentState!.pushNamed(Routes.notificationListPage);
    navigatorKey.currentState!.push(
        MaterialPageRoute(builder: (context) => const NotificationListPage()));
  }

  Future handleBackgroundNotification() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
            alert: true, badge: true, sound: true);
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    // Auto open notification when app opened
    FirebaseMessaging.onMessage.listen((message) {
      final notification = message.notification;
      if (notification == null) return;
      // print(notification.title!);
      _localNotifications.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
              android: AndroidNotificationDetails(
                  _androidChannel.id, _androidChannel.name,
                  channelDescription: _androidChannel.description,
                  icon: '@mipmap/launcher_icon')),
          payload: jsonEncode(message.toMap()));
    });

    // FirebaseMessaging.onBackgroundMessage(handleMessage);
  }
}
