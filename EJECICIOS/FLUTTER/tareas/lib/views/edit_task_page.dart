import 'package:flutter/material.dart';
import 'package:tareas/models/tarea.dart';
import '../services/database_helper.dart';

class EditTaskPage extends StatefulWidget {
  final Task task;
  const EditTaskPage({super.key, required this.task});

  @override
  State<EditTaskPage> createState() => _EditTaskPageState();
}

class _EditTaskPageState extends State<EditTaskPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  late TextEditingController dueDateController;
  late String status;
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.task.title);
    descriptionController = TextEditingController(
      text: widget.task.description,
    );
    dueDateController = TextEditingController(text: widget.task.dueDate);
    status = widget.task.status;

    // Parse the existing date
    try {
      final dateParts = widget.task.dueDate.split('-');
      if (dateParts.length == 3) {
        selectedDate = DateTime(
          int.parse(dateParts[0]),
          int.parse(dateParts[1]),
          int.parse(dateParts[2]),
        );
      }
    } catch (e) {
      selectedDate = DateTime.now();
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dueDateController.text =
            "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Editar Tarea')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: 'Título *',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'El título es obligatorio';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Descripción',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: dueDateController,
                decoration: const InputDecoration(
                  labelText: 'Fecha de vencimiento *',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                readOnly: true,
                onTap: () => _selectDate(context),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'La fecha de vencimiento es obligatoria';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: status,
                decoration: const InputDecoration(
                  labelText: 'Estado',
                  border: OutlineInputBorder(),
                ),
                items: ['Pendiente', 'Completada']
                    .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                    .toList(),
                onChanged: (val) => setState(() => status = val!),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final updatedTask = Task(
                        id: widget.task.id,
                        title: titleController.text,
                        description: descriptionController.text,
                        dueDate: dueDateController.text,
                        status: status,
                      );
                      await DatabaseHelper().updateTask(updatedTask);
                      Navigator.pop(context, true);
                    }
                  },
                  child: const Text('Actualizar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
