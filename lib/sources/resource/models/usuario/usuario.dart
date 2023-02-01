import 'package:dindin_app/library.dart';
part 'usuario.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs

// Para detalhar usuário
@HiveType(typeId: 2)
class Usuario {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? nome;
  @HiveField(2)
  String? email;
  @HiveField(3)
  String? senha;
  @HiveField(4)
  String? mensagem;

  Usuario({
    this.id,
    this.nome,
    this.email,
    this.senha,
    this.mensagem,
  });

  Map<String, dynamic> toJson() => {
    "id": id,
    "nome": nome,
    "email": email,
    "senha": senha,
    "mensagem": mensagem,
  };

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
    id: json['id'] as int? ?? 0,
    nome: json['nome'] as String? ?? "",
    email: json['email'] as String? ?? "",
    senha: json['senha'] as String? ?? "",
    mensagem: json['mensagem'] as String? ?? "",
  );
}