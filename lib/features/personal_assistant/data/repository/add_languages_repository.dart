import 'package:injectable/injectable.dart';
import 'package:staff_breeze/core/network_configration/handle_response.dart';
import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/personal_assistant/data/mappers/add_languages_mapper.dart';
import 'package:staff_breeze/features/personal_assistant/domain/entity/add_languages_entity.dart';
import 'package:staff_breeze/features/personal_assistant/domain/repository/add_languages_repo.dart';

import '../data_source/network/add_languages_cleint.dart';
import '../model/add_languages_model.dart';

@Singleton(as: AddLanguagesRepository)
class AddLanguagesRepositoryImp implements AddLanguagesRepository {
  AddLanguagesRepositoryImp({required this.client, required this.mapper});

  AddLanguagesCleint client;
  AddLanguagesMapper mapper;

  @override
  Future<Result<AddLanguagesEntity>> addLanguages(
          {required String content_type,required String bearer,required int user_id, required String language_ids}) =>
      handleResponse<AddLanguagesModel, AddLanguagesEntity>(
          () =>
              client.addLanguages(content_type: content_type,bearer: bearer,user_id: user_id, language_ids: language_ids),
          (response) => mapper.mapper(response));
}
