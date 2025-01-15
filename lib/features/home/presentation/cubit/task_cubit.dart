import 'package:bloc/bloc.dart';

class TaskCubit extends Cubit<bool> {
  TaskCubit(bool initialState) : super(false);

  void toggleCompletion() => emit(!state);
}
