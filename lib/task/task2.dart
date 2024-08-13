import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Greeting App'),
        ),
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  void _showSnackbar(BuildContext context) {
    const snackBar = SnackBar(
      content: Text('Button Pressed! '),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Hello, World!!",
            style: TextStyle(
                color: Colors.red, fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Welcome to Flutter!",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w400, fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          const Image(image: AssetImage("assets/images/flutter_icon.png")),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () => _showSnackbar(context),
            style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.green)),
            child: const Text('Press Me'),
          ),
        ],
      ),
    );
  }
}
