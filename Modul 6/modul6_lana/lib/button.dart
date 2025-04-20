import 'package:flutter/material.dart';

void main() => runApp(const ButtonDemo());

class ButtonDemo extends StatefulWidget {
  const ButtonDemo({Key? key}) : super(key: key);

  @override
  State<ButtonDemo> createState() => _ButtonDemoState();
}

class _ButtonDemoState extends State<ButtonDemo> {
  // For dropdown
  String selectedValue = 'Option 1';
  final List<String> options = ['Option 1', 'Option 2', 'Option 3', 'Option 4'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Flutter Button Examples')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // ElevatedButton example
              ElevatedButton(
                onPressed: () {
                  print('ini done');
                },
                child: const Text('Submit'),
              ),
              const SizedBox(height: 20),

              // TextButton example
              TextButton(
                onPressed: () {
                  print('sukses');
                },
                child: const Text('Menu'),
              ),
              const SizedBox(height: 20),

              // DropdownButton example
              DropdownButton<String>(
                value: selectedValue,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedValue = newValue!;
                  });
                },
                items:
                    options.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
