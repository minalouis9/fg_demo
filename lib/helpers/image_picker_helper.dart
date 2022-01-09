import 'package:fg_demo/helpers/helpers_index.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerHelper{
  static final ImagePicker _imagePicker = ImagePicker();

  static Future<String?> _pickImage(ImageSource imageSource) async {
    try{
      final XFile? image = await _imagePicker.pickImage(source: imageSource);
      if(image != null){
        String path = await LocalFileHelper.getApplicationPath();
        debugPrint(path);
        String finalPath = '$path/${image.name}';
        image.saveTo(finalPath);
        return finalPath;
      }
    }catch(e){
      debugPrint(e.toString());
      Error.safeToString(e);
    }
  }

  static Future<String?> cameraImagePicker() async {
    return await _pickImage(ImageSource.camera);
  }

  static Future<String?> galleryImagePicker() async {
    return await _pickImage(ImageSource.gallery);
  }
}