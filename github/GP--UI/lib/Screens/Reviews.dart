import 'package:flutter/material.dart';
import 'package:foodhub/Screens/Dashboard.dart';
import 'package:foodhub/Screens/ReviewRestaurent.dart';
import 'package:foodhub/Widgets/ReviewCard.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      Navigator.pop(
                          context,
                          PageTransition(
                              type: PageTransitionType.bottomToTop,
                              child: Dashboard()));
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
                  SafeArea(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        Row(
                          children: [
                            Text(
                              "Reviews",
                              style: GoogleFonts.poppins(
                                  color: Colors.black87, fontSize: 17.sp),
                            ),
                          ],
                        ),
                      ],
                    ),
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
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.06300,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.black12,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.1,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage("assets/images/head.jpg"),
                              filterQuality: FilterQuality.high)),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.fade,
                                  child: ReviewRestaurent()));
                        },
                        child: const Text("Write your Review"))
                  ]),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            



            ReviewCard(
              image: "assets/images/mann.jpg",
              UserName: "Ahmed ",
              Rating: "5.0",
              Date: "23/05/2024",
              BodyText: "Very delicious ,I will order again",
            ),
            ReviewCard(
              image: "assets/images/man1.png",
              UserName: "Ali  ",
              Rating: "5.0",
              Date: "25/05/2024",
              BodyText: "   Very delicious ,I will order again",
            ),
            ReviewCard(
              image: "assets/images/man2.png",
              UserName: "Nader  ",
              Rating: "5.0",
              Date: "9/06/2023",
              BodyText: "Very delicious ,I will order again",
            ),
            ReviewCard(
              image: "assets/images/man3.jpg",
              UserName: "Emad  ",
              Rating: "5.0",
              Date: "4/06/2023",
              BodyText: "Very delicious ,I will order again",
            ),
          ],
        ),
      ),
    );
  }
}
