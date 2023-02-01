import 'package:dindin_app/library.dart';

class LoginException implements Exception {
  final int statusCode;
  final String message;

  LoginException({
    required this.statusCode,
    required this.message,
  });
}

abstract class AuthRequestImpl {
  FutureOr<Token> loginUser({required Usuario usuario});
  FutureOr<Usuario> verifyToken({required Token token});
}
