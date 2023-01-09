// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_review_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _AddReviewClient implements AddReviewClient {
  _AddReviewClient(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://staffbreeze.aratech.co/api';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<AddReviewModel> addReview({
    required bearer_token,
    required assistant_id,
    required rating,
    required body,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': bearer_token};
    _headers.removeWhere((k, v) => v == null);
    final _data = FormData();
    _data.fields.add(MapEntry(
      'assistant_id',
      assistant_id.toString(),
    ));
    _data.fields.add(MapEntry(
      'rating',
      rating.toString(),
    ));
    _data.fields.add(MapEntry(
      'body',
      body,
    ));
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<AddReviewModel>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              '/add-review',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AddReviewModel.fromJson(_result.data!);
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
