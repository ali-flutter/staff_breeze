

// ignore_for_file: non_constant_identifier_names

import 'package:staff_breeze/features/customer/find_personal_assistant/domain/entities/get_free_days_entity.dart';

import '../../../../../core/network_configration/result.dart';

abstract class GetFreeDayRepository{
  
  Future<Result<GetFreeDaysEntity>>getFreeDays({
   required String bearer_token,
   required int user_id,
  });

}