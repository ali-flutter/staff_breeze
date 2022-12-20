import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/domain/entities/get_reviews_entity.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/domain/use_cases/get_reviews_use_case.dart';

@injectable
class GetReviewsCubit extends Cubit<Result<GetReviewsEntity>> {
  GetReviewsCubit({required this.getReviewsUseCase})
      : super(const Result.initial());
  GetReviewsUseCase getReviewsUseCase;
  Future getReviews({required int assistantId}) async {
    emit(const Result.loading());
    final result = await getReviewsUseCase(assistantId: assistantId);
    emit(result);
  }
}
