import 'package:artisanaflutterapp/blocs/signin/signin_event.dart';
import 'package:artisanaflutterapp/blocs/signin/signin_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../repository/auth_repository.dart';
import 'package:bloc/bloc.dart';

class SigninBloc extends Bloc<SigninEvents, SigninState> {
  final AuthRepository _authRepository;

  @override
  SigninBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(AuthinitialState()) {
    on<LoginButtonPressed>(_onLoginButtonPressed);
    on<LogoutEvent>(_onLogoutEvent);
  }

  void _onLoginButtonPressed(
    LoginButtonPressed event,
    Emitter<SigninState> emit,
  ) async {
    // emit(LoginLoadingState());
    try {
      var data = await _authRepository.login(event.email, event.password);
      print(data);
      SharedPreferences pref = await SharedPreferences.getInstance();

      pref.setString("token", data['token']);
      pref.getString('token');
      pref.setString("userId", data['_id']);
      pref.setInt("cartleng", data["cart"].length);
      pref.setString("name", data['name']);
      var name = pref.getString("name");
      var type = pref.setString("type", data['type']);

      print('name:$type');

      emit(UserLoginSuccessState());
    } catch (_) {
      emit(LoginErrorState("auth error"));
    }
  }

  ///********* Logout */
  void _onLogoutEvent(
    LogoutEvent event,
    Emitter<SigninState> emit,
  ) async {
    _authRepository.logOut();
    print("logout");
    emit(UserLogoutState());
  }
}
