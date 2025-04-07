import 'package:flutter/material.dart';
import 'resultado_screen.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pedra, Papel e Tesoura',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: TelaPrincipal(),
    );
  }
}

class TelaPrincipal extends StatefulWidget {
  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  List<String> opcoes = ['pedra', 'papel', 'tesoura'];
  String escolhaApp = 'padrao';

  void _jogar(String escolhaUsuario) {
    String escolhaApp = opcoes[Random().nextInt(opcoes.length)];
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => TelaResultado(
              escolhaUsuario: escolhaUsuario,
              escolhaApp: escolhaApp,
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'Pedra, Papel, Tesoura',
          style: TextStyle(
            color: Colors.white,
          ), // Definindo a cor do texto como branco
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/$escolhaApp.png', width: 100, height: 100),
          SizedBox(height: 10),
          Text('Escolha do APP (Aleatório)', style: TextStyle(fontSize: 18)),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
                opcoes.map((opcao) {
                  return GestureDetector(
                    onTap: () => _jogar(opcao),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/$opcao.png',
                            width: 80,
                            height: 80,
                          ),
                          SizedBox(height: 5),
                        ],
                      ),
                    ),
                  );
                }).toList(),
          ),
        ],
      ),
    );
  }
}
