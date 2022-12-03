import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/registration/domain/entities/sign_up_entity.dart';
import 'package:staff_breeze/features/registration/domain/use_cases/registration_usecases.dart';

import '../../data/mapper/sign_up_mapper.dart';

@injectable
class SignUpCubit extends Cubit<Result<SignUpEntity>> {
  SignUpCubit({required this.useCases}) : super(const Result.initial());
  RegistrationUseCases useCases;

  Future signUp({
        required String name,
      required String email,
      required String password,
    required String password_confirmation,
      required int accountTypeId}) async {
    emit(const Result.loading());
    var response =  await useCases.signUp(
        name:name,
        password_confirmation: password_confirmation,
        email: email,
        password: password,
        accountTypeId: accountTypeId);
    emit(response);
  }
}
