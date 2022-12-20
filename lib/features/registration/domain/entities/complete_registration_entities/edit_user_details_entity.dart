import 'package:equatable/equatable.dart';

class EditUserDetailsEntity extends Equatable{
 final  String code;
  final EditUserDetailsMessage message;
  final List<EditUserDetailsDataEntity> data;
  const EditUserDetailsEntity({required this.code, required this.message,required this.data});
  
  @override
  List<Object?> get props => [code,message,data];
}

class EditUserDetailsMessage extends Equatable{
 final List<String> error;
 const  EditUserDetailsMessage({required this.error});
  
  @override
  List<Object?> get props =>[error];
  
}

class EditUserDetailsDataEntity extends Equatable{
  @override
  List<Object?> get props =>[];
 
}
