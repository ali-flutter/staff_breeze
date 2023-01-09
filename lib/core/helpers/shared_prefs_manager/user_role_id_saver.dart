import 'package:shared_preferences/shared_preferences.dart';

userRoleIdSaver({required String roleId}) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
   sharedPreferences.setString('UserRoleId', roleId);
}

Future<String?> userRoleIdRetriever() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  final result = sharedPreferences.getString('UserRoleId');
  return result;
}
