import 'package:sqflite/sqflite.dart';

class Taskdatabase {
  static final Taskdatabase _instance = Taskdatabase._internal();
  factory Taskdatabase() {
    return _instance;
  }
  Taskdatabase._internal();

  Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database!;
    final dbPath = await getDatabasesPath();

    final path = '$dbPath/task.db';
    //final path = join(dbPath, 'task.db');
    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute('''
         CREATE TABLE tasks(
           id INTEGER PRIMARY KEY AUTOINCREMENT,
           name TEXT,
           description TEXT,
           timestamp INTEGER,
           priority TEXT
         )
       ''');
      },
    );
    return _database!;
  }

  Future<void> insertTask(Map<String, dynamic> task) async {
    final db = await database;
    await db?.insert('tasks', task);
  }

  Future<List<Map<String, dynamic>>> getTasks() async {
    final db = await database;
    final List<Map<String, dynamic>> tasks = await db!.query('tasks');
    return tasks;
  }

  Future<void> deleteTask(int id) async {
    final db = await database;
    await db?.delete('tasks', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> updateTask(int id, Map<String, dynamic> task) async {
    final db = await database;
    await db?.update('tasks', task, where: 'id = ?', whereArgs: [id]);
  }

  Future<void> closeDatabase() async {
    final db = await database;
    await db?.close();
  }
}
