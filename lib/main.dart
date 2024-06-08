import 'package:flutter/material.dart';

class Checkliste extends StatefulWidget {
  const Checkliste({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ChecklistState createState() => _ChecklistState();
}

class _ChecklistState extends State<Checkliste> {
  final _todoList = <String>[];
  final _todoController = TextEditingController();

  @override
  void dispose() {
    _todoController.dispose();
    super.dispose();
  }

  void _addTodo() {
    final todoText = _todoController.text;
    if (todoText.isNotEmpty) {
      setState(() {
        _todoList.add(todoText);
        _todoController.clear();
      });
    }
  }

  void _deleteTodo(int index) {
    setState(() {
      _todoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkliste'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _todoController,
              decoration: const InputDecoration(
                labelText: 'Neuer Eintrag',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: _addTodo,
            child: const Text('Hinzufügen'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _todoList.length,
              itemBuilder: (context, index) {
                final todo = _todoList[index];
                return ListTile(
                  title: Text(todo),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => _deleteTodo(index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
