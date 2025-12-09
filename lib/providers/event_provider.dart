import 'package:flutter/foundation.dart';
import '../models/event.dart';
import '../services/local_storage_service.dart';

class EventProvider extends ChangeNotifier {
  final LocalStorageService _storageService = LocalStorageService();

  List<Event> _events = [];
  List<Event> get events => _events;

  EventProvider() {
    _loadEvents();
  }

  Future<void> _loadEvents() async {
    final raw = await _storageService.loadEvents();
    _events = raw.map((e) => Event.fromJson(e)).toList();
    // Optional: sort by date-time
    _events.sort((a, b) => a.dateTime.compareTo(b.dateTime));
    notifyListeners();
  }

  Future<void> _persist() async {
    await _storageService.saveEvents(_events.map((e) => e.toJson()).toList());
  }

  Future<void> addEvent(Event event) async {
    _events.add(event);
    _events.sort((a, b) => a.dateTime.compareTo(b.dateTime));
    await _persist();
    notifyListeners();
  }

  Future<void> updateEvent(int index, Event updated) async {
    _events[index] = updated;
    _events.sort((a, b) => a.dateTime.compareTo(b.dateTime));
    await _persist();
    notifyListeners();
  }

  Future<void> deleteEvent(int index) async {
    _events.removeAt(index);
    await _persist();
    notifyListeners();
  }
}
