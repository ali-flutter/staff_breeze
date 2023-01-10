// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

NotificationModel? notificationModelFromJson(String str) => NotificationModel.fromJson(json.decode(str));

String notificationModelToJson(NotificationModel? data) => json.encode(data!.toJson());

class NotificationModel {
  NotificationModel({
    this.id,
    this.senderId,
    this.senderImage,
    this.receiverId,
    this.title,
    this.body,
    this.type,
    this.isRead,
    this.createdAt,
    this.updateAt,
  });

  int? id;
  int? senderId;
  String? senderImage;
  int? receiverId;
  String? title;
  String? body;
  String? type;
  int? isRead;
  String? createdAt;
  dynamic updateAt;

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
    id: json["id"],
    senderId: json["sender_id"],
    senderImage: json["sender_image"],
    receiverId: json["receiver_id"],
    title: json["title"],
    body: json["body"],
    type: json["type"],
    isRead: json["is_read"],
    createdAt: json["created_at"],
    updateAt: json["update_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "sender_id": senderId,
    "sender_image": senderImage,
    "receiver_id": receiverId,
    "title": title,
    "body": body,
    "type": type,
    "is_read": isRead,
    "created_at": createdAt,
    "update_at": updateAt,
  };
}
