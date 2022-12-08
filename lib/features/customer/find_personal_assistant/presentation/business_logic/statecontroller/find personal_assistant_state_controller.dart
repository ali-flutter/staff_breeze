
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staff_breeze/style/app_images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
final listOfPersonalAssistantsNames=StateProvider<List<String>>((ref) => ['Emma Rose','Charlotte Smith','Amelia Noah','Eva Rosel','Oliver Hardi','Rami Sandro','James Target','Samer Yosef','Bella Rose','Sandy Odd','Elina Dast','Rami Zaher']);
final showLanguagesFilterProvider=StateProvider<bool>((ref) => false);
final showGenderFilterProvider=StateProvider<bool>((ref) => false);
final showLocationFilterProvider=StateProvider<bool>((ref) => false);
final showRateFilterProvider=StateProvider<bool>((ref) => false);

final personalAssistantListScrollController=StateProvider((ref) => ScrollController());
final filterBarHeightProvider=StateProvider<double>((ref) => 0.07);
final searchBarHeightProvider=StateProvider((ref) => 48.h);
//final listOfPersonalAssistantImages=StateProvider<List<String>>((ref) => [AppImages.reviewer_one,AppImages.reviewer_one,AppImages.reviewer_one,AppImages,AppImages.rami,AppImages.oliver,AppImages.emma]);