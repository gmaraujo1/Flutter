import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TelaResultado extends StatefulWidget {
  final String id;

  const TelaResultado({super.key, required this.id});

  @override
  State<TelaResultado> createState() => _TelaResultadoState();
}

class _TelaResultadoState extends State<TelaResultado> {
  String nome = '';
  String email = '';
  String avatarUrl = '';
  bool carregando = true;
  bool erro = false;

  @override
  void initState() {
    super.initState();
    _buscarUsuario(widget.id);
  }

  void _buscarUsuario(String id) async {
    try {
      var url = Uri.parse("https://reqres.in/api/users/$id");
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        setState(() {
          nome = "${data['data']['first_name']} ${data['data']['last_name']}";
          email = data['data']['email'];
          avatarUrl = data['data']['avatar'];
          carregando = false;
        });
      } else {
        setState(() {
          erro = true;
          carregando = false;
        });
      }
    } catch (e) {
      setState(() {
        erro = true;
        carregando = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Resultado")),
      body: Center(
        child:
            carregando
                ? const CircularProgressIndicator()
                : erro
                ? const Text(
                  "Erro ao buscar o usuário.",
                  style: TextStyle(fontSize: 18, color: Colors.red),
                )
                : Container(
                  width: 350,
                  height: 150,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.green.shade100,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          avatarUrl,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              nome,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(email, style: const TextStyle(fontSize: 16)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
      ),
    );
  }
}
