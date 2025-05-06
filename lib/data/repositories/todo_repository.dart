import '../data.dart';

abstract class TodoRepository {
  Future<void> addTodo(Todo todo);
  Future<void> updateTodo(Todo todo);
  Future<void> deleteTodo(Todo todo);
  Future<List<Todo>> getAllTodos();
}
