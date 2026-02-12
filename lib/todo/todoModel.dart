import 'package:equatable/equatable.dart';

class TodoModel extends Equatable {
  final String title;
  final String description;

  const TodoModel({
    required this.title,
    required this.description,
  });

  @override
  List<Object?> get props => [title, description];
}
