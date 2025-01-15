import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:task/core/services/use_case.dart';
import 'package:task/features/home/data/model/delete_task_model.dart';
import 'package:task/features/home/domain/use_case/home_use_case.dart';
import 'package:task/features/home/presentation/cubit/add_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  TextEditingController textEditingController = TextEditingController();
  final AddTodosUseCase addTodosUseCase;
  DeleteTaskModel deleteTaskModel = DeleteTaskModel();
  AddTaskCubit(this.addTodosUseCase) : super(AddTaskInitial());

  Future<void> addTask(int index) async {
    emit(AddTaskLoading());

    try {
      final result = await addTodosUseCase.call(
        AddTodoParam(
          loading: true,
          sqlKey: 'todos/$index', task: textEditingController.text,
          // taskId: index,
        ),
      );

      result.fold(
        (error) {
          emit(
            AddTaskFailure(
              error.toString(),
            ),
          );
        },
        (data) {
          emit(
            AddTaskSuccess(
              deleteTaskModel: deleteTaskModel,
            ),
          );
        },
      );
    } catch (e) {
      emit(
        AddTaskFailure(
          'An unexpected error occurred.',
        ),
      );
    }
  }
}
