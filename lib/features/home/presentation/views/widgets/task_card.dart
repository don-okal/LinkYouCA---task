import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:task/core/utils/size_utils.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../injection_controller.dart';
import '../../../data/remote/home_local_storage_data_source.dart';
import '../../../domain/use_case/home_use_case.dart';
import '../../cubit/delete_cubit.dart';
import '../../cubit/delete_state.dart';
import '../../cubit/home_cubit.dart';
import '../../cubit/task_cubit.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final int index;
  final bool iscomplete;

  const TaskCard({
    super.key,
    required this.title,
    required this.index,
    required this.iscomplete,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>(
          create: (_) => HomeCubit(
            InjectionController().getIt.get<HomeUseCase>(),
            LocalStorageService(),
          ),
        ),
        BlocProvider<TaskCubit>(
          create: (_) => TaskCubit(false),
        ),
        BlocProvider<DeleteCubit>(
          create: (context) => DeleteCubit(
            InjectionController().getIt.get<DeleteTodosUseCase>(),
          ),
        ),
      ],
      child: BlocBuilder<DeleteCubit, DeleteState>(
        builder: (context, isCompleted) {
          final taskCubit = context.read<TaskCubit>();
          final deleteCubit = context.read<DeleteCubit>();
          final homeCubit = context.read<HomeCubit>();

          return Slidable(
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                Row(
                  children: [
                    SizedBox(width: getHorizontalSize(30)),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: getVerticalSize(35),
                        width: getVerticalSize(35),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.black,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.edit,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: getHorizontalSize(15)),
                    GestureDetector(
                      onTap: () {
                        deleteCubit.deleteTodo(index);
                      },
                      child: BlocConsumer<DeleteCubit, DeleteState>(
                        listener: (context, state) {
                          if (state is DeleteSuccess) {
                            deleteCubit.deleteTodo(index);
                            homeCubit.fetchHomeData();
                          } else if (state is DeleteFailure) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Error: ${state.errorMessage}',
                                ),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        },
                        builder: (context, state) {
                          if (state is DeleteLoading) {
                            return Container(
                              height: getVerticalSize(35),
                              width: getVerticalSize(35),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.red,
                              ),
                              child: const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              ),
                            );
                          }
                          return Container(
                            height: getVerticalSize(35),
                            width: getVerticalSize(35),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.red,
                            ),
                            child: const Icon(
                              Icons.delete,
                              color: AppColors.white,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getHorizontalSize(16),
              ),
              child: InkWell(
                onTap: taskCubit.toggleCompletion,
                borderRadius: BorderRadius.circular(12.0),
                child: Card(
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  color: iscomplete ? Colors.green[50] : Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          iscomplete
                              ? Icons.check_circle
                              : Icons.circle_outlined,
                          color: iscomplete ? Colors.green : Colors.grey,
                          size: 24.0,
                        ),
                        const SizedBox(width: 16.0),
                        Expanded(
                          child: Text(
                            title,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              color: iscomplete ? Colors.green : Colors.black87,
                              decoration: iscomplete
                                  ? TextDecoration.lineThrough
                                  : null,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
