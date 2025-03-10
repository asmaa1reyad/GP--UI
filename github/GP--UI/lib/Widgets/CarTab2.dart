import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class CartTab2 extends StatelessWidget {
  const CartTab2({super.key});
  

  @override
  Widget build(BuildContext context) {
    // دالة لجلب البيانات من خلال طلب HTTP GET
    Future<void> fetchData() async {
      final url = Uri.parse('https://api.example.com/data'); // استبدل هذا برابط API الفعلي

      try {
        final response = await http.get(url);

        if (response.statusCode == 200) {
          // تحقق من نجاح الطلب
          // يمكنك استخدام response.body للوصول إلى بيانات الاستجابة
          print('Data fetched successfully: ${response.body}');
        } else {
          // إذا فشل الطلب
          print('Failed to fetch data: ${response.statusCode}');
        }
      } catch (e) {
        // إدارة الأخطاء المحتملة مثل عدم الاتصال بالإنترنت
        print('Error fetching data: $e');
      }
    }

    // استدعاء الدالة عند الحاجة، مثلاً عند بناء الصفحة أو التفاعل مع مستخدم
    fetchData();



    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(30),
            child: Container(
              height: 200,
              width: 400,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromARGB(31, 102, 101, 101),
                        blurRadius: 20,
                        spreadRadius: 1,
                        offset: Offset(10, 20)),
                  ]),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(31, 102, 101, 101),
                              blurRadius: 20,
                              spreadRadius: 1,
                              offset: Offset(10, 20),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/burgerh.jpg"))),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "3 Items",
                              style: GoogleFonts.poppins(
                                  fontSize: 14.sp, color: Colors.black54),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "soup",
                              style: GoogleFonts.poppins(
                                  fontSize: 17.sp, fontWeight: FontWeight.w500),
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 8,
                                  width: 8,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color:
                                        const Color.fromARGB(255, 63, 231, 69),
                                  ),
                                ),
                                Text(
                                  "   Order Delivered",
                                  style: GoogleFonts.poppins(
                                      fontSize: 14.sp,
                                      color: const Color.fromARGB(
                                          255, 63, 231, 69),
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Text(
                        "\LE 17.10",
                        style: GoogleFonts.poppins(
                            fontSize: 15.sp,
                            color: Colors.orange.shade800,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 40,
                        width: 140,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color.fromARGB(31, 97, 97, 97),
                                  spreadRadius: 1,
                                  blurRadius: 20,
                                  offset: Offset(0, 20)),
                            ]),
                        child: Text(
                          "Re-order",
                          style: GoogleFonts.poppins(
                              fontSize: 16.sp, color: Colors.black87),
                        ),
                        alignment: Alignment.center,
                      ),
                      Container(
                        height: 40,
                        width: 140,
                        decoration: BoxDecoration(
                            color: Colors.orange.shade800,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color.fromARGB(31, 97, 97, 97),
                                  spreadRadius: 1,
                                  blurRadius: 20,
                                  offset: Offset(0, 20)),
                            ]),
                        child: Text(
                          "Rate",
                          style: GoogleFonts.poppins(
                              fontSize: 16.sp, color: Colors.white),
                        ),
                        alignment: Alignment.center,
                      )
                    ],
                  ),
                )
              ]),
            ),
          )
        ],
      ),
    );
  }
}
