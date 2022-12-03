import 'dart:io';

import 'package:dio/dio.dart';
import 'package:staff_breeze/core/network_configration/result.dart';

typedef Future Callback();

//define strings here as const

Future<Result<ResultType>> handleResponse<ResponseType, ResultType>(
    Callback callback, ResultType Function(ResponseType) mapToEntity) async {
  try {
    ResponseType response = await callback();
    ResultType entity = mapToEntity(response);
    return Result<ResultType>.success(entity);
  } on DioError catch (e) {
    if (e.error is SocketException) {
      return const Result.error('No internet connection');
    }
    return Result.error(e.message);
  } on HttpException catch (e) {
    return Result.error(e.message);
  } on FormatException catch (e) {
    return Result.error("Bad response format: $e");
  } catch (e, stacktrace) {
    print("Exception: $e, stacktrace: $stacktrace");
    return Result.error("Something went wrong - $e");
  }
}
