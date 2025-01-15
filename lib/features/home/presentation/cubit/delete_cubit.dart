import 'package:bloc/bloc.dart';
import 'package:task/features/home/presentation/cubit/delete_state.dart';

import '../../../../core/services/use_case.dart';
import '../../data/model/delete_task_model.dart';
import '../../domain/use_case/home_use_case.dart';

class DeleteCubit extends Cubit<DeleteState> {
  DeleteCubit(this.deleteTodosUseCase)
      : super(
          DeleteInitial(),
        );

  final DeleteTodosUseCase deleteTodosUseCase;
  DeleteTaskModel deleteTaskModel = DeleteTaskModel();

  Future<void> deleteTodo(int index) async {
    emit(
      DeleteLoading(),
    );

    try {
      final result = await deleteTodosUseCase.call(
        DeleteTodoParam(
          loading: true,
          sqlKey: 'todos/$index',
          // taskId: index,
        ),
      );

      result.fold(
        (error) {
          emit(
            DeleteFailure(
              error.toString(),
            ),
          );
        },
        (data) {
          emit(
            DeleteSuccess(
              deleteTaskModel,
            ),
          );
        },
      );
    } catch (e) {
      emit(
        DeleteFailure(
          'An unexpected error occurred.',
        ),
      );
    }
  }
}
