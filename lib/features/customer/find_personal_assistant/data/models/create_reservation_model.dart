
import 'package:json_annotation/json_annotation.dart';
part 'create_reservation_model.g.dart';

@JsonSerializable(createToJson:  false)
class CreateReservationModel {
  String code;
  CreateReservationMessageModel message;
  CreateReservationModel({required this.message,required this.code});
  factory  CreateReservationModel.fromJson(Map<String,dynamic>json)=>_$CreateReservationModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class CreateReservationMessageModel{
  List<String>error;
  CreateReservationMessageModel({required this.error});
  factory CreateReservationMessageModel.fromJson(Map<String,dynamic>json)=>_$CreateReservationMessageModelFromJson(json);

}