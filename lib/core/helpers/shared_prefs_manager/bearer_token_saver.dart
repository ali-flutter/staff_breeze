
import 'package:shared_preferences/shared_preferences.dart';

Future<void>bearerTokenSaver(String bearer)async{
SharedPreferences sharedPreferences=await SharedPreferences.getInstance() ;
sharedPreferences.setString('bearerToken', bearer);
}
Future<String?>bearerTokenRetreiver()async{
SharedPreferences sharedPreferences=await SharedPreferences.getInstance() ;
return sharedPreferences.getString('bearerToken');
}