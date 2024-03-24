import 'package:flutter/material.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  // This widget is the root of you application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Scaffold(
        backgroundColor: Colors.amber,
        body: Center(child: Text("data")),
      ),
    );
  }
}
