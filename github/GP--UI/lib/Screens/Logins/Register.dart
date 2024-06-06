import 'dart:async';
import 'package:flutter/material.dart';
import 'package:foodhub/Screens/Dashboard.dart';
import 'package:foodhub/Screens/Logins/Login.dart';
import 'package:foodhub/Screens/Logins/PhoneRegistration.dart';
import 'package:foodhub/Widgets/password_field.dart';
import 'package:foodhub/Widgets/text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import '../../helper/utils.dart';
import '../select_fav_meal/select_fav_meal_screen.dart';
import '../select_fav_meal/widgets/select_fav_meal_body.dart';
import 'package:http/http.dart' as http;
class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  Uint8List? _image;

  void selectImage() async {
    Uint8List? img = await pickImage(ImageSource.gallery);
    if (img != null) {
      setState(() {
        _image = img;
      });
    }
  }

  String? addressValue = 'cairo';
  String? genderValue = 'male';

  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _addressController = TextEditingController();
  final _genderController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneNumberController.dispose();
    _addressController.dispose();
    _genderController.dispose();

    super.dispose();
  }

  void _registerUser() {
    if (_formKey.currentState!.validate()) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const SelectFavMealBody(),
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
                  image: AssetImage("assets/images/vector.png"),
                  filterQuality: FilterQuality.high,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Text(
                          "Sign up",
                          style: GoogleFonts.poppins(
                            fontSize: 24,
                            color: const Color.fromARGB(221, 29, 29, 29),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType
                                          .leftToRightWithFade,
                                      child: Dashboard()));
                            },
                            child: Text(
                              "Skip",
                              style: GoogleFonts.poppins(
                                fontSize: 15.sp,
                                color: Color.fromARGB(255, 255, 105, 36),
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  Center(
                    child: Stack(
                      children: [
                        _image != null
                            ? CircleAvatar(
                                radius: 64,
                                backgroundImage:
                                    MemoryImage(_image ?? Uint8List(0)))
                            : const CircleAvatar(
                                radius: 64,
                                backgroundImage: NetworkImage(
                                    "https://static.vecteezy.com/system/resources/thumbnails/000/495/460/small_2x/22_Profile.jpg"),
                              ),
                        Positioned(
                          bottom: -10,
                          left: 80,
                          child: IconButton(
                            onPressed: selectImage,
                            icon: const Icon(Icons.add_a_photo),
                          ),
                        ),
                      ],
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
                                "Full name",
                                style: TextStyle(color: Colors.black54),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                            height: 15), // Adjust this value as needed
                        Text_field(
                            Maintext: "Enter your name",
                            controller: _usernameController,
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a User Name to use ';
                              } else if (value.length < 4) {
                                return "User Name must be at least four characters";
                              }
                              return null;
                            }),
                        const Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Text(
                                "E-mail",
                                style: TextStyle(color: Colors.black54),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                            height: 15), // Adjust this value as needed
                        Text_field(
                            Maintext: "Enter email",
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
                            MainText: "Create password",
                            controller: _passwordController,
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a Password';
                              } else if (value.length < 8) {
                                return "Password must be at least eight characters or greater";
                              }
                              return null;
                            }),
                        const SizedBox(
                          height: 40,
                        ),
                        Center(
                          child: Container(
                            height: 50,
                            width: 200,
                            child: ElevatedButton(
                              onPressed: () {
                                _registerUser();
                              }, // Call the provided onPressed callback when pressed
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 255, 105, 36),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                padding: EdgeInsets.symmetric(),
                              ),
                              child: Text(
                                "Sign up",
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
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          color: const Color.fromARGB(255, 43, 43, 43),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.fade,
                                  child: Login()));
                        },
                        child: Text(
                          "Log in",
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
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      
    );
    
  }
 Future <void> registerUser() async {
  if (_formKey.currentState!.validate()) {
    final url = 'https://example.com/register'; // تغيير الرابط إلى الرابط الصحيح
    final response = await http.post(
      Uri.parse(url),
      body: {
        'username': _usernameController.text,
        'email': _emailController.text,
        'password': _passwordController.text,
      },
    );

    if (response.statusCode == 200) {
      // تم التسجيل بنجاح
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const SelectFavMealBody(),
        ),
      );
    } else {
      // فشل في التسجيل
      print('Failed to register user: ${response.reasonPhrase}');
    }
  }
}
}
