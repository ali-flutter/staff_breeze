
import 'package:equatable/equatable.dart';

class SummaryPageEntity extends Equatable{
  String code;
  SummaryPageDataEntity data;
  SummaryPageEntity({required this.code,required this.data});


  @override
  List<Object?> get props => [code,data];

}

class SummaryPageDataEntity extends Equatable{
  int? total_payment;
  String? starts_at;
  String? ends_at;
  SummaryPageDataEntity({required this.ends_at,required this.starts_at,required this.total_payment});


  @override
  List<Object?> get props => [ends_at,starts_at,total_payment];

}