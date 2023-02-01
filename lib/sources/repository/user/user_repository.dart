import 'package:dindin_app/library.dart';

class UserRepository implements UserRepositoryImpl {
  @override
  FutureOr<Usuario> getUser({required Token token}) async {
    try {
      final dio = await DioCustom.instance();
      final api = UserRequest(http: dio);
      final request = api.getUser(token: token);
      return request;
    } on Error {
      return Usuario();
    }
  }

  @override
  FutureOr<Usuario> registerUser({required Usuario user}) async {
    try {
      final dio = await DioCustom.instance();
      final api = UserRequest(http: dio);
      final request = await api.createUser(usuario: user);
      return request;
    } on Error {
      return Usuario();
    }
  }

  @override
  FutureOr<Usuario> updateUser(
      {required Token token, required Usuario usuario}) async {
    try {
      final dio = await DioCustom.instance();
      final api = UserRequest(http: dio);
      final user = await api.updateUser(token: token, usuario: usuario);
      return user;
    } on Error {
      return Usuario();
    }
  }
}
