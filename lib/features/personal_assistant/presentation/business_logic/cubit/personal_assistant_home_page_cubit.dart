import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/personal_assistant/domain/entity/perosnal_assistant_home_page_entity.dart';
import 'package:staff_breeze/features/personal_assistant/domain/use_cases/personal_assistant_use_cases.dart';

@injectable
class PersonalAssistantHomePageCubit
    extends Cubit<Result<PersonalAssistantHomePageEntity>> {
  PersonalAssistantHomePageCubit(
      {required this.personalAssistantHomePageUseCases})
      : super(const Result.initial());
  PersonalAssistantHomePageUseCases personalAssistantHomePageUseCases;
  Future getPersonalAssistant({required int id}) async {
    emit(const Result.loading());
    final result =
       await personalAssistantHomePageUseCases.getPersonalAssistant(id: id);
    emit(result);
  }
}
