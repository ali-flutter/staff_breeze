// ignore_for_file: non_constant_identifier_names

import 'package:bloc/bloc.dart';

import 'package:injectable/injectable.dart';
import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/domain/entities/get_assistant_entity.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/domain/use_cases/get_assistant_use_case.dart';

@injectable
class GetAssistantsCubit extends Cubit<Result<GetAssistantEntity>> {
  GetAssistantsCubit({required this.getAssistantUseCase})
      : super(const Result.initial());
  final GetAssistantUseCase getAssistantUseCase;
  Future getAllAssistants({String? search,int? city,int? language, int? education, double? rating, int? is_male}) async {
    emit(const Result.loading());
    var response = await getAssistantUseCase(
      page: 1,
       pageSize: 10,
       city: city,
       language: language,
       education: education,
       is_male: is_male,
       rating: rating,
       search:search);
    emit(response);
  }
}
