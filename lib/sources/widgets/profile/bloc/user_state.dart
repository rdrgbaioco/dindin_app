part of 'user_bloc.dart';

class UserState {
  Usuario user;

  UserState({
    required this.user,
  });

  UserState copyWith({
    Usuario? user,
  }) {
    return UserState(
      user: Usuario(
        id: this.user.id,
        email: this.user.email,
        mensagem: this.user.mensagem,
        senha: this.user.senha,
        nome: user!.nome ?? this.user.nome,
      ),
    );
  }
}

class UserInitial extends UserState {
  UserInitial() : super(user: Usuario());
}
