import 'package:injectable/injectable.dart';
import 'package:staff_breeze/core/network_configration/handle_response.dart';
import 'package:staff_breeze/features/personal_assistant/data/mappers/personal_assistant_home_page_mappers.dart';
import 'package:staff_breeze/features/personal_assistant/data/model/personal_assistant_home_page_model.dart';
import 'package:staff_breeze/features/personal_assistant/domain/entity/perosnal_assistant_home_page_entity.dart';
import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/personal_assistant/domain/repository/personal_assistant_home_page_repository.dart';

import '../data_source/network/personal_assistant_cleint.dart';

@Singleton(as: PersonalAssistantHomePageRepository)
class PersonalAssistantHomepageRepositoryImp
    implements PersonalAssistantHomePageRepository {
  PersonalAssistantHomePageMappers mappers;

  PesonalAssistantCleint cleint;
  PersonalAssistantHomepageRepositoryImp(
      {required this.cleint, required this.mappers});
  @override
  Future<Result<PersonalAssistantHomePageEntity>> getPersonalAssistant(
          {required int id}) =>
      handleResponse<PersonalAssistantHomePageModel,
              PersonalAssistantHomePageEntity>(
          () => cleint.getPersonalAssistant(id: id),
          (response) => mappers.mapper(response));
}
