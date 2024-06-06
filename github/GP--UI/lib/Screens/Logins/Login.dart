import 'package:flutter/material.dart';
import 'package:foodhub/Screens/Dashboard.dart';
import 'package:foodhub/Screens/Logins/PhoneRegistration.dart';
import 'package:foodhub/Screens/Logins/Register.dart';
import 'package:foodhub/Screens/Logins/ResetPass.dart';
import 'package:foodhub/Widgets/password_field.dart';
import 'package:foodhub/Widgets/text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  void _loginUser() {
    if (_formKey.currentState!.validate()) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const Dashboard(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 10,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/head.png"),
                  filterQuality: FilterQuality.high,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 30),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            child: const Dashboard(),
                          ),
                        );
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
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Login",
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        color: const Color.fromARGB(221, 29, 29, 29),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Text(
                                "Email",
                                style: TextStyle(color: Colors.black54),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                            height: 15), // Adjust this value as needed
                        Text_field(
                            Maintext: "Your email or phone",
                            controller: _emailController,
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter an Email address';
                              } else if (!value.contains("@") ||
                                  !value.contains(".")) {
                                return "Please enter a valid Email address";
                              }
                              return null;
                            }),
                        const Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Text(
                                "Password",
                                style: TextStyle(color: Colors.black54),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                            height: 15), // Adjust this value as needed
                        PassTextField(
                          MainText: "Password",
                          controller: _passwordController,
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a Password';
                            } else if (value.length < 8) {
                              return "Password must be at least eight characters or greater";
                            }
                            return null;
                          },
                        ),

                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          child: ResetPass()));
                                },
                                child: Text(
                                  "Forgot password?",
                                  style: GoogleFonts.poppins(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600,
                                    color:
                                        const Color.fromARGB(255, 255, 105, 36),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Center(
                          child: Container(
                            height: 50,
                            width: 200,
                            child: ElevatedButton(
                              onPressed: _loginUser,
                              // Call the provided onPressed callback when pressed
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 255, 105, 36),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                padding: EdgeInsets.symmetric(),
                              ),
                              child: Text(
                                "Log In",
                                style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          color: const Color.fromARGB(255, 43, 43, 43),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(
                              context,
                              PageTransition(
                                  type: PageTransitionType.fade,
                                  child: Register()));
                        },
                        child: Text(
                          "Sign up",
                          style: GoogleFonts.poppins(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromARGB(255, 255, 105, 36),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Expanded(
                          child: Divider(
                            color: Color.fromARGB(255, 196, 196, 196),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            "sign up with",
                            style: GoogleFonts.poppins(
                              color: const Color.fromARGB(255, 48, 48, 48),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const Expanded(
                          child: Divider(
                            color: const Color.fromARGB(255, 196, 196, 196),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.06,
                          width: MediaQuery.of(context).size.width * 0.4,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(40),
                              boxShadow: const [
                                BoxShadow(
                                    blurRadius: 25,
                                    spreadRadius: 2,
                                    color: Colors.black12,
                                    offset: Offset(00, 20))
                              ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.04,
                                width: 40,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/facebook.png"),
                                    filterQuality: FilterQuality.high,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Facebook",
                                style: GoogleFonts.poppins(
                                  color: Color.fromARGB(255, 36, 36, 36),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.06,
                          width: MediaQuery.of(context).size.width * 0.4,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(40),
                              boxShadow: const [
                                BoxShadow(
                                    blurRadius: 25,
                                    spreadRadius: 2,
                                    color: Colors.black12,
                                    offset: Offset(00, 20))
                              ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.035,
                                width: 40,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image:
                                        AssetImage("assets/images/google.png"),
                                    filterQuality: FilterQuality.high,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Google",
                                style: GoogleFonts.poppins(
                                  color: Color.fromARGB(255, 36, 36, 36),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Seller extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            sendRequest('https://example.com/email');
          },
          child: Container(
            height: 40,
            width: 40,
          ),
        ),
        GestureDetector(
          onTap: () {
            sendRequest('https://example.com/facebook');
          },
          child: Container(
            height: 40,
            width: 40,
          ),
        ),
        GestureDetector(
          onTap: () {
            sendRequest('https://example.com/google');
          },
          child: Container(
            height: 40,
            width: 40,
          ),
        ),
      ],
    );
  }

  // الريكويست
  void sendRequest(String url) async {
    var response = await http.post(Uri.parse(url), body: {
      'email': 'email',
      'password': 'password',
    });

    if (response.statusCode == 200) {
      print('Request was successful');
    } else {
      print('Failed to send request');
    }
  }
}
