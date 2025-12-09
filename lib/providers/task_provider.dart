import 'package:flutter/foundation.dart';
import '../models/task.dart';
import '../services/local_storage_service.dart';

class TaskProvider extends ChangeNotifier {
  final LocalStorageService _storageService = LocalStorageService();

  List<Task> _tasks = [];
  List<Task> get tasks => _tasks;

  TaskProvider() {
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    final raw = await _storageService.loadTasks();
    _tasks = raw.map((e) => Task.fromJson(e)).toList();
    notifyListeners();
  }

  Future<void> _persist() async {
    await _storageService.saveTasks(_tasks.map((t) => t.toJson()).toList());
  }

  Future<void> addTask(Task task) async {
    _tasks.add(task);
    await _persist();
    notifyListeners();
  }

  Future<void> updateTask(int index, Task updated) async {
    _tasks[index] = updated;
    await _persist();
    notifyListeners();
  }

  Future<void> toggleTaskStatus(int index) async {
    _tasks[index].isCompleted = !_tasks[index].isCompleted;
    await _persist();
    notifyListeners();
  }

  Future<void> deleteTask(int index) async {
    _tasks.removeAt(index);
    await _persist();
    notifyListeners();
  }
}
