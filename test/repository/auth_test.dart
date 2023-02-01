
import 'package:dindin_app/library.dart';

void main() async {
  final dio = await DioCustom.instance();
  Usuario usuario = Usuario(
    email: "rdrgbaioco@gmail.com",
    senha: "123455678",
  );

  final api = AuthRequest(http: dio);
  final request = await api.loginUser(usuario: usuario);

  print(request);
}