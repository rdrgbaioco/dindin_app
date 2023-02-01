import 'package:dindin_app/library.dart';

abstract class UserRepositoryImpl {
  FutureOr<Usuario> getUser({required Token token});
  FutureOr<Usuario> registerUser({required Usuario user});
  FutureOr<Usuario> updateUser({
    required Token token,
    required Usuario usuario,
  });
}
