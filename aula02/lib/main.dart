import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {'/': (context) => MyHomePage(title: "Flutter Demo")},
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _RandomNumber() {
    setState(() {
      _counter = Random().nextInt(4);
    });
  }

  var frases = [
    'Não deixe para hoje o que você pode fazer amanhã',
    'Desista dos seus sonhos e morra',
    'A vingança nunca é plena, mata a alma e envenena',
    'Ta caro não compra',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: <Widget>[
            Image.asset('images/motivacional1.png'),

            Text(
              frases[_counter],
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text('A vida ... ${frases[_counter]},'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _RandomNumber,
        child: const Icon(Icons.add),
      ),
    );
  }
}
