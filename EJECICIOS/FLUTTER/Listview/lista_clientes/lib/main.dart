import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart'; // Para kIsWeb
import 'package:lista_clientes/databaseHelper.dart';
import 'package:lista_clientes/pages/home_pages.dart';
import 'package:lista_clientes/pages/lista_clientes.dart';
import 'package:lista_clientes/pages/product_form.dart';
import 'package:lista_clientes/pages/product_list.dart';
import 'package:lista_clientes/pages/routes.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

// Solo importar dart:io si NO estamos en web
import 'dart:io' show Platform;

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializar SQLite según la plataforma
  _initializeDatabase();

  var dbHelper = Databasehelper();
  var dbHelper2 = Databasehelper();

  if (dbHelper == dbHelper2) {
    print("Son iguales");
  } else {
    print("No son iguales");
  }

  runApp(const MainApp());
}

void _initializeDatabase() {
  // Solo inicializar SQLite FFI si NO estamos en web
  if (!kIsWeb) {
    try {
      // En plataformas desktop (Windows, Linux, macOS)
      if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
        sqfliteFfiInit();
        databaseFactory = databaseFactoryFfi;
      }
    } catch (e) {
      print('Error inicializando base de datos: $e');
    }
  }
  // En web, SQLite se maneja automáticamente
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      routes: {
        Routes.listaClientes: (context) => ListarClientesPage(),
        Routes.listaProductos: (context) => const ProductsScreen(),
        Routes.productForm: (context) => ProductForm(),
      },
    );
  }
}
