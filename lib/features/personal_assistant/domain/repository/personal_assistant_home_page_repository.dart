import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/personal_assistant/domain/entity/perosnal_assistant_home_page_entity.dart';

abstract class PersonalAssistantHomePageRepository {
  Future<Result<PersonalAssistantHomePageEntity>> getPersonalAssistant(
      {required int id});
}
