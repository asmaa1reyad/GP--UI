import 'package:flutter/material.dart';
import 'package:foodhub/Widgets/seller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../Screens/Food_Details.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class card02 extends StatelessWidget {
  final String mainText;
  final String image;
  final String Rating;

  card02({required this.Rating, required this.image, required this.mainText});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.rightToLeft,
            child: Food_Details(),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.35,
              width: MediaQuery.of(context).size.width * 0.6,
              decoration: BoxDecoration(boxShadow: const [
                BoxShadow(
                    color: Colors.black12,
                    blurRadius: 15,
                    spreadRadius: 1,
                    offset: Offset(0, 10))
              ], color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: Column(children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width * 0.6,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            image,
                          ),
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.cover),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16))),
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 25,
                            width: 40,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12)),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    Rating,
                                    style: GoogleFonts.poppins(
                                      fontSize: 14.sp,
                                      color: Colors.orange.shade600,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ]),
                          ),
                          Container(
                            height: 25,
                            width: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black38.withOpacity(0.2),
                            ),
                            child: const Icon(
                              Icons.favorite,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  child: Row(
                    children: [
                      Text(
                        mainText,
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        height: 14,
                        width: 14,
                        child: Image.asset(
                          "assets/images/verify.png",
                          filterQuality: FilterQuality.high,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                  child: Row(
                    children: [
                      Container(
                        height: 15,
                        width: 15,
                        child: Image.asset(
                          "assets/images/rider.png",
                          filterQuality: FilterQuality.high,
                        ),
                      ),
                      Text(
                        " Free Delivery",
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          color: Colors.black54,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                  child: Row(
                    children: [
                      Container(
                        height: 15,
                        width: 15,
                        child: Image.asset(
                          "assets/images/time.png",
                          filterQuality: FilterQuality.high,
                        ),
                      ),
                      Text(
                        " 10-15 mins",
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          color: Colors.black54,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Seller(),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}

void fetchData() async {
  try {
    // رابط الطلب
    var url = Uri.parse('https://example.com/api/data');

    // إرسال الطلب
    var response = await http.get(url);

    // التحقق من حالة الاستجابة
    if (response.statusCode == 200) {
      // تحويل البيانات المستلمة إلى JSON
      var data = json.decode(response.body);
      
      // استخدام البيانات بطريقة مناسبة
      print(data);
    } else {
      // إذا لم يكن الطلب ناجحًا
      print('Failed with status: ${response.statusCode}');
    }
  } catch (e) {
    // في حالة حدوث خطأ
    print('Error: $e');
  }
}