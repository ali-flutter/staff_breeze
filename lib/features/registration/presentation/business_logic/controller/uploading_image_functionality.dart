

import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class UploadingAnImage {
  static Future<String?>pickImage({required ImageSource source}) async {
    try {
      XFile? pickedImage = await ImagePicker().pickImage(source: source);
      if (pickedImage == null) {
        return null;
      } else {
        pickedImage = XFile(pickedImage.path);
        Uint8List imagebytes = await pickedImage.readAsBytes();
        String base64Sting=base64Encode(imagebytes);
        return base64Sting;
      }
    } on PlatformException catch (e) {
      print('this is a platform exception');
      print(e);
    }
  }
}
