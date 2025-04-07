import 'package:flutter/material.dart';

class TelaResultado extends StatelessWidget {
  String escolhaUsuario;
  String escolhaApp;

  TelaResultado({required this.escolhaUsuario, required this.escolhaApp});

  String _verificarResultado() {
    if (escolhaUsuario == escolhaApp) {
      return 'empate';
    } else if ((escolhaUsuario == 'pedra' && escolhaApp == 'tesoura') ||
        (escolhaUsuario == 'papel' && escolhaApp == 'pedra') ||
        (escolhaUsuario == 'tesoura' && escolhaApp == 'papel')) {
      return 'vitoria';
    } else {
      return 'derrota';
    }
  }

  @override
  Widget build(BuildContext context) {
    String resultado = _verificarResultado();
    String imagemResultado = 'assets/images/$resultado.png';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Pedra, Papel, Tesoura'),
        centerTitle: true,
      ),
      body: Center(
        // Envolvendo tudo dentro do Center para centralizar
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Centraliza os itens na coluna
          crossAxisAlignment:
              CrossAxisAlignment
                  .center, // Garante que os itens da coluna fiquem centralizados
          children: [
            Image.asset(
              'assets/images/$escolhaApp.png',
              width: 100,
              height: 100,
            ),
            SizedBox(height: 10),
            Text(
              'Escolha do APP',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Image.asset(
              'assets/images/$escolhaUsuario.png',
              width: 100,
              height: 100,
            ),
            SizedBox(height: 10),
            Text(
              'Sua Escolha',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Image.asset(imagemResultado, width: 100, height: 100),
            SizedBox(height: 10),
            Text(
              resultado == 'vitoria'
                  ? 'Você Venceu'
                  : resultado == 'derrota'
                  ? 'Você Perdeu'
                  : 'Empate',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Jogar novamente',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
