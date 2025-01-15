import '../../data/model/delete_task_model.dart';

abstract class DeleteState {}

final class DeleteInitial extends DeleteState {}

final class DeleteLoading extends DeleteState {}

final class DeleteFailure extends DeleteState {
  final String errorMessage;

  DeleteFailure(this.errorMessage);
}

final class DeleteSuccess extends DeleteState {
  final DeleteTaskModel deleteTaskModel;

  DeleteSuccess(this.deleteTaskModel);
}
