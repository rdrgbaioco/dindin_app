import 'package:dindin_app/library.dart';

abstract class AuthRepositoryImpl {
  FutureOr<Token> loginUser({required Usuario usuario});
  FutureOr<Usuario> verifyToken({required Token token});
}