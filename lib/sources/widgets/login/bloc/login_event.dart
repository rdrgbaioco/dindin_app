part of 'login_bloc.dart';

class LoginEvent {}

class LoginInitialize extends LoginEvent {}

class LoginToInitialState extends LoginEvent {}

class GetToken extends LoginEvent {
  final String email;
  final String senha;

  GetToken({
    required this.email,
    required this.senha,
  });
}

class LoginShowPassword extends LoginEvent {
  final bool showPassword;
  LoginShowPassword({required this.showPassword});
}

class LogoutEvent extends LoginEvent {}
