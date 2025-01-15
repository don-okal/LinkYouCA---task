import 'package:dartz/dartz.dart';
import 'package:task/core/errors/failure.dart';
import 'package:task/core/services/use_case.dart';
import 'package:task/features/home/data/model/todo_model.dart';

import '../../data/model/delete_task_model.dart';
import '../repo/home_repo.dart';

class HomeUseCase extends UseCase<ToDoModel, Param> {
  final HomeRepo homeRepo;

  HomeUseCase(this.homeRepo);
  @override
  Future<Either<ServerFailure, ToDoModel>> call(Param params) async {
    params.loading = false;
    final result = homeRepo.getToDo(params.sqlKey);
    result.then((value) {
      params.loading = true;
    });
    return result;
  }
}

class DeleteTodosUseCase
    extends DeleteTodoUseCase<DeleteTaskModel, DeleteTodoParam> {
  final HomeRepo homeRepo;
  DeleteTodosUseCase(this.homeRepo);

  @override
  Future<Either<ServerFailure, DeleteTaskModel>> call(
      DeleteTodoParam params) async {
    params.loading = true;
    final result = homeRepo.deleteToDo(params.sqlKey);
    result.then(
      (value) {
        params.loading = false;
      },
    );
    return result;
  }
}

class AddTodosUseCase extends AddTodoUseCase<DeleteTaskModel, AddTodoParam> {
  final HomeRepo homeRepo;
  AddTodosUseCase(this.homeRepo);

  @override
  Future<Either<ServerFailure, DeleteTaskModel>> call(
      AddTodoParam params) async {
    params.loading = true;
    final result = homeRepo.addToDo(params.sqlKey);
    result.then(
      (value) {
        params.loading = false;
      },
    );
    return result;
  }
}
