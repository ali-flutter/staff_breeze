import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'base_network_config.dart';
@module
abstract class DioSetup {
  Dio get dio {
    Dio instance = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: 60000,
      ),
    );
    instance.interceptors.add(
      LogInterceptor(
        requestBody: true,
        request: true,
        error: true,
        requestHeader: true,

        responseBody: true,
      ),
    );
    instance.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) async {
          Map<String, dynamic> params = Map();
          //params["api_key"] = apiKey;
          //options.queryParameters.addAll(params);

          return handler.next(options);
        },
      ),
    );
    return instance;
  }
  }
