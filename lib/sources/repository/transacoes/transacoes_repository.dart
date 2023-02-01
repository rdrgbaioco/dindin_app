import 'package:dindin_app/library.dart';

class TransacoesRepository implements TransacoesRepositoryImpl {

  @override
  FutureOr<Transacao> getTransacaoById({
    required Token token,
    required int id,
  }) async {
    try {
      final dio = await DioCustom.instance();
      final api = TransacaoRequest(http: dio);
      final request = await api.getTransacaoById(token: token, id: id);
      return request;
    } on Error {
      return Transacao();
    }
  }

  @override
  FutureOr<Transacoes> getTransacoes({required Token token}) async {
    final dio = await DioCustom.instance();
    final api = TransacaoRequest(http: dio);
    final request = await api.getTransacoes(token: token);
    final parser = ParserLists();
    Transacoes result = await parser.transacoesBackground(request);
    return result;
  }

  @override
  FutureOr<Transacao> createTransacao({
    required Token token,
    required Transacao transacao,
  }) async {
    final dio = await DioCustom.instance();
    final api = TransacaoRequest(http: dio);
    final request = await api.createTransacao(token: token, transacao: transacao);
    return request;
  }

  @override
  FutureOr<Transacao> updateTransacao({
    required Token token,
    required Transacao transacao,
  }) async {
    final dio = await DioCustom.instance();
    final api = TransacaoRequest(http: dio);
    final request = await api.updateTransacao(token: token, transacao: transacao);
    return request;
  }

  @override
  FutureOr<Transacao> deleteTransacao({
    required Token token,
    required Transacao transacao,
  }) async {
    final dio = await DioCustom.instance();
    final api = TransacaoRequest(http: dio);
    final request = await api.deleteTransacao(token: token, transacao: transacao);
    return request;
  }
}