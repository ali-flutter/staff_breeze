


import 'package:shared_preferences/shared_preferences.dart';

Future <void>customerNameSaver({required String name})async{
  SharedPreferences prefs=await SharedPreferences.getInstance() ;
  prefs.setString('customerName', name);
}

Future<String?>customerNameRetriever()async{
  SharedPreferences prefs=await SharedPreferences.getInstance() ;
  return prefs.getString("customerName");
}

Future<void>customerPhotoSaver({required String customerPhoto})async{
  SharedPreferences prefs=await SharedPreferences.getInstance();
  prefs.setString('customerPhoto', customerPhoto);

}
Future<String?>customerPhotoRetriever()async{
  SharedPreferences prefs=await SharedPreferences.getInstance();
  return prefs.getString('customerPhoto');
}