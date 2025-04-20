import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// Import local files
import 'navigation.dart';
import 'widget.dart';
import 'user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize notification settings consistent with widget.dart
  var initializationSettingsAndroid = AndroidInitializationSettings(
    '@mipmap/ic_launcher',
  );
  var initializationSettingsIOs = DarwinInitializationSettings(
    onDidReceiveLocalNotification: (id, title, body, payload) async {
      // Callback for iOS if needed
    },
  );
  var initSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOs,
  );

  // Use the same flutterLocalNotificationsPlugin instance from widget.dart
  await flutterLocalNotificationsPlugin.initialize(
    initSettings,
    onDidReceiveNotificationResponse: (NotificationResponse response) async {
      // This will be handled in widget.dart when needed
    },
  );

  // Request permissions for iOS
  flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
        IOSFlutterLocalNotificationsPlugin
      >()
      ?.requestPermissions(alert: true, badge: true, sound: true);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Pastikan konstruktor ini menggunakan `const`

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyWidget(), // Panggil widget utama dari widget.dart
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Demo App')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Selamat Datang di Aplikasi Demo',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FirstRoute()),
                );
              },
              child: Text('Demo Navigasi'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyWidget()),
                );
              },
              child: Text('Demo Notifikasi'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              onPressed: () {
                _showAlbumDialog(context);
              },
              child: Text('Demo Album'),
            ),
          ],
        ),
      ),
    );
  }

  void _showAlbumDialog(BuildContext context) {
    // Simple implementation to demonstrate Album class usage
    final demoAlbum = Album(userId: 1, id: 1, title: 'Demo Album Title');

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('Album Info'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('User ID: ${demoAlbum.userId}'),
                Text('ID: ${demoAlbum.id}'),
                Text('Title: ${demoAlbum.title}'),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Tutup'),
              ),
            ],
          ),
    );
  }
}
