import 'package:flutter_riverpod/flutter_riverpod.dart';

final customerNewNameProvider=StateProvider<String?>((ref) => null);
final customerUploadedImageProvider =StateProvider<String?>((ref) => null);
final uploadingAnImageStatus=StateProvider.autoDispose<String>((ref) =>"Upload a photo");