import 'package:dindin_app/library.dart';

class DetalhesRepository {
  FutureOr<Categorias> getCategorias({required Token token}) async {
    final dio = await DioCustom.instance();
    final api = DetalhesRequest(http: dio);
    final request = await api.getCategorias(token: token);
    final parser = ParserLists();
    Categorias result = await parser.categoriasBackground(request);
    return result;
  }

  FutureOr<Extrato> getExtrato({required Token token}) async {
    final dio = await DioCustom.instance();
    final api = DetalhesRequest(http: dio);
    final request = await api.getExtrato(token: token);
    return request;
  }
}
