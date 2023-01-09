


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:staff_breeze/core/network_configration/result.dart';
import 'package:staff_breeze/features/customer/domain/entities/edit_name_profile_image.dart';
import 'package:staff_breeze/features/customer/domain/use_case/edit_name_profile_image_use.dart';

@injectable
class EditNameProfileImageCubit extends Cubit<Result<EditNameProfileImageEntity>>{
  EditNameProfileImageCubit({required this.useCase}):super(const Result.initial());
  EditNameProfileImageUseCase useCase;

  Future editNameProfileImage({required String bearer_token, String? name, String? profile_image,required int user_id})async{
  return useCase.editNameProfilePhoto(bearer_token: bearer_token, user_id: user_id, name: name,profile_image: profile_image );
}
}