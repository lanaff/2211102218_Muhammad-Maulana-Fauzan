import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: ColumnRowExample()));
}

class ColumnRowExample extends StatelessWidget {
  const ColumnRowExample({super.key});

  @override
  Widget build(BuildContext context) {
    print('ColumnRowExample is building'); // Debugging
    return Scaffold(
      backgroundColor: Colors.white, // Tambahkan warna latar belakang
      appBar: AppBar(title: const Text('Contoh Layout Flutter')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  const FlutterLogo(),
                  const Expanded(
                    child: Text(
                      "Flutter's hot reload helps you quickly and easily experiment, build UIs, add features, and fix bug faster.",
                    ),
                  ),
                  const Icon(Icons.sentiment_very_satisfied),
                ],
              ),
              const SizedBox(height: 32),
              Column(
                children: const [
                  Text('Deliver features faster'),
                  Text('Craft beautiful UIs'),
                  FlutterLogo(),
                ],
              ),
              const SizedBox(height: 32),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text('We move under cover and we move as one'),
                  const Text(
                    'Through the night, we have one shot to live another day',
                  ),
                  const Text('We cannot let a stray gunshot give us away'),
                  const Text(
                    'We will fight up close, seize the moment and stay in it',
                  ),
                  const Text(
                    'It’s either that or meet the business end of a bayonet',
                  ),
                  const Text('The code word is ‘Rochambeau,’ dig me?'),
                  Text(
                    'Rochambeau!',
                    style: DefaultTextStyle.of(
                      context,
                    ).style.apply(fontSizeFactor: 2.0),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
