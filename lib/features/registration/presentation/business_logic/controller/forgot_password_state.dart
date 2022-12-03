import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final forgotPasswordEmailProvider=StateProvider<String>((ref) => '');
final forgotPasswordCodeProvider=StateProvider<String>((ref)=>'');
final forgotPasswordNewPasswordProvider=StateProvider<String>((ref) => '');
final forgotPasswordPasswordConfirmationProvider=StateProvider<String>((ref) => '');
final forgotPasswordBorderColorProvider=StateProvider.autoDispose<Color>((ref)=>Color(0xffC1BAC6));