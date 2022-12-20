import 'package:equatable/equatable.dart';

class GetReviewsEntity extends Equatable {
  String? code;
  MessageReviewsEntity? message;
  List<DataReviewsEntity> data;
  GetReviewsEntity(
      {required this.code, required this.data, required this.message});
  @override
  List<Object?> get props => [code, message, data];
}

class MessageReviewsEntity extends Equatable {
  final List<String>? error;
  const MessageReviewsEntity({required this.error});
  @override
  List<Object?> get props => [error];
}

class DataReviewsEntity extends Equatable {
  final int id;
  final int clientId;
  final String clientName;
  final String clientProfileImage;
  final String body;
  final int isRead;
  final int accepted;
  final String createdAt;

  const DataReviewsEntity({
    required this.id,
    required this.clientId,
    required this.clientName,
    required this.clientProfileImage,
    required this.body,
    required this.isRead,
    required this.accepted,
    required this.createdAt,
  });
  @override
  List<Object?> get props =>
      [id, clientId, clientName, clientProfileImage, body, isRead, accepted,createdAt];
}
