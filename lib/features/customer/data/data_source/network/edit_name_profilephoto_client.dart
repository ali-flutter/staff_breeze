


import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:staff_breeze/core/network_configration/base_network_config.dart';
import 'package:staff_breeze/core/network_configration/endpoints.dart';
import '../../models/edit_name_profile_photo_model.dart';
part'edit_name_profilephoto_client.g.dart';

@Singleton()
@RestApi(baseUrl: baseUrl)
abstract class EditNameProfilePhotoClient{
  @factoryMethod
  factory EditNameProfilePhotoClient(Dio dio) = _EditNameProfilePhotoClient;
  
  @POST(editNameProfilePhotoEndPoint)
  @MultiPart()
  Future<EditNameProfilePhotoModel>editNameProfilePhoto({
  @Part(name: 'user_id')required int user_id,
    @Header("Authorization")  required String bearer_token,
    @Part(name: "name")String? name,
    @Part(name: "profile_image")String? profile_photo,
});
  
}