import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:module_5/bloc/task_event.dart';
import 'package:module_5/bloc/task_state.dart';
import 'package:module_5/helper/TaskDatabase.dart';

class TaskBloc extends Bloc<TaskEvent, TasksState> {
  TaskBloc() : super(TasksState.initial()) {
    on<PickDateEvent>((event, emit) {
      emit(state.copyWith(pickedDate: event.date));
    });

    on<PickTimeEvent>((event, emit) {
      emit(state.copyWith(pickedTime: event.time));
    });

    on<PickPriorityEvent>((event, emit) {
      emit(state.copyWith(selectedPriority: event.priority));
    });

    on<CreateTaskEvent>((event, emit) async {
      final newTask = {
        'name': event.name,
        'description': event.description,
        'timestamp': event.timestamp,
        'priority': event.priority.label, // assuming priority is enum
      };
      await Taskdatabase().insertTask(newTask);

      final allTasks = await Taskdatabase().getTasks();

      emit(state.copyWith(tasks: allTasks));
    });

    on<LoadTasksEvent>((event, emit) async {
      final allTasks = await Taskdatabase().getTasks();
      emit(state.copyWith(tasks: allTasks));
    });

    on<UpdateTaskEvent>((event, emit) async {
      await Taskdatabase().updateTask(event.id, event.updatedTask);
      final allTasks = await Taskdatabase().getTasks();
      emit(state.copyWith(tasks: allTasks));
    });

    on<DeleteTaskEvent>((event, emit) {
      Taskdatabase().deleteTask(event.id);
      final updateTasks =
          state.tasks.where((task) => task['id'] != event.id).toList();
      emit(state.copyWith(tasks: updateTasks));
    });
  }
}
