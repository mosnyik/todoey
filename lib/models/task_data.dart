import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:todoey/models/task.dart';

class TaskData extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(name: 'This is task one'),
    Task(name: 'This is task two'),
    Task(name: 'This is task three'),
    Task(name: 'This is task four'),
  ];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String newTask) {
    final task = Task(name: newTask);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleTaskStatus();
    notifyListeners();
  }

  void deleteTask(Task newTask) {
    _tasks.remove(newTask);
    notifyListeners();
  }
}
