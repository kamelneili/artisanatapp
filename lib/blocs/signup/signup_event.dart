import 'package:equatable/equatable.dart';

abstract class SignupEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class StartEvent extends SignupEvents {}

class LoggedOut extends SignupEvents {}

class LogoutEvent extends SignupEvents {}

class DisplayProfileEvent extends SignupEvents {}

class RegisterButtonPressed extends SignupEvents {
  final String email;
  final String password;
  final String name;

  RegisterButtonPressed(
      {required this.email, required this.password, required this.name});

  @override
  List<Object> get props => [email, password, name];
}
