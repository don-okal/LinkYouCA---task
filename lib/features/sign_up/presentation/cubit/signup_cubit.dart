import 'package:bloc/bloc.dart';
import 'package:task/features/sign_up/presentation/cubit/signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());
}
