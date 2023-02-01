import 'package:dindin_app/library.dart';

abstract class TransacaoRequestImpl {
  FutureOr<Transacao> getTransacaoById({
    required Token token,
    required int id,
  });
  FutureOr<List<dynamic>> getTransacoes({required Token token});
  FutureOr<Transacao> createTransacao({
    required Token token,
    required Transacao transacao,
  });
  FutureOr<Transacao> updateTransacao({
    required Token token,
    required Transacao transacao,
  });
  FutureOr<Transacao> deleteTransacao({
    required Token token,
    required Transacao transacao,
  });
}