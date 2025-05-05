import 'package:flutter/material.dart';

abstract class TaskEvent {}

class PickDateEvent extends TaskEvent {
  final DateTime date;
  PickDateEvent(this.date);
}

class PickTimeEvent extends TaskEvent {
  final TimeOfDay time;
  PickTimeEvent(this.time);
}

class PickPriorityEvent extends TaskEvent {
  final TaskPriority priority;

  PickPriorityEvent(this.priority);
}

class DeleteTaskEvent extends TaskEvent {
  final int id;
  DeleteTaskEvent(this.id);
}

class UpdateTaskEvent extends TaskEvent {
  final int id;
  final Map<String,dynamic> updatedTask;
  UpdateTaskEvent({required this.id, required this.updatedTask});
}

class LoadTasksEvent extends TaskEvent {}

class CreateTaskEvent extends TaskEvent {
  final String name;
  final String description;
  final int timestamp;
  final TaskPriority priority;

  CreateTaskEvent({
    required this.name,
    required this.description,
    required this.timestamp,
    required this.priority,
  });
}

enum TaskPriority { high, average, low }

extension TaskPriorityExtension on TaskPriority {
  String get label {
    switch (this) {
      case TaskPriority.high:
        return 'High';
      case TaskPriority.average:
        return 'Average';
      case TaskPriority.low:
        return 'Low';
    }
  }

  static TaskPriority fromLabel(String label) {
    return TaskPriority.values.firstWhere((e) => e.label == label);
  }

   
}
