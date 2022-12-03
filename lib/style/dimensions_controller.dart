import 'package:flutter/cupertino.dart';

abstract class Sizer{
  static h(BuildContext context,double height){
    return MediaQuery.of(context).size.height*height;
  }
  static w(BuildContext context,double width){
    return MediaQuery.of(context).size.width*width;
  }
}