import 'package:dindin_app/library.dart';

/// [Security] transforma a senha hash por questões de segurança
class Security implements SecurityService {

  @override
  Usuario hashUser(Usuario usuario) {
    final List<int> key = utf8.encode(usuario.senha!);
    final List<int> bytes = utf8.encode(usuario.email!);

    final hmacSha256 = Hmac(sha512, key);
    var hash = hmacSha256.convert(bytes);

    Usuario user = Usuario(
      nome: usuario.nome,
      email: usuario.email,
      senha: hash.toString(),
    );

    return user;
  }
}