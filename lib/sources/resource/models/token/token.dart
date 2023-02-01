import 'package:dindin_app/library.dart';
part 'token.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs

@HiveType(typeId: 1)
class Token {
  @HiveField(0)
  final Usuario? usuario;
  @HiveField(1)
  final String? token;
  @HiveField(2)
  final String? mensagem;

  Token({
    this.token,
    this.usuario,
    this.mensagem,
  });

  Json tokenToBearer() {
    Json bearer = {
      "Authorization": "Bearer $token"
    };
    return bearer;
  }

  factory Token.fromJson(Map<String, dynamic> json) => Token(
    usuario: json['usuario'] != null ? Usuario.fromJson(json['usuario']) : null,
    token: json['token'] as String? ?? "",
    mensagem: json['mensagem'] as String? ?? "",
  );
}