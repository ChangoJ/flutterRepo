import 'package:flutter/material.dart';
import '../models/book.dart';
import '../services//database_helpers.dart';

class AddBookPage extends StatefulWidget {
  const AddBookPage({super.key});

  @override
  State<AddBookPage> createState() => _AddBookPageState();
}

class _AddBookPageState extends State<AddBookPage> {
  final titleController = TextEditingController();
  final authorController = TextEditingController();
  final noteController = TextEditingController();
  String status = 'Pendiente';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Agregar Libro')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Título'),
            ), // TextField
            TextField(
              controller: authorController,
              decoration: const InputDecoration(labelText: 'Autor'),
            ), // TextField
            DropdownButton<String>(
              value: status,
              items: [
                'Leído',
                'Pendiente',
              ].map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(),
              onChanged: (val) => setState(() => status = val!),
            ), // DropdownButton
            TextField(
              controller: noteController,
              decoration: const InputDecoration(labelText: 'Nota'),
            ), // TextField
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final book = Book(
                  id: DateTime.now().millisecondsSinceEpoch,
                  title: titleController.text,
                  author: authorController.text,
                  status: status,
                  note: noteController.text,
                ); // Book
                await DatabaseHelper().insertBook(book);
                Navigator.pop(context, true);
              },
              child: const Text('Guardar'),
            ), // ElevatedButton
          ],
        ),
      ),
    );
  }
}
