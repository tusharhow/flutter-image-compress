import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';


class ImageController extends ChangeNotifier {
  File? originalImage;
  File? compressedImage;
  String compressedPath = '/storage/emulated/0/Download/';


  Future<void> pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      originalImage = File(pickedImage.path);
      print(originalImage!.lengthSync());
      notifyListeners();
    }
  }

  Future<void> compressImage() async {
    final compressedImageFile = await FlutterImageCompress.compressAndGetFile(
      originalImage!.path,
      '$compressedPath${DateTime.now().millisecondsSinceEpoch}.jpg',
      quality: 50,
    );
    if (compressedImageFile != null) {
      compressedImage = compressedImageFile;
      print(compressedImage!.lengthSync());
      notifyListeners();
    }
  }
}
