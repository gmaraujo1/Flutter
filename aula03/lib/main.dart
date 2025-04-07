import 'package:flutter/material.dart';
import 'package:aulatres/screens/segunda.dart';
import 'package:aulatres/screens/myHomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routes: {
        '/': (context) => const MyHomePage(title: 'Flutter Demo'),
        '/segunda': (context) => Segunda(),
      },
    );
  }
}
