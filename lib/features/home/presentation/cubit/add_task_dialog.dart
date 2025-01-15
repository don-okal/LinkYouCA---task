import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/features/home/presentation/cubit/add_cubit.dart';
import 'package:task/features/home/presentation/cubit/home_cubit.dart';
import 'package:task/features/home/presentation/cubit/home_state.dart';

class AddTaskDialogCubit extends Cubit<void> {
  AddTaskDialogCubit() : super(null);

  /// Method to show the Add Task dialog
  Future<void> showAddTaskDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (dialogContext) {
        final addTaskCubit = context.read<AddTaskCubit>();
        return AlertDialog(
          title: const Text('Add New Task'),
          content: TextField(
            controller: addTaskCubit.textEditingController,
            decoration: const InputDecoration(
              hintText: 'Enter task name',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                final homeCubit = context.read<HomeCubit>();
                if (homeCubit.state is HomeSuccess) {
                  final tasks =
                      (homeCubit.state as HomeSuccess).toDoModel.todos;
                  addTaskCubit.addTask(tasks!.length);
                }
                Navigator.pop(dialogContext);
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
