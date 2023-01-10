// ignore_for_file: non_constant_identifier_names

import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/personal_assistant/domain/entity/schedule_entity/insert_free_days.dart';


abstract class InsertFreeDaysRepository {
  Future<Result<InsertFreeDaysEntity>> insertFreeDays({
    required String bearer_token,
    required int assistant_id,
    required int hours,
    required int hourly_rate,
    required int start_at,
    required int weeks,
    required String free_days,
  });
}
