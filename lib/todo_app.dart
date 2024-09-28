import 'package:ayah2/ToDoCubit/todo_cubit.dart';
import 'package:ayah2/widgets/todo_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'models/todo_item.dart';
class TodoAppWithoutStateManagement extends StatelessWidget {
  TodoAppWithoutStateManagement({super.key});

  void _showAddTodoDialog(BuildContext context) {
    final _titleController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Add New Task"),
        content: TextField(
          controller: _titleController,
          decoration: const InputDecoration(labelText: "Task Title"),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              if (_titleController.text.isNotEmpty) {
                context.read<ToDoCubit>().addTask(_titleController.text);
                Navigator.pop(context);
              } else {

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Task title cannot be empty!")),
                );
              }
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Tasks'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: BlocBuilder<ToDoCubit, List<Todo>>(
        builder: (context, state) {
          if (state.isEmpty) {
            return const Center(child: Text('No Tasks Available'));
          } else {
            return ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: state.length,
              itemBuilder: (context, index) {
                final todo = state[index];
                return TodoItem(
                  title: todo.title,
                  isDone: todo.isDone,
                  onDelete: () {

                    context.read<ToDoCubit>().deleteTask(index);
                  },
                  onToggled: (isChecked) {

                    context.read<ToDoCubit>().toggleTaskStatus(index, todo.isDone);
                  },
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddTodoDialog(context),
        child: const Icon(Icons.add),
        backgroundColor: Colors.teal,
      ),
    );
  }
}
