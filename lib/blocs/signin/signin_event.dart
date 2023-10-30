import 'package:equatable/equatable.dart';

abstract class SigninEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class LogoutEvent extends SigninEvents {}

class StartEvent extends SigninEvents {}

class LoginButtonPressed extends SigninEvents {
  final String email;
  final String password;

  LoginButtonPressed({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}
