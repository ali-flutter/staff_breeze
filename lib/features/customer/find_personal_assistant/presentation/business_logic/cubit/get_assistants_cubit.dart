// ignore_for_file: non_constant_identifier_names

import 'dart:isolate';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:injectable/injectable.dart';
import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/domain/entities/get_assistant_entity.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/domain/use_cases/get_assistant_use_case.dart';

@injectable
class GetAssistantsCubit extends Cubit<Result<GetAssistantEntity>> {
  GetAssistantsCubit({required this.getAssistantUseCase}) : super(const Result.initial() );
  final int pageSize = 10;
  int pageKey = 1;
  final PagingController<int, AssistantsDataEntity> pagingController = PagingController(firstPageKey: 1);
  final GetAssistantUseCase getAssistantUseCase;
  Future getAllAssistants({
    required int page,
    required int pageSize,
    String? search,
    int? city,
    List<int>? language,
    List<int>? education,
    double? rating,
    int? is_male,
    List<int>? services,
    int? country,
  }) async {
    emit(Result.loading());

      final response = await getAssistantUseCase(
      page: pageKey,
      pageSize: pageSize,
      city: city,
      language: language,
      education: education,
      is_male: is_male,
      rating: rating,
      search: search,
      services: services,
      country: country,
    );
      
     emit(response);
  }
}
