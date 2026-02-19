import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/todo_bloc.dart';
import 'bloc/todo_event.dart';
import 'bloc/todo_state.dart';

void main () => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => TodoBloc(),
        child: const TodoPage(),
      ),
    );
  }
}

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Todo List BLoC')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(controller: controller),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    context
                        .read<TodoBloc>()
                        .add(AddTodo(controller.text));
                    controller.clear();
                  },
                )
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<TodoBloc, TodoState>(
              builder: (context, state) {
                return ListView.builder(
                  itemCount: state.todos.length,
                  itemBuilder: (context, index) {
                    final todo = state.todos[index];
                    return ListTile(
                      title: Text(
                        todo.title,
                        style: TextStyle(
                          decoration: todo.isCompleted
                              ? TextDecoration.lineThrough
                              : null,
                        ),
                      ),
                      onTap: () => context
                          .read<TodoBloc>()
                          .add(ToggleTodo(todo.id)),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => context
                            .read<TodoBloc>()
                            .add(DeleteTodo(todo.id)),
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
