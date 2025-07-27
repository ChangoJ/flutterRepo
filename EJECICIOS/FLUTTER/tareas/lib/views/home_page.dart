import 'package:flutter/material.dart';
import 'package:tareas/models/tarea.dart';
import '../services/database_helper.dart';
import '../widgets/task_tile.dart';
import 'edit_task_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Task>> _taskList;

  @override
  void initState() {
    super.initState();
    _refreshList();
  }

  void _refreshList() {
    setState(() {
      _taskList = DatabaseHelper().getTasks();
    });
  }

  void _deleteTask(int id) async {
    // Mostrar diálogo de confirmación
    final bool? confirmed = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmar eliminación'),
          content: const Text(
            '¿Estás seguro de que deseas eliminar esta tarea?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Eliminar'),
            ),
          ],
        );
      },
    );

    if (confirmed == true) {
      await DatabaseHelper().deleteTask(id);
      _refreshList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestión de Tareas'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: FutureBuilder<List<Task>>(
        future: _taskList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData && snapshot.data!.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.task_alt, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    'No hay tareas registradas.',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Presiona el botón + para agregar una nueva tarea.',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error al cargar las tareas'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final task = snapshot.data![index];
                return TaskTile(
                  task: task,
                  onDelete: () => _deleteTask(task.id),
                  onEdit: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => EditTaskPage(task: task),
                      ),
                    );
                    if (result == true) _refreshList();
                  },
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.pushNamed(context, '/add');
          if (result == true) _refreshList();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
