import '../data.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoDatasource _datasource;
  TodoRepositoryImpl(this._datasource);

  @override
  Future<void> addTodo(Todo todo) async {
    try {
      await _datasource.addTodo(todo);
    } catch (e) {
      throw '$e';
    }
  }

  @override
  Future<void> deleteTodo(Todo todo) async {
    try {
      await _datasource.deleteTodo(todo);
    } catch (e) {
      throw '$e';
    }
  }

  @override
  Future<List<Todo>> getAllTodos() async {
    try {
      return await _datasource.getAllTodos();
    } catch (e) {
      throw '$e';
    }
  }

  @override
  Future<void> updateTodo(Todo todo) async {
    try {
      await _datasource.updateTodo(todo);
    } catch (e) {
      throw '$e';
    }
  }
}
