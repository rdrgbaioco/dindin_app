import 'package:dindin_app/library.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterStateInitial()) {

    on<RegisterShowPassword>(onRegisterShowPassword);

    on<RegisterNewUser>(onNewRegister);

    on<InitialRegister>(onInitialRegister);

  }

  void onRegisterShowPassword(
      RegisterShowPassword event, Emitter<RegisterState> emit) {
    emit(state.copyWith(
      showPassword: event.showPassword,
      showConfirmPassword: event.showConfirmPassword,
    ));
  }

  void onNewRegister(RegisterNewUser event, Emitter<RegisterState> emit) async {
    try {
      final repository = UserRepository();
      Usuario user = Usuario(
        nome: event.name,
        email: event.email,
        senha: event.password,
      );

      Usuario response = await repository.registerUser(
        user: user,
      );

      if (response.mensagem != "") {
        emit(
          state.copyWith(
            statusRequest: RegisterEnum.alreadyExists,
            requestMessage: response.mensagem,
          ),
        );
      } else {
        emit(
          state.copyWith(
            statusRequest: RegisterEnum.created,
            status: RegisterStatus.success,
          ),
        );
      }
    } on Error {
      throw Error();
    }
  }

  void onInitialRegister(InitialRegister event, Emitter<RegisterState> emit) {
    emit(RegisterStateInitial());
  }
}
