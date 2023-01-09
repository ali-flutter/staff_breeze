// ignore_for_file: non_constant_identifier_names

import 'package:injectable/injectable.dart';
import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/personal_assistant/domain/entity/schedule_entity/insert_free_days.dart';
import 'package:staff_breeze/features/personal_assistant/domain/repository/schedule_repository/insert_free_days_repository.dart';

@injectable
class InsertFreeDaysUseCase {
  InsertFreeDaysUseCase({required this.insertFreeDaysRepository});
  InsertFreeDaysRepository insertFreeDaysRepository;
  Future<Result<InsertFreeDaysEntity>> insertFreeDays({
    required String bearer_token,
    required int assistant_id,
    required int hours,
    required int hourly_rate,
    required int start_at,
    required int weeks,
    required List<String> free_days,
  }) =>
      insertFreeDaysRepository.insertFreeDays(
        bearer_token: bearer_token,
        assistant_id: assistant_id,
        hours: hours,
        hourly_rate: hourly_rate,
        start_at: start_at,
        weeks: weeks,
        free_days: free_days,
      );
}
