// ignore_for_file: non_constant_identifier_names

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/domain/entities/get_free_days_entity.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/domain/use_cases/get_free_days_usecases.dart';


@injectable
class GetFreeDaysCubit extends Cubit<Result<GetFreeDaysEntity>> {
  GetFreeDaysCubit({required this.getFreeDaysUsecase}) : super(const Result.initial());
  GetFreeDaysUsecase getFreeDaysUsecase;

  Future getFreeDays({required int user_id, required String bearer_token}) async {
    emit(const Result.loading());

    final result = await getFreeDaysUsecase.getFreeDays(user_id: user_id, bearer_Token: bearer_token);
    emit(result);
  }
}
