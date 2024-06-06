import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Text_field extends StatelessWidget {
  final String Maintext;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  Text_field({required this.Maintext, this.controller, this.validator});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.09,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: const BoxDecoration(boxShadow: [
          BoxShadow(
            blurRadius: 30,
            spreadRadius: 1,
            color: Color.fromARGB(17, 3, 4, 90),
          ),
        ]),
        child: TextFormField(
          controller: controller,
          validator: validator,
          textAlign: TextAlign.start,
          textInputAction: TextInputAction.none,
          obscureText: false,
          keyboardType: TextInputType.emailAddress,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                  vertical: 8, horizontal: 8), // Adjust the padding
              fillColor: Color.fromARGB(255, 252, 252, 252),
              filled: true,
              labelText: Maintext,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 255, 102, 0),
                  ),
                  borderRadius: BorderRadius.circular(10))),
        ),
      ),
    );
  }
}

Future<void> fetchData() async {
  final url = 'http://example.com/data'; // استبدل هذا بعنوان URL الفعلي
  final response = await http.get(Uri.parse(url));
  
  if (response.statusCode == 200) {
    // قم بتحليل البيانات واستخدامها هنا
    // مثال: استخدم setState لتحديث واجهة المستخدم بالبيانات المستلمة
  } else {
    // التعامل مع الأخطاء هنا
    print('Failed to load data: ${response.statusCode}');
  }
}
