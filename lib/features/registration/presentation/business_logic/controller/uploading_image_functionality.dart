

import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class UploadingAnImage {
  static Future<XFile?>pickImage({required ImageSource source}) async {
    try {
      XFile? pickedImage = await ImagePicker().pickImage(source: source);
      if (pickedImage == null) {
        return null;
      } else {
        pickedImage = XFile(pickedImage.path);
        return pickedImage;
      }
    } on PlatformException catch (e) {
      print(e);
    }
  }
}
