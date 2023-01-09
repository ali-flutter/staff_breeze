import 'package:injectable/injectable.dart';

import '../../../../../core/network_configration/result.dart';
import '../entities/add_about_entity.dart';
import '../repository/add_about_repository.dart';


@injectable
class AddAboutUseCase{
  AddAboutRepository repository;
  AddAboutUseCase({required this.repository});
  Future<Result<AddAboutEntity>>addAbout({
    required String bearer_token,
    required int user_id,
    required String  about
  }){
    return repository.addAbout(bearer_token: bearer_token, user_id: user_id, about: about);
  }
}