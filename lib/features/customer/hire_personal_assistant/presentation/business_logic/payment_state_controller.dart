import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cardNumberController =StateProvider<String>((ref) => '');

final selectedDatesProvider= StateProvider.autoDispose<List<DateTime?>>((ref) => []);

