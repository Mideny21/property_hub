import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:property_hub/core/networks/network_logger.dart';

class ApiService {
  Dio dioInstance() {
    Dio dio = Dio();
    (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    String url = 'http://192.168.152.233:3000/';

    dio.options.baseUrl = url;
    dio.interceptors.add(Logging());

    return dio;
  }
}
