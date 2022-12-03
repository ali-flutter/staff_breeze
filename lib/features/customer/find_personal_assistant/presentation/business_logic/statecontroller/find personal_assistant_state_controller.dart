import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staff_breeze/style/app_images.dart';

final listOfPersonalAssistantsNames=StateProvider<List<String>>((ref) => ['Emma Rose','Charlotte Smith','Amelia Noah','Eva Rosel','Oliver Hardi','Rami Sandro','James Target']);
final listOfPersonalAssistantImages=StateProvider<List<String>>((ref) => [AppImages.james,AppImages.eva,AppImages.amelia,AppImages.charlotte,AppImages.rami,AppImages.oliver,AppImages.emma]);