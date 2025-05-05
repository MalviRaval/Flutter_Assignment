import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:module_5/bloc/task_bloc.dart';
import 'package:module_5/bloc/task_event.dart';
import 'package:module_5/bloc/task_state.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  Color getPriorityColor(String priority) {
    switch (priority.toLowerCase()) {
      case 'high':
        return Colors.red;
      case 'average':
        return Colors.blue;
      case 'low':
        return Colors.green;
      default:
        return Colors.grey.shade300;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent[200],
        title: Text(
          'Task',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: BlocBuilder<TaskBloc, TasksState>(
        builder: (context, state) {
          if (state.tasks.isEmpty) {
            return Center(child: Text('No tasks available.'));
          }
          return ListView.builder(
            itemCount: state.tasks.length,
            itemBuilder: (context, index) {
              final task = state.tasks[index];
              final timestamp = task['timestamp'] as int;
              final date = DateTime.fromMillisecondsSinceEpoch(timestamp);

              return ListTile(
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        context.read<TaskBloc>().add(
                          DeleteTaskEvent(task['id']),
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        _createOrEditTask(context, task: task, index: index);
                      },
                    ),
                  ],
                ),
                onTap: () {
                  // Handle task tap if needed
                },
                leading: Icon(Icons.task_alt),
                title: Text(task['name'] ?? 'Unnamed'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(task['description'] ?? ''),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: getPriorityColor(task['priority']),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'Priority: ${task['priority']}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text("Due: ${date.toLocal().toString().split('.')[0]}"),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _createOrEditTask(context);
        },
        tooltip: 'Create Task',
        child: const Icon(Icons.add),
      ),
    );
  }

  _createOrEditTask(BuildContext context, {Map? task, int? index}) {
    final isUpdate = task != null;
    print('isUpdate: $isUpdate');

    return showDialog(
      context: context,
      builder: (context) {
        TextEditingController taskNameController = TextEditingController(
          text: task?['name'] ?? '',
        );
        TextEditingController taskDescController = TextEditingController(
          text: task?['description'] ?? '',
        );

        //set initial priority
        //  print( task!['priority']);
        TaskPriority selectedPriority =
            isUpdate
                ? TaskPriority.values.firstWhere(
                  (priority) =>
                      priority.label.toLowerCase() ==
                      task['priority'].toString().toLowerCase(),
                )
                : TaskPriority.high;
        context.read<TaskBloc>().add(PickPriorityEvent(selectedPriority));

        //        context.read<TaskBloc>().add(
        //   PickPriorityEvent(
        //     isEditing ? task['priority'] : TaskPriority.high,
        //   ),
        // );

        if (isUpdate) {
          final timeStamp = task['timestamp'] as int;
          final date = DateTime.fromMillisecondsSinceEpoch(timeStamp);
          context.read<TaskBloc>().add(PickDateEvent(date));
          context.read<TaskBloc>().add(
            PickTimeEvent(TimeOfDay(hour: date.hour, minute: date.minute)),
          );
        }

        return BlocBuilder<TaskBloc, TasksState>(
          builder: (context, state) {
            return AlertDialog(
              title: Text(isUpdate ? 'Update Task' : 'Create Task'),
              content: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: taskNameController,
                      decoration: InputDecoration(
                        hintText: 'Task Name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: taskDescController,
                      maxLines: 5,
                      decoration: InputDecoration(
                        hintText: 'Task Description',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      spacing: 10,
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            final date = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100),
                            );
                            if (date != null) {
                              context.read<TaskBloc>().add(PickDateEvent(date));
                            }
                          },
                          child: Text('Select Date'),
                        ),
                        if (state.pickedDate != null)
                          Text(
                            'Date: ${state.pickedDate!.toLocal().toString().split(' ')[0]}',
                          ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      spacing: 10,
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            final time = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );
                            if (time != null) {
                              context.read<TaskBloc>().add(PickTimeEvent(time));
                            }
                          },
                          child: Text('Select Time'),
                        ),
                        if (state.pickedTime != null)
                          Text('Time: ${state.pickedTime!.format(context)}'),
                      ],
                    ),
                    SizedBox(height: 10),
                    DropdownButton<TaskPriority>(
                      value: state.selectedPriority,
                      items:
                          TaskPriority.values.map((priority) {
                            return DropdownMenuItem(
                              value: priority,
                              child: Text(priority.label),
                            );
                          }).toList(),
                      onChanged: (value) {
                        if (value != null) {
                          context.read<TaskBloc>().add(
                            PickPriorityEvent(value),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (state.pickedDate != null && state.pickedTime != null) {
                      final selectedDateTime = DateTime(
                        state.pickedDate!.year,
                        state.pickedDate!.month,
                        state.pickedDate!.day,
                        state.pickedTime!.hour,
                        state.pickedTime!.minute,
                      );
                      if (isUpdate) {
                        context.read<TaskBloc>().add(
                          UpdateTaskEvent(
                            id: task['id'],
                            updatedTask: {
                              'name': taskNameController.text,
                              'description': taskDescController.text,
                              'timestamp':
                                  selectedDateTime.millisecondsSinceEpoch,
                              'priority': state.selectedPriority.label,
                            },
                          ),
                        );
                      } else {
                        context.read<TaskBloc>().add(
                          CreateTaskEvent(
                            name: taskNameController.text,
                            description: taskDescController.text,
                            timestamp: selectedDateTime.millisecondsSinceEpoch,
                            priority: state.selectedPriority,
                          ),
                        );
                      }
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text('Create'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
