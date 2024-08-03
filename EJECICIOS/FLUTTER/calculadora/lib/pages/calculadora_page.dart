import 'package:flutter/material.dart';

class CalculadoraPage extends StatefulWidget {
  const CalculadoraPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return CalculadoraPageState();
  }
}

class CalculadoraPageState extends State {
  int? valor1;
  int? valor2;
  int resultado = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("Calculadora"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text("Ingrese un numero: "),
            TextField(
              keyboardType: TextInputType.number,
              textAlign: TextAlign.right,
              controller: TextEditingController(
                text: "0",
              ),
              onChanged: (text) => {
                valor1 = int.parse(text),
              },
            ),
            const Text("Ingrese un numero: "),
            TextField(
              keyboardType: TextInputType.number,
              textAlign: TextAlign.right,
              controller: TextEditingController(
                text: "0",
              ),
              onChanged: (text) => {
                valor2 = int.parse(text),
              },
            ),
            MaterialButton(
              color: Colors.red,
              onPressed: () => {
                resultado = valor1! + valor2!,
                setState(() {}),
              },
              child: const Text("Sumar"),
            ),
            Text("$resultado")
          ],
        ),
      ),
    );
  }
}
