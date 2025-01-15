import '../../data/model/todo_model.dart';

abstract class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {
  final ToDoModel toDoModel;

  HomeLoading({required this.toDoModel});
}

final class HomeFailure extends HomeState {
  final String errMessage;

  HomeFailure(this.errMessage);
}

final class HomeSuccess extends HomeState {
  final ToDoModel toDoModel;

  HomeSuccess({required this.toDoModel});
}
