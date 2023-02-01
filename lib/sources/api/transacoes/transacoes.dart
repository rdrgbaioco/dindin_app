import 'package:dindin_app/library.dart';

class TransacaoRequest implements TransacaoRequestImpl {
  final Dio http;
  TransacaoRequest({required this.http});

  @override
  FutureOr<Transacao> getTransacaoById({
    required Token token,
    required int id,
  }) async {
    try {
      final String url = "/transacao/$id";
      final response = await http.get(
          url,
          options: Options(
            headers: token.tokenToBearer(),
          )
      );
      if (response.statusCode == 200) {
        return Transacao.fromJson(response.data);
      } else {
        throw DioError(requestOptions: response.requestOptions);
      }
    } on DioError catch (e) {
      return Transacao.fromJson(e.response!.data);
    }
  }

  @override
  FutureOr<List<dynamic>> getTransacoes({required Token token}) async {
    try {
      const String url = "/transacao";
      final response = await http.get(
        url,
        options: Options(
          headers: token.tokenToBearer(),
        )
      );
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw DioError(requestOptions: response.requestOptions);
      }
    } on DioError catch (e) {
      return [
        Transacao(
          mensagem: e.response!.data ?? "Erro",
        ),
      ];
    }
  }

  @override
  FutureOr<Transacao> createTransacao({
    required Token token,
    required Transacao transacao,
  }) async {
    try {
      const String url = "/transacao";
      final response = await http.post(
        url,
        options: Options(
          headers: token.tokenToBearer(),
        ),
        data: transacao.toJson(),
      );
      if (response.statusCode == 201) {
        return Transacao.fromJson(response.data);
      } else {
        throw DioError(requestOptions: response.requestOptions);
      }
    } on DioError catch (e) {
      return Transacao.fromJson(e.response!.data);
    }
  }

  @override
  FutureOr<Transacao> updateTransacao({
    required Token token,
    required Transacao transacao,
  }) async {
    try {
     final String url = "/transacao/${transacao.id}";
     final response = await http.put(
       url,
       options: Options(
         headers: token.tokenToBearer(),
       ),
       data: transacao.toJson(),
     );
     if (response.statusCode == 204) {
       return Transacao();
     } else {
       throw DioError(requestOptions: response.requestOptions);
     }
    } on DioError catch (e) {
      return Transacao.fromJson(e.response!.data);
    }
  }

  @override
  FutureOr<Transacao> deleteTransacao({
    required Token token,
    required Transacao transacao,
  }) async {
    try {
      final String url = "/transacao/${transacao.id}";
      final response = await http.delete(
        url,
        options: Options(
          headers: token.tokenToBearer(),
        ),
      );
      if (response.statusCode == 204) {
        return Transacao();
      } else {
        throw DioError(requestOptions: response.requestOptions);
      }
    } on DioError catch (e) {
      return Transacao.fromJson(e.response!.data);
    }
  }
}