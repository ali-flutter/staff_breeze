import 'package:json_annotation/json_annotation.dart';
import 'package:staff_breeze/features/customer/data/models/get_customer_reservation_model.dart';
part 'get_assistant_reservation_model.g.dart';
@JsonSerializable(createToJson: false)
class GetAssistantReservationModel{
  String code;
  GetAssistantReservationMessageModel message;
  List<GetAssistantReservationDataModel> data;
  GetAssistantReservationModel({required this.message,required this.data,required this.code});
  factory GetAssistantReservationModel.fromJson(Map<String,dynamic>json)=>_$GetAssistantReservationModelFromJson(json);
}
@JsonSerializable()
class GetAssistantReservationMessageModel{
  List<String>error;
  GetAssistantReservationMessageModel({required this.error});
  factory GetAssistantReservationMessageModel.fromJson(Map<String,dynamic>json)=>_$GetAssistantReservationMessageModelFromJson(json);
}

  @JsonSerializable()
class GetAssistantReservationDataModel{
  CustomerDataModel customer;
  List<String> reservation_dates;
  GetAssistantReservationDataModel({required this.customer,required this.reservation_dates});
  factory GetAssistantReservationDataModel.fromJson(Map<String,dynamic>json)=>_$GetAssistantReservationDataModelFromJson(json);
}
@JsonSerializable()
class CustomerDataModel{
   int id;
   String name;
   String email;
   String emailVerifiedAt;
   List<RoleObjectModel> role;
   List<CityObjectModel> city;
   List<CountryObjectModel> country;
   int is_male;
   String about;
   String phone_number;
   String profile_image;
   List<EducationsObjectModel> educations;
   int complete;
   int rating_avrage;
   List<LanguagesObjectModel> languages;
   List<ServicesObjectModel> services;
   CustomerDataModel({required this.email,required this.city,required this.role,required this.is_male,required this.about,required this.languages,required this.services,required this.country,required this.complete,required this.id,required this.name,required this.profile_image,required this.educations,required this.rating_avrage,required this.phone_number,required this.emailVerifiedAt,}) ;
  factory CustomerDataModel.fromJson(Map<String,dynamic>json)=>_$CustomerDataModelFromJson(json);
}