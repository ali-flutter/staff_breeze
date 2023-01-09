import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/customer/domain/entities/get_customer_entity.dart';

import '../../../domain/use_case/get_customer_use_case.dart';
@injectable
class GetCustomerInfoCubit extends Cubit<Result<GetCustomerInfoEntity>>{
  GetCustomerInfoCubit({required this.useCase}):super(Result.loading())  ;
  GetCustomerUseCase useCase;
  Future getCustomerInfo({required int user_id})async{
    emit(Result.loading());
    final result =await useCase.getCustomerInfo(user_id: user_id);
    emit (result);
  }
}