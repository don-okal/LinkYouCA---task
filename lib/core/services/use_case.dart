import 'package:dartz/dartz.dart';

import '../errors/failure.dart';

abstract class UseCase<OutPut, Params> {
  Future<Either<ServerFailure, OutPut>> call(Params params);
}

abstract class AddTodoUseCase<OutPut, AddUserParam> {
  Future<Either<ServerFailure, OutPut>> call(AddUserParam params);
}

abstract class EditTodoUseCase<OutPut, EditUserParam> {
  Future<Either<ServerFailure, OutPut>> call(EditUserParam params);
}

abstract class DeleteTodoUseCase<OutPut, DeleteUserParam> {
  Future<Either<ServerFailure, OutPut>> call(DeleteUserParam params);
}

class Param {
  final String sqlKey;
  bool loading;

  Param({
    required this.loading,
    required this.sqlKey,
  });
}

class AddTodoParam {
  bool loading;
  final String task;

  final String sqlKey;

  AddTodoParam({
    required this.loading,
    required this.sqlKey,
    required this.task,
  });
}

class EditTodoParam {
  bool loading;
  final String sqlKey;
  final int userId;
  final Map<String, dynamic> updatedUser;

  EditTodoParam({
    required this.loading,
    required this.sqlKey,
    required this.userId,
    required this.updatedUser,
  });
}

class DeleteTodoParam {
  bool loading;
  final String sqlKey;
  // final int taskId;

  DeleteTodoParam({
    required this.loading,
    required this.sqlKey,
    // required this.taskId,
  });
}
