import '../../data/model/delete_task_model.dart';

abstract class AddTaskState {}

class AddTaskInitial extends AddTaskState {}

class AddTaskLoading extends AddTaskState {}

class AddTaskSuccess extends AddTaskState {
  final DeleteTaskModel deleteTaskModel;

  AddTaskSuccess({required this.deleteTaskModel});
}

class AddTaskFailure extends AddTaskState {
  final String errorMessage;

  AddTaskFailure(this.errorMessage);
}
