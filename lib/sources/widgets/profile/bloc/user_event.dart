part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class UserInitialState extends UserEvent {}

class ChangeName extends UserEvent {
  final String nome;

  ChangeName({
    required this.nome,
  });
}

class ChangePassword extends UserEvent {
  final String password;

  ChangePassword({
    required this.password,
  });
}

class LogOut extends UserEvent {}
