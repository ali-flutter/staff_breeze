
import 'package:bloc/bloc.dart';

import 'package:injectable/injectable.dart';
import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/domain/entities/get_used_languages_entity.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/domain/use_cases/get_used_languages_usecase.dart';
@injectable
class GetUsedLanguagesCubit extends Cubit<Result<GetUsedLanguagesEntity>> {
  GetUsedLanguagesCubit({required this.getUsedLanguagesUseCase})
      : super(const Result.initial());
  final GetUsedLanguagesUseCase getUsedLanguagesUseCase;
  Future getUsedLanguages() async {
    emit(const Result.loading());
    final result = await getUsedLanguagesUseCase();
    emit(result);
  }
}
