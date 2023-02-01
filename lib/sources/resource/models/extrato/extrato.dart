import 'package:dindin_app/library.dart';

class Extrato {
  final int? entrada;
  final int? saida;
  final String? mensagem;

  Extrato({
    this.entrada,
    this.saida,
    this.mensagem,
  });

  factory Extrato.fromJson(Json json) => Extrato(
    entrada: json["entrada"] as int? ?? 0,
    saida: json["saida"] as int? ?? 0,
    mensagem: json["mensagem"] as String? ?? "",
  );
}