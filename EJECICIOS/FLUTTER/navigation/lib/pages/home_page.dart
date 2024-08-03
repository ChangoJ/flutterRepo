import 'package:flutter/material.dart';
import 'package:navigation/pages/customers_page.dart';
import 'package:navigation/pages/products_page.dart';
import 'package:navigation/pages/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MaterialButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.customers);
              //Navigator.push(context, route);
            },
            color: Colors.blue,
            child: const Text("IR A PAGINA DE PRODUCTO"),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.customers);

              /* final route = MaterialPageRoute(builder: (ctx) {
                return const CustomersPage();
              });
              Navigator.push(context, route);*/
            },
            color: Colors.blue,
            child: const Text("IR A CLIENTES"),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.listview);
              //Navigator.push(context, route);
            },
            color: Colors.blue,
            child: const Text("IR A PAGINA DE LISTIVEW"),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.productsList);
              //Navigator.push(context, route);
            },
            color: Colors.blue,
            child: const Text("IR A PAGINA DE LISTA DE PRODUCTOS"),
          ),
        ],
      ),
    );
  }
}
