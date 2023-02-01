import 'package:dindin_app/library.dart';

class DetalhesRequest {
  final Dio http;
  DetalhesRequest({required this.http});

  FutureOr<List<dynamic>> getCategorias({required Token token}) async {
    try {
      const String url = "/categoria";
      final response = await http.get(url,
          options: Options(
            contentType: 'application/json',
            headers: token.tokenToBearer(),
          ));
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw DioError(requestOptions: response.requestOptions);
      }
    } on DioError catch (e) {
      return [
        Categoria.fromJson(e.response!.data),
      ];
    }
  }

  FutureOr<Extrato> getExtrato({required Token token}) async {
    try {
      const String url = "/transacao/extrato";
      final response = await http.get(
        url,
        options: Options(
          headers: token.tokenToBearer(),
        ),
      );
      if (response.statusCode == 200) {
        return Extrato.fromJson(response.data);
      } else {
        throw DioError(requestOptions: response.requestOptions);
      }
    } on DioError catch (e) {
      return Extrato.fromJson(e.response!.data);
    }
  }
}
