import 'package:dartz/dartz.dart';
import 'package:task/core/errors/failure.dart';

import '../../data/model/delete_task_model.dart';
import '../../data/model/todo_model.dart';

abstract class HomeRepo {
  Future<Either<ServerFailure, ToDoModel>> getToDo(String sqlKey);
  Future<Either<ServerFailure, ToDoModel>> updateToDo(
      String sqlKey, Map<String, dynamic> data);
  Future<Either<ServerFailure, DeleteTaskModel>> deleteToDo(
    String sqlKey,
  );
  Future<Either<ServerFailure, DeleteTaskModel>> addToDo(String sqlKey);
}
