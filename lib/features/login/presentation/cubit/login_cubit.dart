import 'package:bloc/bloc.dart';
import 'package:task/features/login/presentation/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
}
