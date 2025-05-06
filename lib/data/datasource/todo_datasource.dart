import '../../utils/utils.dart';
import '../data.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class TodoDatasource {
  static final TodoDatasource _instance = TodoDatasource._();

  factory TodoDatasource() => _instance;

  TodoDatasource._() {
    _initDb();
  }

  static Database? _database;

  Future<Database> get database async {
    _database ??= await _initDb();
    return _database!;
  }

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'todos.db');

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
       CREATE TABLE ${AppKeys.dbTable} (
         ${TodoKeys.id} INTEGER PRIMARY KEY AUTOINCREMENT,
         ${TodoKeys.title} TEXT,
         ${TodoKeys.note} TEXT,
         ${TodoKeys.date} TEXT,
         ${TodoKeys.time} TEXT,
         ${TodoKeys.category} TEXT,
         ${TodoKeys.isCompleted} INTEGER
       )
     ''');
  }

  Future<int> addTodo(Todo todo) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.insert(
        AppKeys.dbTable,
        todo.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    });
  }

  Future<List<Todo>> getAllTodos() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      AppKeys.dbTable,
      orderBy: "id DESC",
    );
    return List.generate(maps.length, (index) {
      return Todo.fromJson(maps[index]);
    });
  }

  Future<int> updateTodo(Todo todo) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.update(
        AppKeys.dbTable,
        todo.toJson(),
        where: 'id = ?',
        whereArgs: [todo.id],
      );
    });
  }

  Future<int> deleteTodo(Todo todo) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.delete(
        AppKeys.dbTable,
        where: 'id = ?',
        whereArgs: [todo.id],
      );
    });
  }
}
