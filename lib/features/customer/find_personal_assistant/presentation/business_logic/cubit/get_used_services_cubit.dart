import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/domain/entities/get_used_services_entity.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/domain/use_cases/get_used_services_use_cases.dart';

@injectable
class GetUsedServicesCubit extends Cubit<Result<GetUsedServicesEntity>> {
  GetUsedServicesCubit({required this.getUsedServicesUseCase}) : super(const Result.initial());
  GetUsedServicesUseCase getUsedServicesUseCase;
  Future getUsedServices()async{
    emit(Result.loading());
    final result = await getUsedServicesUseCase.getUsedServices() ;
    emit(result);
  }
}
