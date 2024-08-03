import 'package:flutter/material.dart';
import 'package:navigation/pages/product_pages.dart';

class ProductlistPages extends StatelessWidget {
  ProductlistPages({super.key});

  final List<Product> products = [
    Product(
        name: "Producto1",
        price: 10.0,
        description: "Descripcion del prodcut1"),
    Product(
        name: "Producto2",
        price: 50.0,
        description: "Descripcion del prodcut2"),
    Product(
        name: "Producto3",
        price: 130.0,
        description: "Descripcion del prodcut3"),
    Product(
        name: "Producto4", price: 20.0, description: "Descripcion del prodcut4")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
        ),
        body: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(products[index].name),
              subtitle: Text(products[index].description),
              trailing: Text('\$${products[index].price.toStringAsFixed(2)}'),
            );
          },
        ));
  }
}
