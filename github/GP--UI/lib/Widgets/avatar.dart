import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import '../helper/utils.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class Avatar extends StatefulWidget {
  const Avatar({Key? key});

  @override
  State<Avatar> createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  Uint8List? _image;

  void selectImage() async {
    Uint8List? img = await pickImage(ImageSource.gallery);
    if (img != null) {
      String base64Image = base64Encode(img);

      // جسب الموقع الخاص بالخادم الذي تقوم بإرسال الصورة إليه
      final url = Uri.parse('YOUR_ENDPOINT');

      // إعداد البيانات التي سترسلها في الطلب
      final Map<String, String> data = {
        'image': base64Image,
      };

      // إرسال الطلب POST إلى الخادم
      final response = await http.post(
        url,
        body: data,
      );

      // التحقق من رمز الحالة للتأكد من نجاح الطلب
      if (response.statusCode == 200) {
        // قم بمعالجة الاستجابة هنا إذا كانت هناك حاجة لذلك
        setState(() {
          _image = img;
        });
      } else {
        // في حالة عدم نجاح الطلب، يمكنك إجراء معالجة خاصة هنا
        print('Failed to upload image. Error: ${response.reasonPhrase}');
      }
    }
    setState(() {
        _image = img;
      });

  }

      

  

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                width: 110,
                height: 110,
                decoration: BoxDecoration(
                  border: Border.all(width: 8, color: Colors.white),
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 2,
                      blurRadius: 10,
                      color: Colors.black.withOpacity(0.1),
                    ),
                  ],
                  shape: BoxShape.circle,
                  image: _image != null
                      ? DecorationImage(
                          image: MemoryImage(_image ?? Uint8List(0)),
                          fit: BoxFit.cover,
                        )
                      : const DecorationImage(
                          image: AssetImage("assets/images/head.jpg"),
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0.01,
                child: InkWell(
                  onTap: selectImage,
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: const Color.fromARGB(66, 88, 88, 88),
                          spreadRadius: 1,
                          blurRadius: 15,
                        ),
                      ],
                      shape: BoxShape.circle,
                      border: Border.all(width: 1, color: Colors.white),
                      color: Colors.white,
                    ),
                    child: const Icon(
                      Icons.camera_alt,
                      color: Colors.grey,
                      size: 15,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20), // Add spacing between the avatar and text
          Text(
            'User Name', // Replace with the desired text
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.black, // Adjust text color as needed
            ),
          ),
          const SizedBox(height: 8), // Add spacing between the avatar and text
          Text(
            'Your Profile', // Replace with the desired text
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black87, // Adjust text color as needed
            ),
          ),
        ],
      ),
    );
  }
}
