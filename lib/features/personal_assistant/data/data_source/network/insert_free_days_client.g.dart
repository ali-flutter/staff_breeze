// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insert_free_days_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _InsertFreeDaysClient implements InsertFreeDaysClient {
  _InsertFreeDaysClient(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://staffbreeze.aratech.co/api';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<InsertFreeDaysModel> enterFreeDays({
    required bearer,
    required assistant_id,
    required hours,
    required hourly_rate,
    required start_at,
    required weeks,
    required free_days,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': bearer};
    _headers.removeWhere((k, v) => v == null);
    final _data = FormData();
    _data.fields.add(MapEntry(
      'assistant_id',
      assistant_id.toString(),
    ));
    _data.fields.add(MapEntry(
      'hours',
      hours.toString(),
    ));
    _data.fields.add(MapEntry(
      'hourly_rate',
      hourly_rate.toString(),
    ));
    _data.fields.add(MapEntry(
      'start_at',
      start_at.toString(),
    ));
    _data.fields.add(MapEntry(
      'weeks',
      weeks.toString(),
    ));
    free_days.forEach((i) {
      _data.fields.add(MapEntry('free_days', i));
    });
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<InsertFreeDaysModel>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              '/insert-free-days',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = InsertFreeDaysModel.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
