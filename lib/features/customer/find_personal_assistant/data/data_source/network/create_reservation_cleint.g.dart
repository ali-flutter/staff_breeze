// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_reservation_cleint.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _CreateReservationCleint implements CreateReservationCleint {
  _CreateReservationCleint(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://staffbreeze.aratech.co/api';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<CreateReservationModel> createReservation({
    required bearer_token,
    required customer_id,
    required assistant_id,
    required reservations_dates,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': bearer_token};
    _headers.removeWhere((k, v) => v == null);
    final _data = FormData();
    _data.fields.add(MapEntry(
      'customer_id',
      customer_id.toString(),
    ));
    _data.fields.add(MapEntry(
      'assistant_id',
      assistant_id.toString(),
    ));
    reservations_dates.forEach((i) {
      _data.fields.add(MapEntry('reservations_dates', i));
    });
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CreateReservationModel>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/create-reservation',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CreateReservationModel.fromJson(_result.data!);
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
