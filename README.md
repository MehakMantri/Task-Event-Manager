````
# Task & Event Manager (Flutter)

A simple mobile app built using Flutter that allows a user to manage tasks and events locally. The app uses a bottom navigation bar with two sections: **Tasks** and **Events**. Both sections support creating, listing, updating, and deleting data.

All data is stored locally on the device using `SharedPreferences`.

---

## ✨ Features

### 📝 Tasks
- View list of tasks
- Add a new task with title + optional description
- Mark task as completed/uncompleted
- Edit existing task
- Delete task
- Local storage persistence

### 📅 Events
- View list of events
- Add event with title, date and time pickers
- Edit existing event
- Delete event
- Date & time formatting using `intl`
- Local storage persistence

---

## 🛠️ Tech Stack

- **Flutter**
- **Provider** (State Management)
- **SharedPreferences** (Local Storage)
- **intl** (Date Formatting)

---

## 🧠 State Management

The project uses **Provider + ChangeNotifier** pattern.

- `TaskProvider` manages all task-related operations
- `EventProvider` manages all event-related operations
- UI reacts to changes with `notifyListeners()`

This keeps logic outside the widgets and makes code modular and testable.

---

## 💾 Local Storage Method

`SharedPreferences` stores:

- `tasks` → JSON encoded list of task objects
- `events` → JSON encoded list of event objects

When the app starts, the data is loaded into Provider from storage.

---

## 📦 Project Structure

```

lib/
main.dart
models/
task.dart
event.dart
services/
local_storage_service.dart
providers/
task_provider.dart
event_provider.dart
screens/
home_screen.dart
tasks/
tasks_screen.dart
add_edit_task_screen.dart
events/
events_screen.dart
add_edit_event_screen.dart

````

---

## ▶️ How to Build & Run

### Requirements
- Flutter SDK installed
- Android emulator or device
- VS Code or Android Studio

### Clone repository
```bash
git clone https://github.com/YOUR_USERNAME/task_event_manager.git
cd task_event_manager
````

Install dependencies:

```bash
flutter pub get
```

Run app:

```bash
flutter run
```

---

## 📱 Build APK (Debug)

```bash
flutter build apk --debug
```

APK output location:

```
build/app/outputs/flutter-apk/app-debug.apk
```

You can also use the `app-debug.apk` provided in the repository under `/apk/`.

---

````
