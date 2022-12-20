import 'package:flutter_riverpod/flutter_riverpod.dart';

final newPasswordProvider = StateProvider<String>((ref) => '');
final newPasswordConfirmationProvider = StateProvider((ref) => '');
