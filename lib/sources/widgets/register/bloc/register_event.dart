part of 'register_bloc.dart';

class RegisterEvent {}

class RegisterShowPassword extends RegisterEvent {
  bool? showPassword;
  bool? showConfirmPassword;
  RegisterShowPassword({
    this.showPassword,
    this.showConfirmPassword,
  });
}

class InitialRegister extends RegisterEvent {}

class RegisterNewUser extends RegisterEvent {
  final String name;
  final String email;
  final String password;

  RegisterNewUser({
    required this.name,
    required this.email,
    required this.password,
  });
}
