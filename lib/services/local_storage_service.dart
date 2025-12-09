import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static const String _tasksKey = 'tasks';
  static const String _eventsKey = 'events';

  LocalStorageService._internal();
  static final LocalStorageService _instance = LocalStorageService._internal();
  factory LocalStorageService() => _instance;

  Future<SharedPreferences> get _prefs async =>
      await SharedPreferences.getInstance();

  // TASKS
  Future<List<Map<String, dynamic>>> loadTasks() async {
    final prefs = await _prefs;
    final jsonString = prefs.getString(_tasksKey);
    if (jsonString == null) return [];
    final List<dynamic> list = jsonDecode(jsonString);
    return list.map((e) => Map<String, dynamic>.from(e)).toList();
  }

  Future<void> saveTasks(List<Map<String, dynamic>> tasks) async {
    final prefs = await _prefs;
    final jsonString = jsonEncode(tasks);
    await prefs.setString(_tasksKey, jsonString);
  }

  // EVENTS
  Future<List<Map<String, dynamic>>> loadEvents() async {
    final prefs = await _prefs;
    final jsonString = prefs.getString(_eventsKey);
    if (jsonString == null) return [];
    final List<dynamic> list = jsonDecode(jsonString);
    return list.map((e) => Map<String, dynamic>.from(e)).toList();
  }

  Future<void> saveEvents(List<Map<String, dynamic>> events) async {
    final prefs = await _prefs;
    final jsonString = jsonEncode(events);
    await prefs.setString(_eventsKey, jsonString);
  }
}
