import 'package:flutter/material.dart';
import 'package:lista_clientes/databaseHelper.dart';
import 'package:lista_clientes/product.dart';

class ProductEditForm extends StatefulWidget {
  final Product product;

  const ProductEditForm({Key? key, required this.product}) : super(key: key);

  @override
  _ProductEditFormState createState() => _ProductEditFormState();
}

class _ProductEditFormState extends State<ProductEditForm> {
  final _formKey = GlobalKey<FormState>();

  late String _name;
  late double _price;
  late String _description;
  late String _email;

  // Controladores para prellenar los campos
  late TextEditingController _nameController;
  late TextEditingController _priceController;
  late TextEditingController _descriptionController;
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    // Inicializar valores con los datos del producto existente
    _name = widget.product.name;
    _price = widget.product.price;
    _description = widget.product.description ?? '';
    _email = widget.product.email ?? '';

    // Inicializar controladores con valores existentes
    _nameController = TextEditingController(text: _name);
    _priceController = TextEditingController(text: _price.toString());
    _descriptionController = TextEditingController(text: _description);
    _emailController = TextEditingController(text: _email);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Producto'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => _showDeleteDialog(),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Nombre',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, introduce un nombre';
                  }
                  return null;
                },
                onSaved: (value) => _name = value ?? '',
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _priceController,
                decoration: InputDecoration(
                  labelText: 'Precio',
                  border: OutlineInputBorder(),
                  prefixText: '\$',
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, introduce un precio';
                  }
                  try {
                    final double price = double.parse(value);
                    if (price <= 0.0) {
                      return 'El precio debe ser mayor que cero';
                    }
                  } catch (e) {
                    return 'Por favor, introduce un precio válido';
                  }
                  return null;
                },
                onSaved: (value) =>
                    _price = double.tryParse(value ?? '0') ?? 0.0,
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: 'Descripción (opcional)',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
                onSaved: (value) => _description = value ?? '',
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                onSaved: (value) => _email = value ?? '',
              ),
              SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('Cancelar'),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _updateProduct,
                      child: Text('Actualizar'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _updateProduct() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final updatedProduct = Product(
          id: widget.product.id,
          name: _name,
          price: _price,
          description: _description,
          email: _email);

      try {
        await Databasehelper().updateProduct(updatedProduct);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Producto actualizado exitosamente'),
            backgroundColor: Colors.green,
          ),
        );

        Navigator.pop(
            context, updatedProduct); // Retorna el producto actualizado
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error al actualizar el producto: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void _showDeleteDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Eliminar Producto'),
          content: Text(
              '¿Estás seguro de que quieres eliminar "${widget.product.name}"?'),
          actions: [
            TextButton(
              child: Text('Cancelar'),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
              child: Text(
                'Eliminar',
                style: TextStyle(color: Colors.red),
              ),
              onPressed: _deleteProduct,
            ),
          ],
        );
      },
    );
  }

  void _deleteProduct() async {
    try {
      await Databasehelper().deleteProduct(widget.product.id);

      Navigator.pop(context); // Cerrar dialog
      Navigator.pop(
          context, 'deleted'); // Volver a la lista con indicador de eliminación

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Producto eliminado exitosamente'),
          backgroundColor: Colors.orange,
        ),
      );
    } catch (e) {
      Navigator.pop(context); // Cerrar dialog
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error al eliminar el producto: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
