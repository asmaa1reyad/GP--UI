import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

pickImage(ImageSource source) async {
  final ImagePicker imagePicker = ImagePicker();
  XFile? file = await imagePicker.pickImage(source: source);
  if (file != null) {
    return await file.readAsBytes();
  }
  debugPrint('No Image Selected');
}
Future<void> pickImageAndUpload(ImageSource source) async {
  final ImagePicker imagePicker = ImagePicker();
  XFile? file = await imagePicker.pickImage(source: source);
  if (file != null) {
    var request = http.MultipartRequest('POST', Uri.parse('https://example.com/upload'));
    request.files.add(await http.MultipartFile.fromPath('image', file.path));
    
    try {
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);
      
      if (response.statusCode == 200) {
        print('Image uploaded successfully');
      } else {
        print('Failed to upload image. Error: ${response.reasonPhrase}');
      }
    } catch (error) {
      print('Error uploading image: $error');
    }
  } else {
    debugPrint('No Image Selected');
  }
}