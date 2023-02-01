import 'package:dindin_app/library.dart';

class ParserLists {
  FutureOr<Categorias> categoriasBackground(List<dynamic> json) {
    return compute(parseCategorias, json);
  }

  Categorias parseCategorias(List<dynamic> jsonList) {
    return jsonList.map<Categoria>((json) => Categoria.fromJson(json)).toList();
  }


  FutureOr<Transacoes> transacoesBackground(List<dynamic> json) {
    return compute(parseTransacoes, json);
  }

  Transacoes parseTransacoes(List<dynamic> jsonList) {
    return jsonList.map<Transacao>((json) => Transacao.fromJson(json)).toList();
  }
}
