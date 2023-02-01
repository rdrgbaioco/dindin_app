import 'package:dindin_app/library.dart';

class AuthRepository implements AuthRepositoryImpl {
  @override
  FutureOr<Token> loginUser({required Usuario usuario}) async {
    try {
      final dio = await DioCustom.instance();
      final api = AuthRequest(http: dio);
      final request = await api.loginUser(usuario: usuario);
      return request;
    } on Error {
      return Token();
    }
  }

  @override
  FutureOr<Usuario> verifyToken({required Token token}) async {
    try {
      final dio = await DioCustom.instance();
      final api = AuthRequest(http: dio);
      final request = await api.verifyToken(token: token);
      return request;
    } on Error {
      return Usuario();
    }
  }
}