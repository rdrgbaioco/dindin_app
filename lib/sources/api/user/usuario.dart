import 'package:dindin_app/library.dart';

class UserRequest implements UserRequestImpl {
  final Dio http;
  UserRequest({required this.http});

  @override
  FutureOr<Usuario> createUser({required Usuario usuario}) async {
    try {
      const String url = "/usuario";
      final response = await http.post(
        url,
        data: usuario.toJson(),
      );

      if (response.statusCode == 201) {
        return Usuario.fromJson(response.data);
      } else {
        throw DioError(requestOptions: response.requestOptions);
      }
    } on DioError catch (e) {
      return Usuario.fromJson(e.response!.data);
    }
  }

  @override
  FutureOr<Usuario> getUser({required Token token}) async {
    try {
      const String url = "/usuario";
      final response = await http.get(url,
          options: Options(
            headers: token.tokenToBearer(),
          ));
      if (response.statusCode == 200) {
        return Usuario.fromJson(response.data);
      } else {
        throw DioError(requestOptions: response.requestOptions);
      }
    } on DioError catch (e) {
      return Usuario(
        mensagem: e.response!.data ?? "Erro",
      );
    }
  }

  @override
  FutureOr<Usuario> updateUser(
      {required Token token, required Usuario usuario}) async {
    try {
      const String url = "/usuario";
      final response = await http.put(
        url,
        options: Options(
          headers: token.tokenToBearer(),
        ),
        data: usuario.toJson(),
      );
      if (response.statusCode == 200) {
        return Usuario();
      } else {
        throw DioError(requestOptions: response.requestOptions);
      }
    } on DioError catch (e) {
      return Usuario(
        mensagem: e.response!.data ?? "Erro",
      );
    }
  }
}
