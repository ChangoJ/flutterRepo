import 'package:flutter/material.dart';

class ListarClientesPage extends StatelessWidget {
  final List<String> clientes = [
    'Cliente 1',
    'Cliente 2',
    'Cliente 3',
    'Cliente 4',
    'Cliente 5',
    'Cliente 6',
    'Cliente 7',
    'Cliente 8',
    'Cliente 9',
    'Cliente 10',
  ];

  ListarClientesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Clientes'),
      ),
      body: ListView.builder(
        itemCount: clientes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(clientes[index]),
          );
        },
      ),
    );
  }
}
