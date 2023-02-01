part of 'login_bloc.dart';

class LoginState {
  String email;
  String senha;
  Token token;
  bool showPassword;
  AuthEnum authStatus;
  LoginEnum loginStatus;

  LoginState({
    required this.email,
    required this.senha,
    required this.token,
    required this.showPassword,
    required this.authStatus,
    required this.loginStatus,
  });

  LoginState copyWith({
    String? email,
    String? senha,
    Token? token,
    bool? showPassword,
    AuthEnum? authStatus,
    LoginEnum? loginStatus,
  }) {
    return LoginState(
      email: email ?? this.email,
      senha: senha ?? this.senha,
      token: token ?? this.token,
      showPassword: showPassword ?? this.showPassword,
      authStatus: authStatus ?? this.authStatus,
      loginStatus: loginStatus ?? this.loginStatus,
    );
  }
}

class LoginStateInitial extends LoginState {
  LoginStateInitial() : super(
    senha: "",
    email: "",
    token: Token(),
    showPassword: true,
    authStatus: AuthEnum.idle,
    loginStatus: LoginEnum.idle,
  );
}