import 'package:dio/dio.dart';
import 'package:property_hub/core/networks/logger.dart';

class Logging extends InterceptorsWrapper {
  Logging();

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers["Accept"] = "application/json";
    if (options.headers['Content-Type'] == '') {
      options.headers["Content-Type"] = "application/json";
    }

//    final String? token = await PreferencesHelper.getString('token');

    // if (token != null && token.isNotEmpty) {
    //   options.headers["Authorization"] = "Bearer $token";
    // }

    logger.i(
        'REQUEST[${options.method}] => PATH: ${options.baseUrl}${options.path} => DATA: ${options.data} => QUERY PARAMS: ${options.queryParameters} => AUTH: ${options.headers}');
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.i(
      'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path} => DATA: ${response.data}',
    );
    return handler.next(response);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    logger.e(
        "Request Error message :: ${err.message} ++ Err type ${err.type} >>> Whole error:: ${err.response}");
    return handler.next(err);
  }
}
