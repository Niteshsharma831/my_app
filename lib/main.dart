import 'package:flutter/material.dart';
import 'package:my_app/loginscreen.dart';
import 'package:my_app/stopwatch.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
            body: Center(
          child: MyLoginScreen(),
        )),
      ),
    );
  }
}
