import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/domain/entities/add_about_entity.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/domain/use_cases/add_about_use_case.dart';

import '../../../../../../core/network_configration/result.dart';

@injectable
class AddAboutCubit extends Cubit<Result<AddAboutEntity>>{
  AddAboutCubit({required this.useCase}):super(Result.initial());
  AddAboutUseCase useCase;
  Future addAbout({required String bearer_token,required int user_id,required String about})async{
    emit(Result.loading());
    final result =await useCase.addAbout(bearer_token: bearer_token, user_id: user_id, about: about);
    emit(result);
  }
}