import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/personal_assistant/domain/entity/add_languages_entity.dart';
import 'package:staff_breeze/features/personal_assistant/domain/use_cases/add_languages_use_cases.dart';

@injectable
class AddLanguagesCubit
    extends Cubit<Result<AddLanguagesEntity>> {
  AddLanguagesCubit(
      {required this.addLanguagesUseCases})
      : super(const Result.initial());
  AddLanguagesUseCases addLanguagesUseCases;
  Future addLanguages({required String content_type,required String bearer,required int user_id,required String language_ids}) async {
    emit(const Result.loading());
    final result =
    await addLanguagesUseCases.addLanguages(content_type:content_type ,bearer:bearer,user_id: user_id, language_ids: language_ids);
    emit(result);
  }
}
