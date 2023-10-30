import 'package:equatable/equatable.dart';

import '../../models/user_model.dart';

abstract class SigninState extends Equatable {
  @override
  List<Object> get props => [];
}

class UserLogoutState extends SigninState {}

class LogoutState extends SigninState {}

class LoginInitState extends SigninState {}

class LoginLoadingState extends SigninState {}

class AuthinitialState extends SigninState {}

class UserLoginSuccessState extends SigninState {
  // final User user;
  // Map data;

  UserLoginSuccessState(
      // {
      //   required this.data,
//  }
      );
  @override
  List<Object> get props => [
        //   data,
      ];
}

class LoginErrorState extends SigninState {
  final String message;
  LoginErrorState(this.message);

  @override
  List<Object> get props => [message];
}

class LoadingState extends SigninState {}
