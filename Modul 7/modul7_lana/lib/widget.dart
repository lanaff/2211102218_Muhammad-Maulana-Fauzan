import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  void initState() {
    super.initState();

    var initializationSettingsAndroid = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );
    var initializationSettingsIOs = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );
    var initSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOs,
    );

    flutterLocalNotificationsPlugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) async {
        if (response.payload != null) {
          debugPrint('Notification payload: ${response.payload}');
        }
      },
    );
  }

  Future<void> showNotification() async {
    debugPrint('showNotification called');
    var android = AndroidNotificationDetails(
      'id',
      'channel',
      channelDescription: 'description',
      priority: Priority.high,
      importance: Importance.max,
    );
    var iOS = DarwinNotificationDetails();
    var platform = NotificationDetails(android: android, iOS: iOS);
    await flutterLocalNotificationsPlugin.show(
      0,
      'Flutter devs',
      'Flutter Local Notification Demo',
      platform,
      payload: 'Welcome to the Local Notification demo',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notification Example')),
      body: Center(
        child: ElevatedButton(
          onPressed: showNotification,
          child: Text('Show Notification'),
        ),
      ),
    );
  }
}
