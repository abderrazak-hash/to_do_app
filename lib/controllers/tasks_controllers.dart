import 'package:flutter/material.dart';
import 'package:todo_app/database/database.dart';
import 'package:todo_app/models/task.dart';

class TasksController extends ChangeNotifier {
  List<Task> tasks = [];

  void loadTasks() async {
    tasks = await TasksDB.getTasks();
    notifyListeners();
  }

  TasksController() {
    loadTasks();
  }

  List<Task> get doneTasks => tasks.where((task) => task.isDone).toList();

  List<Task> get undoneTasks => tasks.where((task) => !task.isDone).toList();

  void addTask(Task task) async {
    tasks.add(task);
    notifyListeners();
    await TasksDB.addTask(task.title, task.isDone ? 1 : 0);
  }

  void deleteTask(Task task) async {
    tasks.remove(task);
    notifyListeners();
    await TasksDB.deleteTask(task.title, task.isDone ? 1 : 0);
  }

  void doTask(Task task) async {
    task.isDone = true;
    notifyListeners();
    await TasksDB.checkTask(task.title, task.isDone ? 1 : 0);
  }
}
