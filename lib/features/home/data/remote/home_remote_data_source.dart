import 'dart:convert';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/services/api_service.dart';
import '../model/delete_task_model.dart';
import '../model/todo_model.dart';

abstract class HomeRemoteDataSource {
  Future<ToDoModel> getToDo(String sqlKey);
  Future<ToDoModel> updateToDo(String sqlKey, Map<String, dynamic> data);
  Future<DeleteTaskModel> addToDo(String sqlKey);
  Future<DeleteTaskModel> deleteToDo(String sqlKey);
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  ApiService apiService;
  HomeRemoteDataSourceImpl(this.apiService);
  @override
  Future<ToDoModel> getToDo(String sqlKey) async {
    final result = await apiService.getRequest(
      sqlKey,
    );
    if (result.statusCode == 200) {
      return toDoModelFromJson(
        jsonEncode(
          result.data,
        ),
      );
    } else {
      throw AppExceptions(
        errorMessage: result.data['message'] ?? 'Error',
      );
    }
  }

  @override
  Future<DeleteTaskModel> addToDo(String sqlKey) async {
    final result = await apiService.post(sqlKey);
    if (result.statusCode == 200) {
      return DeleteTaskModel.fromJson(
        result.data.map(
          (x) => DeleteTaskModel.fromJson(x),
        ),
      );
    } else {
      throw AppExceptions(
        errorMessage: result.data['message'] ?? 'Error',
      );
    }
  }

  @override
  Future<DeleteTaskModel> deleteToDo(String sqlKey) async {
    final result = await apiService.deleteRequest(sqlKey);
    if (result.statusCode == 200) {
      return DeleteTaskModel.fromJson(
        result.data.map(
          (x) => DeleteTaskModel.fromJson(x),
        ),
      );
    } else {
      throw AppExceptions(
        errorMessage: result.data['message'] ?? 'Error',
      );
    }
  }

  @override
  Future<ToDoModel> updateToDo(String sqlKey, Map<String, dynamic> data) {
    throw UnimplementedError();
  }
}
