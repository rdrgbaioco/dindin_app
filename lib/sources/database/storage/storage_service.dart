import 'package:dindin_app/library.dart';

abstract class StorageService {

  // Verificar se contem
  FutureOr<VerifyKey> containsToken();
  // Obter valores salvos
  FutureOr<Token> getToken();
  // Salvar no armazenamento
  FutureOr<void> save({required Token token});
  // Limpar dados
  FutureOr<void> clear();
}