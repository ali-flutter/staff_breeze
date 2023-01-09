import 'package:injectable/injectable.dart';
import 'package:staff_breeze/core/network_configration/handle_response.dart';
import 'package:staff_breeze/core/network_configration/result.dart';

import 'package:staff_breeze/features/customer/find_personal_assistant/domain/entities/add_about_entity.dart';

import '../../domain/repository/add_about_repository.dart';
import '../data_source/network/add_about_client.dart';
import '../mapper/add_about_mapper.dart';
import '../models/add_about_model.dart';
@Singleton(as:AddAboutRepository )
class AddAboutRepoImp implements AddAboutRepository{
  AddAboutRepoImp({required this.mapper,required this.cleint});
  AddAboutMapper mapper;
  AddAboutCleint cleint;
  @override
  Future<Result<AddAboutEntity>> addAbout({required String bearer_token, required int user_id, required String about}) =>
      handleResponse<AddAboutModel,AddAboutEntity>(
              () => cleint.addAbout(bearer_token: bearer_token, user_id: user_id, about: about),
              (response) => mapper.mapper(response));

}