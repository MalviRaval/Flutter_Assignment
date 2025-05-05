import 'package:flutter/material.dart';
import 'package:module_5/bloc/task_event.dart';

abstract class TaskState {}

class TasksState extends TaskState {
  final DateTime? pickedDate;
  final TimeOfDay? pickedTime;
  final TaskPriority selectedPriority;
  final List<Map> tasks;

  TasksState({
    required this.pickedDate,
    required this.pickedTime,
    required this.selectedPriority,
    required this.tasks,
  });

  factory TasksState.initial() {
    return TasksState(
      tasks: [],
      pickedDate: null,
      pickedTime: null,
      selectedPriority: TaskPriority.high,
    );
  }

  TasksState copyWith({
    DateTime? pickedDate,
    TimeOfDay? pickedTime,
    TaskPriority? selectedPriority,
    List<Map>? tasks,
  }) {
    return TasksState(
      pickedDate: pickedDate ?? this.pickedDate,
      pickedTime: pickedTime ?? this.pickedTime,
      tasks: tasks ?? this.tasks,
      selectedPriority: selectedPriority ?? this.selectedPriority,
    );
  }
}

class DeleteTaskState extends TaskState {
  final int id;
  DeleteTaskState({required this.id});
}

class UpdateTaskState extends TaskState {
  final int id;
  final Map updatedTask;
  UpdateTaskState({required this.id, required this.updatedTask});
}
