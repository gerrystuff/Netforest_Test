import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:app/config/shared_prefs/app_preferences.dart';

class AppHttpManager {
  static final AppHttpManager _singleton =
      AppHttpManager._internal();

  factory AppHttpManager() {
    return _singleton;
  }

  AppHttpManager._internal();

  // Este se va a usar para apis que no sean de app
  final Dio _genDio = Dio()..interceptors.add(AppInterceptorGen());


  final Dio _backMobile = Dio()
    ..interceptors.add(AppInterceptoBckMobile())
    ..interceptors.add(AppInterceptorGeneraLog().prettyDioLogger);

  Dio get genDio => _genDio;
  Dio get backMobile => _backMobile;


  init({
    required String urlBackMobile,
  }){
        backMobile.options.baseUrl = urlBackMobile;
    backMobile.options.headers = {
      Headers.contentTypeHeader: Headers.jsonContentType,
      Headers.acceptHeader: Headers.jsonContentType,
      'Authorization': 'Bearer ${AppPreferences().token}',
    };
  }

  void setAuthToken(String token) {
    backMobile.options.headers['Authorization'] = 'Bearer $token';
  }


}

class AppInterceptorGen extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final loggerNoStack = Logger(
      printer: PrettyPrinter(methodCount: 0),
    );
    loggerNoStack.i('API GEN INTERCEPTOR'
        '\n'
        'REQUEST [${options.method}] => PATH: ${options.baseUrl}${options.path}');
    return super.onRequest(options, handler);
  }
}

class AppInterceptoBckMobile extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final loggerNoStack = Logger(
      printer: PrettyPrinter(methodCount: 0),
    );
    loggerNoStack.i('app API'
        '\n'
        'REQUEST [${options.method}] => PATH: ${options.baseUrl}${options.path}');
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final loggerNoStack = Logger(
      printer: PrettyPrinter(methodCount: 0),
    );
    loggerNoStack.v('API BACKEND APP'
        '\n'
        'RESPONSE [${response.statusCode}] => PATH: ${response.requestOptions.path}');
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final logger = Logger();
    logger.e('API BACKEND APP'
        '\n'
        'ERROR [${err.response?.statusCode}] => PATH: ${err.requestOptions.path}'
        '\n');
    return super.onError(err, handler);
  }
}

class AppInterceptorGeneraLog {
  final _prettyDioLogger = PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: false,
    responseHeader: false,
    compact: false,
  );
  PrettyDioLogger get prettyDioLogger => _prettyDioLogger;
}
