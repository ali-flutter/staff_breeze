// ignore_for_file: non_constant_identifier_names

import 'package:injectable/injectable.dart';
import 'package:staff_breeze/core/network_configration/handle_response.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/data/data_source/network/get_free_days_cleint.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/data/mapper/get_free_days_mappers.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/data/models/get_free_days_model.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/domain/entities/get_free_days_entity.dart';
import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/domain/repository/get_free_days_repository.dart';


@Singleton(as: GetFreeDayRepository)
class GetFreeDaysRepositoryImp implements GetFreeDayRepository{
  GetFreeDaysCleint cleint;
  GetFreeDaysMappers mappers;
  GetFreeDaysRepositoryImp({required this.cleint,required this.mappers});
  @override
  Future<Result<GetFreeDaysEntity>> getFreeDays({required String bearer_token, required int user_id})=>
  handleResponse<GetFreeDaysModel,GetFreeDaysEntity>(
    ()=>cleint.getFreeDays(bearer_token: bearer_token, user_id: user_id),
    (response)=> mappers.mapper(response));
}