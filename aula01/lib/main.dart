import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aula 01',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),

      ),
      home: const MyHomePage(title: 'HELLO WORLD'),
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


  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 0, 0, 1),
        title: Text(widget.title, style: TextStyle(color: Colors.white),),
      ),
      body: Column(

        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text('Você apertou o botão',
          style: TextStyle(fontWeight: FontWeight.bold,
          fontSize: 30),
          ),

          Text(
            '$_counter vezes',
            style: TextStyle(fontWeight: FontWeight.bold,
            fontSize: 30),
          ),

          Text('Com Sucesso',
            style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 30),

          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        shape: CircleBorder(),
        backgroundColor: Colors.black,
        child: const Icon(
            Icons.check,
            size: 40,
            color: Colors.white
        ),


      ),
    );
  }
}
