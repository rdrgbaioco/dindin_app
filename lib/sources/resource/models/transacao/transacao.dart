import 'package:dindin_app/library.dart';

class Transacao {
  final int? id; // 2098
  final String? tipo; // "entrada"
  final String? descricao; // "Salário"
  final int? valor; // 300000
  final String? data; // "2022-03-24T15:30:00.000Z"
  final int? usuarioId; // 673
  final int? categoriaId;  // 6
  final String? categoriaNome; // "Educação"
  final String? mensagem; // "Erro interno: invalid token"

  Transacao({
    this.id,
    this.tipo,
    this.descricao,
    this.valor,
    this.data,
    this.usuarioId,
    this.categoriaId,
    this.categoriaNome,
    this.mensagem,
  });

  Json toJson() => {
    "id": id,
    "tipo": tipo,
    "descricao": descricao,
    "valor": valor,
    "data": data,
    "usuario_id": usuarioId,
    "categoria_id": categoriaId,
    "categoria_nome": categoriaNome,
  };

  factory Transacao.fromJson(Json json) => Transacao(
    id: json["id"] as int? ?? 0,
    tipo: json["tipo"] as String? ?? "",
    descricao: json["descricao"] as String? ?? "",
    valor: json["valor"] as int? ?? 0,
    data: json["data"] as String? ?? "",
    usuarioId: json["usuario_id"] as int? ?? 0,
    categoriaId: json["categoria_id"] as int? ?? 0,
    categoriaNome: json["categoria_nome"] as String? ?? "",
      mensagem: json["mensagem"] as String? ?? "",
  );

}