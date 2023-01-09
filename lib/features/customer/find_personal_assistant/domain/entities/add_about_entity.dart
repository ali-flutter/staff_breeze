import 'package:equatable/equatable.dart';

class AddAboutEntity extends Equatable{
  String code;
  AddAboutMessageEntity message;
  AddAboutEntity({required this.code,required this.message});
  @override
  List<Object?> get props => [code,message];

}
class AddAboutMessageEntity extends Equatable{
  List<String>error;
  AddAboutMessageEntity({required this.error});
  @override
  List<Object?> get props =>[error];

}