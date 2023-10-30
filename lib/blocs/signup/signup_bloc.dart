import 'package:artisanaflutterapp/blocs/signup/signup_event.dart';
import 'package:artisanaflutterapp/blocs/signup/signup_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../repository/auth_repository.dart';
import 'package:bloc/bloc.dart';

class SignupBloc extends Bloc<SignupEvents, SignupState> {
  AuthRepository _authRepository;
  late SignupBloc signupBloc;

  @override
  SignupBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(LogoutState()) {
    on<RegisterButtonPressed>(_onRegisterButtonPressed);
  }

  void _onRegisterButtonPressed(
    RegisterButtonPressed event,
    Emitter<SignupState> emit,
  ) async {
    emit(LoginLoadingState());
    try {
      var data =
          await _authRepository.signup(event.name, event.email, event.password);
      if (data['message'] == "Username or password is incorrect") {
        emit(LoginErrorState("auth error"));
      } else {
        emit(UserRegisterSuccessState(
            //  data: data,
            ));
      }
    } catch (_) {
      emit(LoginErrorState("auth error"));
    }
  }
}
