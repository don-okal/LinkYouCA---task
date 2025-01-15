import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:task/core/utils/size_utils.dart';
import 'package:task/features/home/presentation/views/widgets/tasks_list_view.dart';
import 'package:task/injection_controller.dart';

import '../../data/remote/home_local_storage_data_source.dart';
import '../../domain/use_case/home_use_case.dart';
import '../cubit/add_cubit.dart';
import '../cubit/add_task_dialog.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>(
          create: (_) => HomeCubit(
            InjectionController().getIt.get<HomeUseCase>(),
            LocalStorageService(),
          )..fetchHomeData(),
        ),
        BlocProvider<AddTaskCubit>(
          create: (_) => AddTaskCubit(
            InjectionController().getIt.get<AddTodosUseCase>(),
          ),
        ),
        BlocProvider<AddTaskDialogCubit>(
          create: (_) => AddTaskDialogCubit(),
        ),
      ],
      child: Scaffold(
        floatingActionButton: Builder(
          builder: (context) {
            return FloatingActionButton(
              child: Icon(
                Icons.add,
                size: getSize(28),
              ),
              onPressed: () {
                context.read<AddTaskDialogCubit>().showAddTaskDialog(context);
              },
            );
          },
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('HomeView'),
          centerTitle: true,
        ),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, homeState) {
            if (homeState is HomeLoading) {
              final tasks = homeState.toDoModel.todos;

              return Skeletonizer(
                enabled: true,
                child: TasksListView(tasks: tasks),
              );
            } else if (homeState is HomeFailure) {
              return Center(
                child: Text(homeState.errMessage),
              );
            } else if (homeState is HomeSuccess) {
              final tasks = homeState.toDoModel.todos;
              return RefreshIndicator(
                onRefresh: () {
                  context.read<HomeCubit>().fetchHomeData();
                  return Future.value();
                },
                child: TasksListView(tasks: tasks),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
