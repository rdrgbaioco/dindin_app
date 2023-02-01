import 'package:dindin_app/library.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginStateInitial()) {

    on<LoginToInitialState>(onLoginToInitialState);

    on<LoginInitialize>(onLoginInitialize);

    on<LoginShowPassword>(onLoginShowPassword);

    on<GetToken>(onGetToken);

    on<LogoutEvent>(onLogout);
  }

  void onLoginToInitialState(LoginToInitialState event, Emitter<LoginState> emit) async {
    emit(LoginStateInitial());
  }

  void onLoginInitialize(LoginInitialize event, Emitter<LoginState> emit) async {
    emit(state.copyWith(loginStatus: LoginEnum.loading));
    try {
      final storage = Storage();
      VerifyKey containsToken = await storage.containsToken();
      if (containsToken != VerifyKey.contains) {
        emit(state.copyWith(loginStatus: LoginEnum.unauthenticated));
      } else {
        Token token = await storage.getToken();
        final repository = AuthRepository();
        final verifyToken = await repository.verifyToken(token: token);
        if (verifyToken.email!.isEmpty || verifyToken.email == null) {
          emit(state.copyWith(loginStatus: LoginEnum.unauthenticated));
        } else {
          emit(state.copyWith(
            authStatus: AuthEnum.authenticated,
            loginStatus: LoginEnum.authenticated,
          ));
        }
      }
    } on Error catch (e) {
      debugPrint(e.toString());
    }
  }

  void onLoginShowPassword(LoginShowPassword event, Emitter<LoginState> emit) async {
    emit(state.copyWith(showPassword: event.showPassword));
  }

  void onGetToken(GetToken event, Emitter<LoginState> emit) async {
    emit(state.copyWith(loginStatus: LoginEnum.loading));
    try {
      final repository = AuthRepository();
      Usuario usuario = Usuario(
        email: event.email,
        senha: event.senha,
      );

      Token token = await repository.loginUser(usuario: usuario);

      if (token.token!.isEmpty || token.token == null) {
        emit(state.copyWith(
          authStatus: AuthEnum.invalid,
          loginStatus: LoginEnum.unauthenticated,
        ));
      } else {
        final storage = Storage();
        await storage.save(token: token);

        emit(state.copyWith(
          authStatus: AuthEnum.authenticated,
          loginStatus: LoginEnum.authenticated,
        ));
      }
    } on Error {
      emit(state.copyWith(
        loginStatus: LoginEnum.error,
        authStatus: AuthEnum.error,
      ));
    } finally {
      emit(state.copyWith(authStatus: AuthEnum.idle));
    }
  }

  void onLogout(LogoutEvent event, Emitter<LoginState> emit) async {
    emit(state.copyWith(loginStatus: LoginEnum.loading));
    final storage = Storage();
    await storage.clear();
    emit(LoginStateInitial());
  }
}