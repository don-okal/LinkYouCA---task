import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:task/features/home/data/model/todo_model.dart';
import 'package:task/features/home/presentation/cubit/home_state.dart';

import '../../../../core/services/use_case.dart';
import '../../data/remote/home_local_storage_data_source.dart';
import '../../domain/use_case/home_use_case.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeUseCase, this.localStorageService)
      : super(
          HomeInitial(),
        );
  final LocalStorageService localStorageService;

  final HomeUseCase homeUseCase;
  ToDoModel toDoModel = ToDoModel();

  Future<void> fetchHomeData() async {
    emit(HomeLoading(toDoModel: toDoModel));

    try {
      final localData = await localStorageService.getTodos();
      if (localData != null) {
        toDoModel = localData;
        emit(HomeSuccess(toDoModel: toDoModel));
        return;
      }

      final result = await homeUseCase.call(
        Param(
          loading: true,
          sqlKey: 'todos',
        ),
      );

      result.fold(
        (error) {
          emit(HomeFailure(error.toString()));
        },
        (data) async {
          toDoModel = data;

          await localStorageService.saveTodos(toDoModel);
          emit(HomeSuccess(toDoModel: toDoModel));
        },
      );
    } catch (e) {
      if (e is DioException) {
        emit(
          HomeFailure(
            'Server error: ${e.message}',
          ),
        );
      }
    }
  }
}
