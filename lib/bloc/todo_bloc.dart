import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import 'todo_event.dart';
import 'todo_state.dart';
import '../todo.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(const TodoState()) {
    on<AddTodo>((event, emit) {
      final newTodo = Todo(
        id: const Uuid().v4(),
        title: event.title,
      );
      emit(state.copyWith(
        todos: List.from(state.todos)..add(newTodo),
      ));
    });

    on<ToggleTodo>((event, emit) {
      final updated = state.todos.map((todo) {
        if (todo.id == event.id) {
          return todo.copyWith(isCompleted: !todo.isCompleted);
        }
        return todo;
      }).toList();

      emit(state.copyWith(todos: updated));
    });

    on<DeleteTodo>((event, emit) {
      final updated =
          state.todos.where((todo) => todo.id != event.id).toList();

      emit(state.copyWith(todos: updated));
    });
  }
}
