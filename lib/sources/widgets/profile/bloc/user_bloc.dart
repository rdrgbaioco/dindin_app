import 'package:dindin_app/library.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<UserInitialState>(onInitialEvent);
    on<ChangeName>(onChangeName);
    on<ChangePassword>(onChangePassword);
  }

  FutureOr<void> onInitialEvent(UserInitialState event, Emitter emit) async {
    final token = await Storage().getToken();
    final userRepo = UserRepository();
    Usuario usuario = await userRepo.getUser(token: token);
    emit(
      state.copyWith(user: usuario),
    );
  }

  FutureOr<void> onChangeName(ChangeName event, Emitter emit) async {
    final token = await Storage().getToken();
    final userRepo = UserRepository();
    Usuario finalUser = Usuario(
      nome: event.nome,
    );
    await userRepo.updateUser(token: token, usuario: finalUser);
  }

  FutureOr<void> onChangePassword(ChangePassword event, Emitter emit) async {
    final token = await Storage().getToken();
    final userRepo = UserRepository();
    Usuario finalUser = Usuario(
      senha: event.password,
    );
    await userRepo.updateUser(token: token, usuario: finalUser);
  }
}
