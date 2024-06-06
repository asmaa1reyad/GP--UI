import 'package:flutter/material.dart';
import 'package:foodhub/Widgets/text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'select_fav_meal/widgets/custom_txt_form.dart';
import 'package:http/http.dart' as http;

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          actions: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 38,
                        width: 38,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color.fromARGB(255, 236, 234, 234),
                                  blurRadius: 20,
                                  spreadRadius: 1)
                            ]),
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          children: [
                            Text(
                              "Add new Address",
                              style: GoogleFonts.poppins(
                                  color: Colors.black87, fontSize: 17.sp),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
          backgroundColor: Colors.white,
          elevation: 0,
          toolbarHeight: 100,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(children: [
            SizedBox(height: 40),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text(
                    "Full Name",
                    style: TextStyle(color: Colors.black54),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15), // Adjust this value as needed
            const CustomTextField(labelTxt: "User Name"),
            const SizedBox(height: 0),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text(
                    "Mobile Number",
                    style: TextStyle(color: Colors.black54),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15), // Adjust this value as needed
            const CustomTextField(labelTxt: "+20"),
            const SizedBox(height: 0),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text(
                    "State",
                    style: TextStyle(color: Colors.black54),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15), // Adjust this value as needed
            const CustomTextField(labelTxt: "your state"),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text(
                    " City",
                    style: TextStyle(color: Colors.black54),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15), // Adjust this value as needed
            const CustomTextField(labelTxt: "your city"),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text(
                    "Street (include house number)",
                    style: TextStyle(color: Colors.black54),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15), // Adjust this value as needed
            const CustomTextField(labelTxt: "House no 32/5 F11/ main street"),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.5,
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromARGB(95, 163, 163, 163),
                          spreadRadius: 1,
                          blurRadius: 30,
                          offset: Offset(00, 20))
                    ],
                    color: Colors.orange.shade800,
                    borderRadius: BorderRadius.circular(30)),
                    
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [

                      
                  Text(
                     
                    "Save",
                    style: GoogleFonts.poppins(
                      fontSize: 18.sp,
                      color: const Color.fromARGB(221, 255, 255, 255),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  
                      
                ]),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

Future<void> sendRequest() async {
  // عنوان الخادم الذي سيتم إرسال الريكويست إليه
  const String url = 'http://example.com/api/save_address';

  try {
    // إرسال الريكويست
    final response = await http.post(
      Uri.parse(url),
      // يمكنك إرسال بيانات إضافية هنا إذا كانت مطلوبة
      // body: {
      //   'name': 'John Doe',
      //   'mobile': '+201234567890',
      //   'state': 'Cairo',
      //   'city': 'New Cairo',
      //   'street': '123 Main St',
      // },
    );

    // التحقق من رمز الاستجابة
    if (response.statusCode == 200) {
      // يمكنك تنفيذ أي إجراءات إضافية هنا بعد الاستجابة الناجحة
      print('Request sent successfully');
    } else {
      // في حالة فشل الريكويست
      print('Failed to send request: ${response.reasonPhrase}');
    }
  } catch (e) {
    // في حالة حدوث خطأ أثناء إرسال الريكويست
    print('Error sending request: $e');
  }
}