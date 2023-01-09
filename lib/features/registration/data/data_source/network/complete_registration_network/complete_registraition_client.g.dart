// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complete_registraition_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _CompleteRegistrationCleint implements CompleteRegistrationCleint {
  _CompleteRegistrationCleint(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://staffbreeze.aratech.co/api';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<EducationsModel> getEducation() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<EducationsModel>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/get-educations',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = EducationsModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<AllLanguagesModel> getLanguages() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<AllLanguagesModel>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/get-languages',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AllLanguagesModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CountriesModel> getCountries() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<CountriesModel>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/get-countries',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CountriesModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<EditUserDetailsModel> editDetails({
    required content_type,
    required bearer_token,
    user_id,
    education_ids,
    email,
    is_male,
    city_id,
    country_id,
    profile_image,
    phone_number,
    location,
    about,
    service_ids,
    language_ids,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{
      r'content-type': content_type,
      r'Authorization': bearer_token,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = FormData();
    if (user_id != null) {
      _data.fields.add(MapEntry(
        'user_id',
        user_id.toString(),
      ));
    }
    if (education_ids != null) {
      _data.fields.add(MapEntry(
        'education_ids',
        education_ids,
      ));
    }
    if (email != null) {
      _data.fields.add(MapEntry(
        'email',
        email,
      ));
    }
    if (is_male != null) {
      _data.fields.add(MapEntry(
        'is_male',
        is_male.toString(),
      ));
    }
    if (city_id != null) {
      _data.fields.add(MapEntry(
        'city_id',
        city_id,
      ));
    }
    if (country_id != null) {
      _data.fields.add(MapEntry(
        'country_id',
        country_id.toString(),
      ));
    }
    if (profile_image != null) {
      _data.fields.add(MapEntry(
        'profile_image',
        profile_image,
      ));
    }
    if (phone_number != null) {
      _data.fields.add(MapEntry(
        'phone_number',
        phone_number,
      ));
    }
    if (location != null) {
      _data.fields.add(MapEntry(
        'location',
        location,
      ));
    }
    if (about != null) {
      _data.fields.add(MapEntry(
        'about',
        about,
      ));
    }
    if (service_ids != null) {
      _data.fields.add(MapEntry(
        'service_ids',
        service_ids,
      ));
    }
    if (language_ids != null) {
      _data.fields.add(MapEntry(
        'language_ids',
        language_ids,
      ));
    }
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<EditUserDetailsModel>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              '/edit-user-details',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = EditUserDetailsModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GetAllServicesModel> getAllServices() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GetAllServicesModel>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/get-services',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GetAllServicesModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GetCitiesInCountryModel> getCitiesInCountry(
      {required country_id}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'country_id': country_id};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GetCitiesInCountryModel>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/get-cities-in-country',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GetCitiesInCountryModel.fromJson(_result.data!);
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
