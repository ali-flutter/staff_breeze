import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:staff_breeze/core/error/error_entity.dart';
import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/registration/domain/entities/sign_in_entity.dart';
import 'package:staff_breeze/features/registration/domain/use_cases/registration_usecases.dart';

@injectable
class SignInCubit extends Cubit<Result<SignInEntity>> {
  SignInCubit({required this.useCases}) : super(const Result.initial());
  final RegistrationUseCases useCases;

  Future signIn({required String email, required String password}) async {
    emit(const Result.loading());
    var response = await useCases.signIn(email: email, password: password);
   
    emit(response);
  }
}
