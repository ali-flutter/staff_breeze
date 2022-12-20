import 'package:injectable/injectable.dart';
import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/personal_assistant/domain/entity/perosnal_assistant_home_page_entity.dart';
import 'package:staff_breeze/features/personal_assistant/domain/repository/personal_assistant_home_page_repository.dart';

@injectable
class PersonalAssistantHomePageUseCases {
  PersonalAssistantHomePageUseCases(
      {required this.personalAssistantHomePageRepository});
  PersonalAssistantHomePageRepository personalAssistantHomePageRepository;

  Future<Result<PersonalAssistantHomePageEntity>> getPersonalAssistant(
      {required int id}) {
    return personalAssistantHomePageRepository.getPersonalAssistant(id: id);
  }
}
