import 'package:flutter_test/flutter_test.dart';

import 'package:modul7_lana/main.dart'; // Pastikan nama paket sesuai dengan aplikasi Anda

void main() {
  testWidgets('Smoke test for MyApp', (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the app renders the initial UI.
    expect(find.text('Show Notification'), findsOneWidget);
    expect(find.text('Welcome to Notification Example!'), findsNothing);

    // Simulate a button tap and trigger a frame.
    await tester.tap(find.text('Show Notification'));
    await tester.pump();

    // Verify that the button tap does not crash the app.
    expect(find.text('Show Notification'), findsOneWidget);
  });
}
