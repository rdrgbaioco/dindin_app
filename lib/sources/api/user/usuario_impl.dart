import 'package:dindin_app/library.dart';

class UserRequestException implements Exception {
  final int statusCode;
  final String message;

  UserRequestException({
    required this.statusCode,
    required this.message,
  });
}

abstract class UserRequestImpl {
  FutureOr<Usuario> createUser({required Usuario usuario});
  FutureOr<Usuario> getUser({required Token token});
  FutureOr<Usuario> updateUser({
    required Token token,
    required Usuario usuario,
  });
}
