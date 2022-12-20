// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:staff_breeze/core/network_configration/base_network_config.dart';
import 'package:staff_breeze/core/network_configration/endpoints.dart';
import 'package:staff_breeze/features/customer/find_personal_assistant/data/models/get_all_assistant_model.dart';
import 'package:staff_breeze/features/registration/data/model/complete_registration_model/countries_model.dart';
import 'package:staff_breeze/features/registration/data/model/complete_registration_model/edit_user_details_model.dart';
import 'package:staff_breeze/features/registration/data/model/complete_registration_model/languages_model.dart';

import '../../../model/complete_registration_model/education_model.dart';
part 'complete_registraition_client.g.dart';

@Singleton()
@RestApi(baseUrl: baseUrl)
abstract class CompleteRegistrationCleint {
  @factoryMethod
  factory CompleteRegistrationCleint(Dio dio) = _CompleteRegistrationCleint;
  @GET(educationEndPoint)
  Future<EducationsModel> getEducation();
  @GET(languagesEndPoint)
  Future<AllLanguagesModel> getLanguages();
  @GET(countriesEndPoint)
  Future<CountriesModel> getCountries();
  @POST(editUserDetailsEndPoint)
  @MultiPart()
  Future<EditUserDetailsModel> editDetails({
    @Part(name: "user_id") int? user_id,
    @Part(name: "email") String? email,
    @Part(name: "is_male") int? is_male,
    @Part(name: "city_id") int? city_id,
    @Part(name: "country_id") int? country_id,
    @Part(name: "profile_image") String? profile_image,
    @Part(name: "phone_number") String? phone_number,
    @Part(name: "location") String? location,
    @Part(name:"about") String? about,
  });
}
