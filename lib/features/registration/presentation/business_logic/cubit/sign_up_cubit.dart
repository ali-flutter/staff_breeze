// ignore_for_file: non_constant_identifier_names, depend_on_referenced_packages

import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:injectable/injectable.dart';
import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/registration/domain/entities/sign_up_entity.dart';
import 'package:staff_breeze/features/registration/domain/use_cases/add_device_token_use_case.dart';
import 'package:staff_breeze/features/registration/domain/use_cases/registration_usecases.dart';
import 'package:staff_breeze/features/registration/presentation/business_logic/cubit/add_device_token_cubit.dart';



@injectable
class SignUpCubit extends Cubit<Result<SignUpEntity>> {
  SignUpCubit({required this.useCases}) : super(const Result.initial());
  RegistrationUseCases useCases;
   Future signUp({
        required String name,
      required String email,
      required String password,
    required String password_confirmation,
      required int role_id}) async {
    emit(const Result.loading());
    var response =  await useCases.signUp(
        name:name,
        password_confirmation: password_confirmation,
        email: email,
        password: password,
        role_id:role_id);
    emit(response);
  }
}
