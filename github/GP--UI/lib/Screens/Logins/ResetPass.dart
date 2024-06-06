import 'package:flutter/material.dart';
import 'package:foodhub/Screens/Logins/Login.dart';
import 'package:foodhub/Widgets/password_field.dart';
import 'package:foodhub/Widgets/text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:http/http.dart' as http;

class ResetPass extends StatelessWidget {
  final _emailOrPhoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            // Container(
            //   height: MediaQuery.of(context).size.height * 10,
            //   decoration: const BoxDecoration(
            //     image: DecorationImage(
            //       image: AssetImage("assets/images/head.jpg"),
            //       filterQuality: FilterQuality.high,
            //       alignment: Alignment.topCenter,
            //     ),
            //   ),
            // ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade, child: Login()));
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
                ),
                const SizedBox(
                  height: 100,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Reset Password",
                    style: GoogleFonts.poppins(
                      fontSize: 22.sp,
                      color: const Color.fromARGB(221, 29, 29, 29),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                const Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Text(
                        "Please enter your email address to request\na new password reset",
                        style: TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25), // Adjust this value as needed
                Text_field(Maintext: "Your email or phone"),
                const SizedBox(
                  height: 25,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      sendResetPasswordRequest(_emailOrPhoneController.text);
                    }, // Call the provided onPressed callback when pressed
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 255, 105, 36),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.01800,
                        horizontal: MediaQuery.of(context).size.width * 0.1500,
                      ),
                    ),

                    child: Text(
                      "Send New Password",
                      style: GoogleFonts.poppins(
                        fontSize: 15.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void sendResetPasswordRequest(String emailOrPhone) async {
  final Uri url = Uri.parse('https://example.com/reset_password');
  final response = await http.post(
    url,
    body: {
      'email_or_phone': emailOrPhone,
    },
  );

  if (response.statusCode == 200) {
    // تم إرسال طلب إعادة تعيين كلمة المرور بنجاح
    print('Password reset request sent successfully');
  } else {
    // فشل في إرسال طلب إعادة تعيين كلمة المرور
    print('Failed to send password reset request: ${response.reasonPhrase}');
  }
}
