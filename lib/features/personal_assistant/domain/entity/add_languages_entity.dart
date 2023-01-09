import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class AddLanguagesEntity extends Equatable{
  String code;
  AddLanguagesMessageEntity message;
  
  AddLanguagesEntity({required this.code,required this.message});
  @override
  List<Object?> get props =>[code,message];

}
class AddLanguagesMessageEntity extends Equatable{
  List<String> error;
  AddLanguagesMessageEntity({required this.error});
  @override
  List<Object?> get props => [error];
}