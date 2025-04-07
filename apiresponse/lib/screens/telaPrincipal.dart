import 'package:flutter/material.dart';
import 'package:apiresponse/screens/telaResultado.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  final TextEditingController _controllerId = TextEditingController();

  void _navegarParaResultado() {
    String id = _controllerId.text.trim();
    if (id.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TelaResultado(id: id)),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Digite um ID válido")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Consultar Usuário"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.person_search,
              size: 100,
              color: Colors.deepPurple,
            ),
            const SizedBox(height: 40),
            TextField(
              controller: _controllerId,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Digite o ID do usuário',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _navegarParaResultado,
              icon: const Icon(Icons.search, color: Colors.black),
              label: const Text("Consultar"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
                textStyle: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
