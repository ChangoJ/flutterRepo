import 'package:flutter/material.dart';

import 'routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.listaClientes);
              },
              child: const Text('Listar Clientes'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.listaProductos);
              },
              child: const Text('Listar Productos'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.productForm);
              },
              child: const Text('Productos form'),
            ),
          ],
        ),
      ),
    );
  }
}
