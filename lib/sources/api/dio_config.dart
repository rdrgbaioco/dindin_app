import 'package:dindin_app/library.dart';

class DioCustom {

  static Future<Dio> instance({int? timeout, String? contentType}) async {
    return Dio(await options(timeout: timeout, contentType: contentType));
  }

  static Future<BaseOptions> options(
      {int? timeout, String? contentType}) async {
    return BaseOptions(
      baseUrl: 'https://dindin-api-ts.herokuapp.com',
      connectTimeout: timeout ?? 3000,
      sendTimeout: timeout ?? 3000,
      receiveTimeout: timeout ?? 3000,
      receiveDataWhenStatusError: true,
      contentType: contentType ?? 'application/json',
      headers: {
        //"authorization": "$jwt",
      },
    );
  }
}
