import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  final TextEditingController num1Controller = TextEditingController();
  final TextEditingController num2Controller = TextEditingController();
  double resultado = 0;

  void calcular(String operacao) {
    double? num1 = double.tryParse(num1Controller.text);
    double? num2 = double.tryParse(num2Controller.text);
    if (num1 == null || num2 == null) {
      setState(() {
        resultado = double.nan; // Indica entrada inválida
      });
      return;
    }

    setState(() {
      switch (operacao) {
        case "+":
          resultado = num1 + num2;
          break;
        case "-":
          resultado = num1 - num2;
          break;
        case "*":
          resultado = num1 * num2;
          break;
        case "/":
          resultado =
              num2 != 0 ? num1 / num2 : double.nan; // Evita divisão por zero
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(32, 32, 32, 1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            style: TextStyle(color: Colors.white),
            controller: num1Controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "Número 1"),
          ),
          TextField(
            style: TextStyle(color: Colors.white),
            controller: num2Controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "Número 2"),
          ),
          Container(
            height: 450,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                          Color.fromRGBO(50, 50, 50, 1),
                        ),
                        fixedSize: WidgetStateProperty.all(Size(100, 100)),
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                      onPressed: () => {calcular("+")},
                      child: Text(
                        "+",
                        style: TextStyle(color: Colors.white, fontSize: 45),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                          Color.fromRGBO(50, 50, 50, 1),
                        ),
                        fixedSize: WidgetStateProperty.all(Size(100, 100)),
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                      onPressed: () => {calcular("-")},
                      child: Text(
                        "-",
                        style: TextStyle(color: Colors.white, fontSize: 45),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                          Color.fromRGBO(50, 50, 50, 1),
                        ),
                        fixedSize: WidgetStateProperty.all(Size(100, 100)),
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                      onPressed: () => {calcular("*")},
                      child: Text(
                        "*",
                        style: TextStyle(color: Colors.white, fontSize: 45),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                          Color.fromRGBO(50, 50, 50, 1),
                        ),
                        fixedSize: WidgetStateProperty.all(Size(100, 100)),
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                      onPressed: () => {calcular("/")},
                      child: Text(
                        "/",
                        style: TextStyle(color: Colors.white, fontSize: 45),
                      ),
                    ),
                  ],
                ),

                // resultado impressão
                const SizedBox(height: 20),
                Text(
                  "Resultado: ${resultado.isNaN ? "Erro" : resultado.toString()}",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
