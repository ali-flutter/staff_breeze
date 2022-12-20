import 'package:injectable/injectable.dart';
import 'package:staff_breeze/core/network_configration/handle_response.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/data/data_source/network/get_used_languages_client.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/data/models/get_used_languages_model.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/domain/entities/get_used_languages_entity.dart';
import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/domain/repository/get_assistant_repository.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/domain/repository/get_used_languages_repository.dart';

import '../mapper/get_used_languages_model_to_entity.dart';

@Singleton(as: GetUsedLanguagesRepository)
class GetUsedLanguagesRepositoryImpl implements GetUsedLanguagesRepository {
  GetUsedLanguagesRepositoryImpl({required this.cleint,required this.mapper});
  GetUsedLanguagesCleint cleint;
  GetUsedLanguagesModelToEntity mapper;
  @override
  Future<Result<GetUsedLanguagesEntity>> getUsedLanguages() =>
  handleResponse<GetUsedLanguagesModel,GetUsedLanguagesEntity>(()=>cleint.getUsedLanguages(),
     (response)=>mapper.usedLanguagesEntityMapper(response));
}
