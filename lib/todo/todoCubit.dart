import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson01_flutter/todo/todoModel.dart';
import 'package:lesson01_flutter/todo/todoState.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoState.initial());

  void addTodo(String title, String description) {
    final newTodo = TodoModel(
      title: title,
      description: description,
    );

    final updatedList = List<TodoModel>.from(state.todos)..add(newTodo);

    emit(state.copyWith(todos: updatedList));
  }
}