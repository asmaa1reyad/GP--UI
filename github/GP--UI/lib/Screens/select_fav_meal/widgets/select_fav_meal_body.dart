import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../Screens/Dashboard.dart';
import 'custom_meal_item.dart';
import 'custom_txt_form.dart';
import 'package:http/http.dart' as http;
class SelectFavMealBody extends StatefulWidget {
  const SelectFavMealBody({super.key});

  @override
  State<SelectFavMealBody> createState() => __SelectFavMealBodyStateState();
}

class __SelectFavMealBodyStateState extends State<SelectFavMealBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 10,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/vector.png"),
                filterQuality: FilterQuality.high,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Column(
                    children: [
                      SizedBox(height: 10.h),
                      Text(
                        "Please , Select your favorites meals to help us to find your request ",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.poppins(
                          fontSize: 20.sp,
                          color: const Color.fromARGB(221, 29, 29, 29),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 24),
                        child: MealsListView(),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(height: 15.h),
                      Text(
                        "Do you have any other favorites varieties ?",
                        style: GoogleFonts.poppins(
                          fontSize: 16.sp,
                          color: const Color.fromARGB(221, 29, 29, 29),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 100,
                        width: 500,
                        child: CustomTextField(
                          maxLines: 3,
                          hintTxt: "Write here",
                          labelTxt: "Enter your favorites varieties...",
                        ),
                      ),
                      const SizedBox(height: 32),
                      Align(
                        alignment: Alignment.centerRight,
                        child: SizedBox(
                          height: 50,
                          width: 175,

                
                          child: ElevatedButton(
                            onPressed: () {
                              sendRequest();
                              Timer(const Duration(seconds: 3), () {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => const Dashboard(),
                                  ),
                                );
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 255, 105, 36),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: const EdgeInsets.symmetric(),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Continue",
                                  style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1,
                                  ),
                                ),
                                const Icon(
                                  Icons.double_arrow_rounded,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

class MealsListView extends StatelessWidget {
  const MealsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, __) => const SizedBox(width: 16),
        separatorBuilder: (_, __) => const CustomMealItem(meal: "fish fish"),
        itemCount: 10,
      ),
    );
  }
}


Future<void> sendRequest() async {
  // عنوان الخادم الذي سيتم إرسال الريكويست إليه
  const String url = 'http://example.com/api/submit_preferences';

  try {
    // إرسال الريكويست
    final response = await http.post(Uri.parse(url));

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