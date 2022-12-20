// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';


class SignUpEntity extends Equatable {
 final String? code;
  String? message;
  DataEntity? data;
  SignUpEntity({required this.code,required this.message, required this.data});
  @override
  List<Object?> get props => [code,message, data];
}

class DataEntity extends Equatable {
  String? name;
  String? email;
  String? role_id;
  int? id;
  String? token;
  DataEntity(
      {required this.name,
      required this.email,
      required this.role_id,
      required this.id,
      required this.token});
  @override
  List<Object?> get props => [name, email, role_id, id, token];
}
