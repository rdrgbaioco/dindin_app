import 'package:dindin_app/library.dart';

/// Registra os adaptadores dos models para o Hive
class InitializeDB {
  static Future<void> registerAdapters() async {
    await Hive.initFlutter();
    Hive.registerAdapter(TokenAdapter());
    Hive.registerAdapter(UsuarioAdapter());
  }
}