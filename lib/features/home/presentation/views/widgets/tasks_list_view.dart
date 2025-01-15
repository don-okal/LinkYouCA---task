import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/features/home/presentation/views/widgets/task_card.dart';

import '../../../../../core/utils/size_utils.dart';
import '../../../data/model/todo_model.dart';
import '../../cubit/task_cubit.dart';

class TasksListView extends StatelessWidget {
  const TasksListView({
    super.key,
    required this.tasks,
  });

  final List<Todo>? tasks;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        final task = tasks?[index];
        return BlocProvider(
          create: (_) => TaskCubit(false),
          child: TaskCard(
            title: task?.todo ?? '',
            index: index,
            iscomplete: task?.completed ?? false,
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: getVerticalSize(16),
        );
      },
      itemCount: tasks?.length ?? 0,
    );
  }
}
