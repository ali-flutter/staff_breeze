import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final scheduleAvailableTimePerDay=StateProvider<String>((ref) => 'Available times per day');
final scheduleRepeatForNumberOfWeeks=StateProvider<String>((ref)=>'Repeat for number of weeks');
