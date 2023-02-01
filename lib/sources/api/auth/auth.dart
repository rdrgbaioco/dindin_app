import 'package:dindin_app/library.dart';

class AuthRequest implements AuthRequestImpl {
  final Dio http;
  AuthRequest({required this.http});

  @override
  FutureOr<Token> loginUser({required Usuario usuario}) async {
    try {
      const String url = "/login";
      final response = await http.post(
        url,
        options: Options(
            receiveDataWhenStatusError: true
        ),
        data: usuario.toJson(),
      );

      if (response.statusCode == 200) {
        return Token.fromJson(response.data);
      } else {
        throw DioError(requestOptions: response.requestOptions);
      }
    } on DioError catch (e) {
      return Token.fromJson(e.response!.data);
    }
  }

  @override
  FutureOr<Usuario> verifyToken({required Token token}) async {
    try {
      const String url = "/usuario";
      final response = await http.get(
        url,
        options: Options(
          headers: token.tokenToBearer(),
        ),
      );
      if (response.statusCode == 200) {
        return Usuario.fromJson(response.data);
      } else {
        throw DioError(requestOptions: response.requestOptions);
      }
    } on DioError catch (e) {
      return Usuario.fromJson(e.response!.data);
    }
  }
}
