// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
part 'get_reviews_model.g.dart';

@JsonSerializable()
class GetReviewsModel {
  String? code;
  MessageReviewsModel? message;
  List<DataReviewsModel> data;

  GetReviewsModel(
      {required this.code, required this.data, required this.message});

  factory GetReviewsModel.fromJson(Map<String, dynamic> json) =>
      _$GetReviewsModelFromJson(json);
}

@JsonSerializable()
class MessageReviewsModel {
  List<String>? error;

  MessageReviewsModel({required this.error});
  factory MessageReviewsModel.fromJson(Map<String, dynamic> json) =>
      _$MessageReviewsModelFromJson(json);
}

@JsonSerializable()
class DataReviewsModel {
  int id;

  int client_id;
  String client_name;
  String client_profile_image;
  String body;
  int? is_read;
  int? accepted;
  String? created_at;

  DataReviewsModel({
    required this.id,
    required this.client_id,
    required this.client_name,
    required this.client_profile_image,
    required this.body,
    required this.is_read,
    required this.accepted,
    required this.created_at,
  });

  factory DataReviewsModel.fromJson(Map<String, dynamic> json) =>
      _$DataReviewsModelFromJson(json);
}
