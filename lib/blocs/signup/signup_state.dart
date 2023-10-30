import 'package:artisanaflutterapp/models/user_model.dart';
import 'package:equatable/equatable.dart';

abstract class SignupState extends Equatable {
  @override
  List<Object> get props => [];
}

class LogoutState extends SignupState {}

class LoginInitState extends SignupState {}

class LoginLoadingState extends SignupState {}

class ProfilLoadingState extends SignupState {}

class UserLoginSuccessState extends SignupState {}

class RegisterLoadingState extends SignupState {}

class LoginErrorState extends SignupState {
  final String message;
  LoginErrorState(this.message);

  @override
  List<Object> get props => [message];
}

class UserRegisterSuccessState extends SignupState {}

class UserUpdateSuccessState extends SignupState {}

class LoadingState extends SignupState {}

class UpdateLoadingState extends SignupState {}

class RegisterErrorState extends SignupState {
  final String message;
  RegisterErrorState(this.message);

  @override
  List<Object> get props => [message];
}

class DisplayProfileState extends SignupState {
  User user;
  DisplayProfileState({required this.user});
}
