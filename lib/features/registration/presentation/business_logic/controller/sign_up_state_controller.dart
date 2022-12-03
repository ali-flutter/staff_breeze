import 'package:flutter_riverpod/flutter_riverpod.dart';


/// [Sign Up] state providers
final signUpUserNameProvider=StateProvider<String>((ref) => '');
final signUpFirstNameProvider=StateProvider<String>((ref) => 'null');
final signUpLastNameProvider=StateProvider<String>((ref) => '');
final signUpEmailProvider=StateProvider<String>((ref) => '');
final signUpPasswordProvider=StateProvider<String>((ref) => '');
final signUpConfirmPasswordProvider=StateProvider<String>((ref) => '');
/// [Account type id] provider
final signUpAccountTypeIdProvider=StateProvider<int>((ref) => 0);
