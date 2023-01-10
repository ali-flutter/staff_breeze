// ignore_for_file: non_constant_identifier_names

import 'package:injectable/injectable.dart';
import 'package:staff_breeze/core/network_configration/handle_response.dart';
import 'package:staff_breeze/features/personal_assistant/data/data_source/network/insert_free_days_client.dart';
import 'package:staff_breeze/features/personal_assistant/data/mappers/insert_free_days_mappers.dart';
import 'package:staff_breeze/features/personal_assistant/data/model/schedule_models/insert_free_days_model.dart';
import 'package:staff_breeze/features/personal_assistant/domain/entity/schedule_entity/insert_free_days.dart';
import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/personal_assistant/domain/repository/schedule_repository/insert_free_days_repository.dart';

@Singleton(as: InsertFreeDaysRepository)
class InsertFreeDaysRepositoryImp implements InsertFreeDaysRepository {
InsertFreeDaysClient cleint;
  InsertFreeDaysMappers mappers;
  InsertFreeDaysRepositoryImp({required this.cleint, required this.mappers});

  @override
  Future<Result<InsertFreeDaysEntity>> insertFreeDays({
    required String bearer_token,
    required int assistant_id,
   required int hours,
    required int hourly_rate,
     required int start_at,
      required int weeks,
       required String free_days}) => handleResponse<InsertFreeDaysModel, InsertFreeDaysEntity>(
        () => cleint.enterFreeDays(
          bearer: bearer_token,
          assistant_id: assistant_id,
          hours: hours,
          hourly_rate: hourly_rate,
          start_at: start_at,
          weeks: weeks,
          free_days: free_days,
        ),
        (response) => mappers.mapper(response),
      );
}
