import 'package:dindin_app/library.dart';

class Categoria {
  final int? id;
  final String? descricao;
  final String? mensagem;

  const Categoria({
    this.id,
    this.descricao,
    this.mensagem,
  });

  factory Categoria.fromJson(Json json) => Categoria(
    id: json["id"] as int? ?? 0,
    descricao: json["descricao"] as String? ?? "",
    mensagem:  json["mensagem"] as String? ?? "",
  );
}