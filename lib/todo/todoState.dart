import 'package:lesson01_flutter/todo/todoModel.dart';
import 'package:equatable/equatable.dart';


class TodoState extends Equatable {
  final List<TodoModel> todos;

  const TodoState({required this.todos});

  factory TodoState.initial() {
    return const TodoState(todos: []);
  }

  TodoState copyWith({
    List<TodoModel>? todos,
  }) {
    return TodoState(
      todos: todos ?? this.todos,
    );
  }

  @override
  List<Object?> get props => [todos];
}