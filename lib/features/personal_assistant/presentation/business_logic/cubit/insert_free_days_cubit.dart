// ignore_for_file: non_constant_identifier_names

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/personal_assistant/domain/entity/schedule_entity/insert_free_days.dart';
import 'package:staff_breeze/features/personal_assistant/domain/repository/schedule_repository/insert_free_days_repository.dart';
import 'package:staff_breeze/features/personal_assistant/domain/use_cases/insert_free_days_use_case.dart';

@injectable
class InsertFreeDaysCubit extends Cubit<Result<InsertFreeDaysEntity>> {
  InsertFreeDaysCubit({required this.insertFreeDaysUseCase}) : super(const Result.initial());
  InsertFreeDaysUseCase insertFreeDaysUseCase;
  Future InserFreeDays({
    required String bearer_token,
    required int assistant_id,
    required int hours,
    required int hourly_rate,
    required int start_at,
    required int weeks,
    required String free_days,
  }) async {
    emit(const Result.loading());
    final result = await insertFreeDaysUseCase.insertFreeDays(
      bearer_token: bearer_token,
      assistant_id: assistant_id,
    hours: hours,
     hourly_rate: hourly_rate,
      start_at: start_at,
       weeks: weeks,
       free_days: free_days,
       );
    emit(result);
  }
}
