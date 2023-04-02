import 'package:sqflite/sqflite.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'dart:io';

import 'package:todo_app/models/task.dart';

class TasksDB {
  static late Database _database;
  static Future<Database> getData() async {
    var dbDir = await getDatabasesPath();
    var dbPath = join(dbDir, "todo.db");
    var exist = await databaseExists(dbPath);
    if (!exist) {
      ByteData data = await rootBundle.load("assets/todo.db");
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(dbPath).writeAsBytes(bytes);
    }
    return await openDatabase(dbPath);
  }

  static Future<List<Task>> getTasks() async {
    _database = await getData();
    final List<Map<String, dynamic>> tasks = await _database.query('tasks');
    return List.generate(tasks.length, (i) {
      return Task(
        title: tasks[i]['title'],
        isDone: tasks[i]['isDone'] == 1 ? true : false,
      );
    });
  }

  static Future<void> checkTask(String title, int done) async {
    _database = await getData();
    _database
        .execute('UPDATE tasks SET isDone = "$done" WHERE title = "$title"');
  }

  static Future<void> addTask(String title, int done) async {
    _database = await getData();
    _database
        .execute('INSERT INTO tasks (title, isDone) VALUES("$title", "$done")');
  }

  static Future<void> deleteTask(String title, int done) async {
    _database = await getData();
    _database.execute('DELETE FROM tasks WHERE title = "$title"');
  }
}
