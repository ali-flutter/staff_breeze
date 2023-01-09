// ignore_for_file: non_constant_identifier_names

import 'package:injectable/injectable.dart';
import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/domain/entities/get_free_days_entity.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/domain/repository/get_free_days_repository.dart';


@injectable
class GetFreeDaysUsecase {
  GetFreeDayRepository getFreeDayRepository;
  GetFreeDaysUsecase({required this.getFreeDayRepository});
  Future<Result<GetFreeDaysEntity>> getFreeDays({
    required int user_id,
    required String bearer_Token,
  }) {
    return getFreeDayRepository.getFreeDays(bearer_token: bearer_Token, user_id: user_id);
  }
}
