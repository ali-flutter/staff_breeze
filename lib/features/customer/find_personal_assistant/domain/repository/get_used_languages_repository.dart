import 'package:staff_breeze/features/customer/find_personal_assistant/domain/entities/get_used_languages_entity.dart';

import '../../../../../core/network_configration/result.dart';

abstract class GetUsedLanguagesRepository {
  Future<Result<GetUsedLanguagesEntity>> getUsedLanguages();
}
