import 'package:flutter/material.dart';
import 'package:lista_clientes/pages/home_pages.dart';
import 'package:lista_clientes/pages/lista_clientes.dart';

import 'package:lista_clientes/pages/routes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const HomePage(), routes: {
      Routes.listaClientes: (context) => ListarClientesPage(),
    });
  }
}
