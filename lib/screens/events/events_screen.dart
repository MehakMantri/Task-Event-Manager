import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../providers/event_provider.dart';
import 'add_edit_event_screen.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final eventProvider = Provider.of<EventProvider>(context);
    final dateFormat = DateFormat('EEE, dd MMM yyyy – hh:mm a');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Events'),
      ),
      body: eventProvider.events.isEmpty
          ? const Center(child: Text('No events yet. Add one!'))
          : ListView.builder(
              itemCount: eventProvider.events.length,
              itemBuilder: (context, index) {
                final event = eventProvider.events[index];
                return ListTile(
                  leading: const Icon(Icons.event),
                  title: Text(event.title),
                  subtitle: Text(dateFormat.format(event.dateTime)),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => AddEditEventScreen(
                                isEditing: true,
                                index: index,
                                existingEvent: event,
                              ),
                            ),
                          );
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          eventProvider.deleteEvent(index);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const AddEditEventScreen(isEditing: false),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
