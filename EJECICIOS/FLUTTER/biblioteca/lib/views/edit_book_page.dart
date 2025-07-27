import 'package:flutter/material.dart';
import '../models/book.dart';
import '../services/database_helpers.dart';

class EditBookPage extends StatefulWidget {
  final Book book;
  const EditBookPage({super.key, required this.book});

  @override
  State<EditBookPage> createState() => _EditBookPageState();
}

class _EditBookPageState extends State<EditBookPage> {
  late TextEditingController titleController;
  late TextEditingController authorController;
  late TextEditingController noteController;
  late String status;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.book.title);
    authorController = TextEditingController(text: widget.book.author);
    noteController = TextEditingController(text: widget.book.note);
    status = widget.book.status;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Editar Libro')),
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
              decoration: const InputDecoration(labelText: 'Notas'),
            ),
            ElevatedButton(
              onPressed: () async {
                final updatedBook = Book(
                  id: widget.book.id,
                  title: titleController.text,
                  author: authorController.text,
                  status: status,
                  note: noteController.text,
                ); // Book
                await DatabaseHelper().updateBook(updatedBook);
                Navigator.pop(context, true);
              },
              child: const Text('Actualizar'),
            ), // ElevatedButton
          ],
        ), // Column
      ), // Padding
    ); // Scaffold
  }
}
