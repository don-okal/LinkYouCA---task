import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:task/core/errors/failure.dart';
import 'package:task/features/home/data/model/todo_model.dart';

import '../../../../core/errors/exceptions.dart';
import '../../domain/repo/home_repo.dart';
import '../model/delete_task_model.dart';
import '../remote/home_remote_data_source.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource homeremoteDataSource;

  HomeRepoImpl(this.homeremoteDataSource);

  @override
  Future<Either<ServerFailure, ToDoModel>> getToDo(String sqlKey) async {
    try {
      final result = await homeremoteDataSource.getToDo(sqlKey);
      return right(result);
    } on AppExceptions catch (e) {
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    } on DioException catch (e) {
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<ServerFailure, DeleteTaskModel>> addToDo(String sqlKey) async {
    try {
      final result = await homeremoteDataSource.addToDo(sqlKey);
      return right(result);
    } on DioException catch (dioError) {
      return left(
        ServerFailure.fromDiorError(
          dioError,
        ),
      );
    } on Exception catch (e) {
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<ServerFailure, DeleteTaskModel>> deleteToDo(
    String sqlKey,
  ) async {
    try {
      final result = await homeremoteDataSource.deleteToDo(sqlKey);
      return right(result);
    } on DioException catch (dioError) {
      return left(
        ServerFailure.fromDiorError(
          dioError,
        ),
      );
    } on Exception catch (e) {
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<ServerFailure, ToDoModel>> updateToDo(
      String sqlKey, Map<String, dynamic> data) {
    throw UnimplementedError();
  }
}
