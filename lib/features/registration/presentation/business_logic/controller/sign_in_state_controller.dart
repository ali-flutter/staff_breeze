import 'package:flutter_riverpod/flutter_riverpod.dart';

final signInEmailProvider=StateProvider<String>((ref) => '');
final singInPasswordProvider=StateProvider<String>((ref) => '');
final signInObscurePasswordProvider=StateProvider<bool>((ref)=>true) ;