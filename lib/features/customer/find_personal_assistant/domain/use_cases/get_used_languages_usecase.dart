import 'package:injectable/injectable.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/domain/entities/get_used_languages_entity.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/domain/repository/get_used_languages_repository.dart';

import '../../../../../core/network_configration/result.dart';
@injectable
class GetUsedLanguagesUseCase {
  final GetUsedLanguagesRepository getUsedLanguagesRepository;
  GetUsedLanguagesUseCase({required this.getUsedLanguagesRepository});
  Future<Result<GetUsedLanguagesEntity>> call() {
    return getUsedLanguagesRepository.getUsedLanguages();
  }
}
