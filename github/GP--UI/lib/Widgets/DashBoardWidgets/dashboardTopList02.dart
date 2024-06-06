import 'package:flutter/material.dart';
import 'package:foodhub/Screens/Food_Details.dart';
import 'package:foodhub/Widgets/card.dart';
import 'package:page_transition/page_transition.dart';

class TopList2 extends StatelessWidget {
  const TopList2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        children: [
          card(
            image: "assets/images/burger small.jpg",
            mainText: "burger",
          ),
          card(
            image: "assets/images/pastasmall.jpg",
            mainText: "pasta",
          ),
          card(
            image: "assets/images/soupsmall.jpg",
            mainText: "soup ",
          )
        ],
      ),
    );
  }
}
