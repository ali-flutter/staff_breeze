import 'package:equatable/equatable.dart';

class SignUpEntity extends Equatable{

  String? message;
  DataEntity? data;
  SignUpEntity({required this.message,required this.data});
  @override
  List<Object?> get props => [message,data];

}
class DataEntity extends Equatable{
  String? name;
  String? email;
  String? role;

  int? id;
  String? token;
  DataEntity({required this.name,required this.email,required this.role , required this.id,required this.token});
  @override
  List<Object?> get props => [name,email,role , id ,token];

}